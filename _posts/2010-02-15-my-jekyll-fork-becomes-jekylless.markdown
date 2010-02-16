---
layout: post
title: My Jekyll fork becomes Jekylless
time: '22:33'
---

Formally published as tatey-jekyll, the project has been renamed to Jekylless for two reasons:

1. [Wolfgang König](http://wulfovitch.net/) agreed to co-maintain the project with me. 
1. Show the project's support for [LESS CSS](http://lesscss.org/).

As a result, the [repository has moved](http://github.com/tatey/jekylless/) and you should now use the [Jekylless gem](http://gemcutter.org/gems/jekylless) instead of tatey-jekyll. When upgrading to Jekylless be sure to include an empty YAML front matter (Two lines of triple dashes `---`) in your LESS files.

Wolfgang recently merged Jekyll 0.5.7, refactored LESS CSS support and added the capability to specify a post's time in the YAML front matter (You didn't really publish all your posts at 12AM, did you?).

We'll continue to stay as close as possible to Jekyll. 
