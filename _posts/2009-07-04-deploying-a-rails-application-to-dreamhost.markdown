---
layout: post
title: Deploying a Rails Application to DreamHost
---

Earlier this week I [successfully deployed](http://twitter.com/tatejohnson/status/2402841913) a rails 2.3.2 application to DreamHost. Deployment is quick and easy if you know what to do.

1. Enable [Phusion Passenger](http://www.modrails.com/) in the DreamHost panel
1. Point the path to your rails public directory
1. Freeze rails and your application's gem dependencies
1. Restart Passenger with $ touch ~/path/to/rails/app/tmp/restart.txt

On first request it's slow to load as Passenger launches a Ruby instance. With some page caching, you'll be able to negate this. I wouldn't usually recommend deploying to a shared hosting environment. However, this application was for fun, with a tiny audience and performance is not a constraint.
