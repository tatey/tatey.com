---
layout: post
title: From iPhone to iPhone and iPad. Turning Antenna Mate into a Universal Application.
published: false
---

After deciding that Antenna Mate would be available for iPad I researched how other developers were building universal applications. There are two routes. Fork and create a new application or turn the existing application into a universal one. The most suitable route is dependant on the application. 

I've always disliked buying the same application twice, but some behave very differently between iPad and iPhone. The device's display, idioms and hardware impose constraints (or create opportunities) that would have you building an entirely new application. In this scenario, it makes sense to have distinct applications.

Distinct applications did not make sense for Antenna Mate. With less free time than I'd like, maintaining a second application was unappealing. More importantly, the user experience on the iPad could remain largely unchanged from its iPhone counterpart. I knew I wanted to turn Antenna Mate into a universal application.

Apple's documentation and many developer's frequently recommended a branching pattern for doing something different based on the device. I believe that such a pattern encourages important details to become hidden under nesting and blow out the size of classes. 


If you're doing something different, surely it could be better encapsulated in its own class. An inspiring post by X Y boasted about the introduction of distinct windows and subclassing in Xcode 4. 

With a combination of subclassing and thought out conventions it would be possible to reuse as much as code as possible.

So, just how many classes does it take to make Antenna Mate? This many.
