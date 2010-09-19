---
layout: post
title: Forking Jekyll&#58; Now With LESS and Growl Notifications
---

Introducing [tatey-jekyll](http://gemcutter.org/gems/tatey-jekyll), a [fork](http://github.com/tatey/jekyll) which adds support for compiling [LESS](http://lesscss.org) into CSS, optional [Growl](http://growl.info/) notifications with build statuses and a Liquid [permalink tag](http://wiki.github.com/tatey/jekyll/liquid-extensions) for linking to published posts. It's compatible for sites built with Jekyll 0.5.4.

### Install 

You'll need to install the [LESS gem](http://gemcutter.org/gems/less) and replace the `.css` extensions on your stylesheet with `.less`. LESS will compile your stylesheets without additional modification.

{% highlight bash %}
$ gem install tatey-jekyll -s http://gemcutter.org
{% endhighlight %}

If you're a Mac OS X user with Growl installed, you'll want to install [growlnotify](http://growl.info/documentation/growlnotify.php) (Command line tool available in Growl Extras) and the [Growl gem](http://gemcutter.org/gems/growl) which provides Ruby bindings to growlnotify.

### Motivations

Jekyll is my favourite piece of blogging software. More recently, I've been thinking about using Jekyll to build a couple of business to business orientated sites at work. We need to get them out quickly, and we're not expecting them to change frequently. A full blown content management system is overkill, and a pure static site is a maintenance nightmare. Jekyll is the perfect match. This project in combination with my working experience of Jekyll has lead to me add a couple of features which will continue to make life easier for myself and my colleagues.

### LESS

LESS is an extension to CSS which adds variables, nesting and mixins. Unlike [Sass](http://www.sass-lang.com/), LESS strives for familiarity and backwards compatibility with CSS. After migrating from LESS, my stylesheets are more organised and reusable. Take a look at the [before](http://github.com/tatey/tatey.com/blob/a3a7b4c4775963f4c8cab39fcb63d612bd29eb7a/stylesheets/screen.css) and [after](http://github.com/tatey/tatey.com/blob/fbab4798beb7c12844d44165fa52467552b9640c/stylesheets/screen.less) for tatey.com.

### Growl notifications

{% figure src: /images/posts/2009-12-05-forking-jekyll-now-with-less-and-growl-notifications/growl.jpg, caption: Growl notifications with Jekyll build statuses %}

Stop killing your browser's reload button and let Jekyll notify you when the build is complete.

### Liquid permalink tag

Link to a published post by its name and the permalink tag will be compiled into an anchor. The permalink tag will respect your post's permalink structure.

<pre>
<code>{&#37; permalink 'Earlier post', '2009-09-09-foo' &#37;}</code>
</pre>

...is compiled to

    <a href="/2009/09/09/foo/">Earlier post</a>
    
#### Notes

If you're looking for Haml and Sass compatibility, you ought to checkout [Henrik Nyh's fork](http://github.com/henrik/jekyll).

#### Updated 16 Feb 2010

My fork has been renamed to [Jekylless](http://github.com/tatey/jekylless/). [Read about the motivations](http://tatey.com/2010/02/15/my-jekyll-fork-becomes-jekylless) behind the change.
