---
title: Coniguring DNS-over-HTTPS with UniFi OS and AdGuard
layout: post
---

UniFi OS introduced the ability to encrypt DNS traffic using [DNS-over-HTTPS](https://en.wikipedia.org/wiki/DNS_over_HTTPS) with custom servers some time in 2024. [Ubiquiti](https://www.ui.com/) call this feature DNS Shield.

I use [AdGuard DNS](https://adguard-dns.io) as a hosted alternative to [Pi-hole](https://pi-hole.net) for blocking trackers and ads in my home network. AdGuard DNS has long supported DNS-over-HTTPS, but UniFi OS only got first party support recently. Configuration should be easy, but neither Ubiquiti or AdGuard have up-to-date documentation.

Here's how to configure DNS-over-HTTPS with UniFi OS and AdGuard DNS:

1. Go to the [AdGuard Dashboard](https://adguard-dns.io/en/dashboard/) and find the settings for your UniFi OS router
2. Scroll to _Encrytped DNS server addresses_ and take note of DNS-over-HTTPS URL (e.g. https://d.adguard-dns.com/dns-query/123456abc)
3. Go to [DNSCrypt DNS Stamp Calculator](https://dnscrypt.info/stamps/) and set:
    - _Protocol_ to DNS-over-HTTPS
    - _Host name_ to d.adguard-dns.com
    - _Path_ to /dns-query/123456abc
4. Copy the Stamp URL (e.g. sdns://AgcAAAAAA...)
5. Go to the Security settings in UniFi OS (e.g. https://router.local/network/default/settings/security) and set:
    - _DNS Shield_ to Custom
    - _Server Name_ to "AdGuard DNS"
    - _DNS Stamp_ to value in your pasteboard
6. Press _Apply Changes_
7. Go to the [Adguard Diagnostics page](https://adguard.com/en/test.html), scroll to _AdGuard DNS_. If you see "Protocol: DNS-over-HTTPS" you're good to go ✅

See also:
- [How to create your own DNS stamp for Secure DNS](https://adguard-dns.io/kb/miscellaneous/create-dns-stamp/)
- [Has anyone figured out this custom DNS added in? I add my DNS stamp using a DNS stamp calculator and nothing happens. It defaults to Google. Using ControlD](https://www.reddit.com/r/Ubiquiti/comments/1f2yv6s/has_anyone_figured_out_this_custom_dns_added_in_i/)
