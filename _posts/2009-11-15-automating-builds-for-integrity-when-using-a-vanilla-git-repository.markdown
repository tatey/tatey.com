---
layout: post
title: Automating builds for Integrity when using a vanilla Git repository
---

[Integrity](http://integrityapp.com/) is a light-weight continuous integration server.

It supports automatically building your projects when you configure a [post-receive hook on GitHub](http://help.github.com/post-receive-hooks/) to POST to your installation of Integrity. If you're not using GitHub, you can still achieve automated builds using a similar mechanism.

A quick look at the *Fetch and build* button on the project page reveals the URL you need to POST for initiating a build. Create an executable script and include it in the post-receive hook of your vanilla Git repository.

{% highlight rb %}
#!/usr/bin/env ruby
require 'net/http' 
Net::HTTP.post_form(
  URI.parse('http://server:9292/project-name/builds'), ''
)
{% endhighlight %}

If you're using Rails you'll want to run your migrations before running your tests. Create a Rakefile for continuous integration.

{% highlight rb %}
desc "Runs migrations and all tests"
task :ci => ['db:migrate', 'test', 'cucumber']
{% endhighlight %}

Lastly, update the build script for your project to run the continuous integration task.

`rake ci`
