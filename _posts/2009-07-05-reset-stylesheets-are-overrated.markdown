---
layout: post
title: Reset Stylesheets are Overrated
---

I've recently been involved in a project where the designer insisted on using a [reset stylesheet](http://meyerweb.com/eric/tools/css/reset/).

> Reset stylesheets are necessary to eliminate the rendering inconsistencies between browsers by resetting elements to a common baseline.

It is [not critical for a website to appear identical between browsers](http://dowebsitesneedtolookexactlythesameineverybrowser.com/) because no one is going to visit the website in multiple browsers. Only the designer will be aware of \[any\] browser inconsistencies.

> Reset stylesheets require significant effort for minimal benefit.

Delivering projects on time and within budget is paramount. Productivity is understanding where to invest time to yield the maximum benefit. The benefit of eliminating rendering inconstancies between browsers is outweighed by the time required to maintain it.

* Increased stylesheet complexity. Redefine all the elements which have been reset
* Additional external stylesheet. That's another GET request, right?
* Larger file size than what would have been, had a reset stylesheet been avoided

I've written thousands of lines of CSS, and have never had the desire to reset an entire stylesheet. In a majority of use cases, browser defaults are satisfactory. Learn to work with them to your advantage, rather than against them.
