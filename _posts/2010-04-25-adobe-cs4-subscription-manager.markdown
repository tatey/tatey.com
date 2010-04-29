---
layout: post
title: Adobe CS4 Subscription Manager
published: false
---

If you want to remove the Subscription Manager from launching on login, these are the culprits. 

/private/etc/mach_init_per_user.d/com.adobe.subscriptionManagerCS4.monitor.plist
/Library/LaunchAgents/SubscriptionManagerCS4.plist
