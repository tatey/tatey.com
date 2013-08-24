---
layout: post
title: Shipped&#58; Delayed::Web GUI for Delayed::Job
---

[Delayed::Web](https://github.com/thebestday/delayed-web) is a rails engine that provides a simple web interface for exposing the [Delayed::Job](https://github.com/collectiveidea/delayed_job) queue. Installation is simple. Add one line to your gemfile and mount the engine in your routes file.

![]({% asset_path posts/2013-08-24-shipped-delayed-web-gui-for-delayed-job/687474703a2f2f662e636c2e6c792f6974656d732f316a326d326732323373337133333134305333482f53637265656e25323053686f74253230323031332d30362d3133253230617425323031312e34372e3537253230504d2e706e67.png %})

Despite the popularity of Redis backed queues we use Delayed::Job. We intentionally strive to keep our stack as simple as possible. Delayed::Job lets us keep a single database. Secondly, we're hiring at [TheBestDay](https://www.thebestday.com) and I wanted to show off the way we think about writing code to potential candidates.

If you're interested in working with us, [drop me an email](mailto:tate@tatey.com).
