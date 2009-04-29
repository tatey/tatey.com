---
layout: post
title: Jekyll meets DreamHost. Automated deployment for Jekyll with Git
---

It has been just under a month since I launched this blog, and the first thing I promised myself was to automate deployment. If you have an existing [GitHub](http://github.com) account you might want to consider [GitHub Pages](http://pages.github.com/), it's quick and easy.

### Why not GitHub Pages?

* CNAME support (Eg: tatey.com) is reserved for paid GitHub accounts
* No desire for a private repository. We host our repositories in-house at work
* Existing [DreamHost](http://dreamhost.com) customer
* Excuse to play with Git hooks

### How will it work?

I am interested in achieving the same functionality offered by GitHub Pages with DreamHost. That is, a single push automatically generates the site, removing the pain of manually copying files and directories.

We are going to create a bare repository for pushing to. Every time you push, we will use the post-receive hook to execute a Bash script. The Bash script clones the repository with a working directory, executes [jekyll](http://github.com/mojombo/jekyll/tree/master) and cleans up. [Hooks](http://www.kernel.org/pub/software/scm/git/docs/githooks.html) in Git behave like events.

### Preparing a Jekyll-friendly environment

Jekyll is not available on DreamHost. You will need to build your own RubyGems and install Jekyll with its dependancies. John Nunemaker has written an excellent [guide](http://railstips.org/2008/11/25/rubygems-yours-mine-and-ours).

If you are interested in code highlighting, you will also want to install [Pygments](http://pygments.org/). Pygments is a Python syntax highlighter that Jekyll uses to parse and wrap your code snippets in the appropriate HTML tags.

{% highlight bash %}
$ mkdir ~/lib/python
$ echo 'export PYTHONPATH="$HOME/lib/python:/usr/lib/python2.3"' >> ~/.bash_profile
$ source ~/.bash_profile
{% endhighlight %}

Download and build Pygments from source.

{% highlight bash %}
$ cd ~/src
$ wget http://pypi.python.org/packages/source/P/Pygments/Pygments-1.0.tar.gz
$ tar -xvzf Pygments-1.0.tar.gz
$ cd Pygments-1.0
$ python setup.py install --home=$HOME
{% endhighlight %}

### Git it all together

Initialise a bare repository to push to. It is potentially dangerous to push to a remote repository with a working directory.

{% highlight bash %}
$ mkdir ~/src/your_git_repo.git
$ cd ~/src/your_git_repo.git
$ git --bare init
{% endhighlight %}

Add DreamHost as a remote in your local repository.

{% highlight bash %}
$ git remote add dreamhost ssh://user@server.com/home/user/src/your_git_repo.git
{% endhighlight %}

Write a Bash script to clone the repository, execute Jekyll and clean up. Jekyll will generate its output in to your publicly accessible directory.

{% highlight bash %}
# ~/bin/generate_public_www
#!/bin/bash
GIT_REPO=$HOME/src/your_git_repo.git
TMP_GIT_CLONE=$HOME/tmp/your_git_repo
PUBLIC_WWW=$HOME/var/www/your_site

git clone $GIT_REPO $TMP_GIT_CLONE
jekyll $TMP_GIT_CLONE $PUBLIC_WWW --pygments
rm -Rf $TMP_GIT_CLONE
exit
{% endhighlight %}

{% highlight bash %}
$ chmod +x ~/bin/generate_public_www
{% endhighlight %}

Add the Bash script in the post-receive hook of your bare repository. Hooks are Bash scripts too.

{% highlight bash %}
# ~/src/your_git_repo.git/hooks/post-receive
#!/bin/sh
$HOME/bin/generate_public_www
exit
{% endhighlight %}

{% highlight bash %}
$ chmod +x ~/src/your_git_repo.git/hooks/post-receive
{% endhighlight %}

### Programmers should be lazy

Congratulations, you're done! Every time you push to DreamHost, Jekyll will build the site. Cool, huh?!

{% highlight bash %}
$ git push dreamhost master
{% endhighlight %}

Bonus: You now have a redundant copy of your repository.