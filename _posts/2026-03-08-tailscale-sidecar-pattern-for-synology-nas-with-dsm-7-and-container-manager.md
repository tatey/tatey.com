---
layout: post
title: Tailscale sidecar pattern for Synology NAS with DSM 7 and Container Manager
---

[Tailscale](https://tailscale.com) lets you connect your devices over the internet as if they were on the same local network. Its MagicDNS feature gives each device a stable hostname so you can reach them with something like `foo.yourtailnet.ts.net` instead of an IP address. You get the convenience of being able to access services remotely, but they're protected by a private network.

I use [Container Manager](https://www.synology.com/en-br/dsm/feature/docker) on my Synology NAS to self-host services. Tailscale can be installed as a client directly into [DSM](https://www.synology.com/en-us/dsm), but any self-hosted service needs to be exposed on distinct ports since they share the same Tailscale interface. While there is nothing technically wrong with this, remembering `foo.yourtailnet.ts.net:61209 ` is not particularly elegant.

You can use the Docker sidecar pattern to run a Tailscale interface alongside your primary service. Here is a YAML configuration I figured out for self-hosting [Glances](https://github.com/nicolargo/glances):  

```
version: "3.9"

services:
  glances-tailscaled:
    image: tailscale/tailscale:latest
    restart: unless-stopped
    environment:
      - TS_AUTHKEY=tskey-auth-REDACTED
      - TS_HOSTNAME=glances                            # Hostname will be something like glances.yourtailnet.ts.net
      - TS_EXTRA_ARGS=--advertise-tags=tag:app         # Recommended so you can write rules in your Tailscale ACL for this target
      - TS_SIMPLE_SERVE_CONFIG=http://127.0.0.1:61208  # Traffic is routed to this address
      - TS_ACCEPT_DNS=false
      - TS_USERSPACE=true                              # Must run in userspace on DSM, otherwise the tunnel will never be created
      - TS_STATE_DIR=/var/lib/tailscale
    volumes:
      - glances_tailscale_state:/var/lib/tailscale

  glances:
    image: nicolargo/glances:latest
    restart: unless-stopped
    network_mode: "service:glances-tailscaled"         # Bind to the Tailscale interface
    depends_on:
      - glances-tailscaled
    environment:
      - GLANCES_OPT=-w
    volumes:
      - /proc:/host/proc:ro
      - /sys:/host/sys:ro

volumes:
  glances_tailscale_state:
```

![Screenshot of Safari displaying Synology DSM with Container Manager opened. Inside Container Manager there is a project with a YAML configuration](/images/posts/2026-03-08-tailscale-sidecar-pattern-for-synology-nas-with-dsm-7-and-container-manager-screenshot-2026-03-08-at-9-07-01-pm.png)

This approach uses configuration to avoid custom scripting and maximises compatibility with any docker image. Minimal maintenance.
