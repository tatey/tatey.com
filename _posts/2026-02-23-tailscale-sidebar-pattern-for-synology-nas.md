---
layout: post
published: false
title: Tailscale sidebar pattern for Synology NAS
---

‘’’
version: "3.9"

services:
  glances-tailscaled:
    image: tailscale/tailscale:latest
    restart: unless-stopped
    environment:
      - TS_AUTHKEY=tskey-auth-REDACTED
      - TS_HOSTNAME=glances
      - TS_EXTRA_ARGS=--advertise-tags=tag:app
      - TS_SIMPLE_SERVE_CONFIG=http://127.0.0.1:61208
      - TS_ACCEPT_DNS=false
      - TS_USERSPACE=true
      - TS_STATE_DIR=/var/lib/tailscale
    volumes:
      - glances_tailscale_state:/var/lib/tailscale

  glances:
    image: nicolargo/glances:latest
    restart: unless-stopped
    network_mode: "service:glances-tailscaled"
    depends_on:
      - glances-tailscaled
    environment:
      - GLANCES_OPT=-w
    volumes:
      - /proc:/host/proc:ro
      - /sys:/host/sys:ro

volumes:
  glances_tailscale_state:
'''
	
