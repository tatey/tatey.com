---
layout: post
title: My Jekyll Fork Becomes Jekylless
---

Formally published as tatey-jekyll, the project has been renamed to Jekylless for two reasons:

1. [Wolfgang König](http://wulfovitch.net/) agreed to co-maintain the project with me. 
1. Show the project's support for [LESS CSS](http://lesscss.org/).

As a result, the [repository has moved](http://github.com/tatey/jekylless/) and you should now use the [Jekylless gem](http://gemcutter.org/gems/jekylless) instead of tatey-jekyll. When upgrading to Jekylless be sure to include an empty YAML front matter (Two lines of triple dashes `---`) in your LESS files. Wolfgang recently merged Jekyll 0.5.7, refactored LESS CSS support and added the capability to specify a post's time in the YAML front matter (You didn't really publish all your posts at 12AM, did you?). We'll continue to stay as close as possible to Jekyll. 

#### Updated 2011-04-16

With the introduction of plugins, [wulfovitch](http://github.com/wulfovitch) and I realised we could convert most of the functionality from Jekylless into plugins. We'd no longer need to maintain a fork and everyone could mix and match. Unfortunately the Growl plugin would need to hook into Jekyll before and after the build process. We [submitted a patch](https://github.com/mojombo/jekyll/issues/issue/214), but it never gained any traction. Wanting to move forward, we've resorted to monkey patching a Generator to get Growl notifications happening. Enjoy!
