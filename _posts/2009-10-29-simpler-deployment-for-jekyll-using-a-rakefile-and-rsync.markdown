---
layout: post
title: Simpler Deployment for Jekyll Using a Rakefile and rsync
---

Earlier [I wrote about using Git and its post-receive hooks for deployment](/2009/04/29/jekyll-meets-dreamhost-automated-deployment-for-jekyll-with-git.html). After using this configuration for six months, I've concluded that it's unnecessarily complicated for my requirements. [Scott Kyle](http://appden.com/personal/journey-to-jekyll/) and [Ben Vinegar](http://www.benlog.org/2009/10/8/blog-now-powered-by-jekyll/) agree. Using such a configuration makes perfect sense for projects residing on GitHub. The repository already exists, and it's a complimentary service that you don't have to configure. In future, when someone asks me how they should deploy Jekyll, I will recommend using a [Rakefile](http://github.com/tatey/tatey.com/blob/master/Rakefile) and rsync. Thanks to Scott Kyle for sharing his [Rakefile](http://github.com/appden/appden.github.com/blob/master/Rakefile).

#### Updated 2009-11-02 {: .note }

[Wolfgang König](http://wulfovitch.de/) brought to my attention that you can exclude files from being copied in the build using the exclude option. I've appended `exclude: ['Rakefile', 'README.markdown']` to `_config.yml`. 
{: .note }
