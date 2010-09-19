---
layout: post
title: Quotes is a Sinatra Application for Browsing and Submitting IRC Quotes
---

Having frequented IRC since 1999, I've always been disappointed with existing [quote](http://www.quoteirc.com/) [submission applications](http://www.ircquote.org/) for their [ugliness](http://bash.org/). Itching to try out [Sinatra](http://www.sinatrarb.com/), [Sequel](http://sequel.rubyforge.org/) and [jQuery](http://jquery.com/) I started (re)writing Quotes [last coding night](http://twitter.com/tatejohnson/status/4915592887). From the code, to the design and ultimately the user experience; the objective of Quotes was to be simple. I wanted users to receive immediate feedback for any action that's performed. I want quotes to be so pretty that you'd scroll up and down the page a couple of times. 

It has a tiny footprint. There's only three models, a few actions and a couple of views. Without caching it's still fast to load on a resource limited environment, such as DreamHost. Sinatra was a perfect match for this tiny project. [Code](http://github.com/tatey/quotes) is on GitHub and you can view a [live example of the application](http://quotes.tatey.com/). Thanks to #lolbot on irc.freenode.com for the motivation, [Ashley Kyd](http://ash.ms/) for the concept and [Pascal Klein](http://klepas.org/) for the initial design.
