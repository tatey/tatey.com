---
layout: post
title: Git Rebase For Linear History
---

Subject&#58; Suggestion to rebase after committing and before pushing  
To&#58; Development Team  
Date&#58; 20 April 1:54:29 PM

### What's the issue?

Looking at our history, I've noticed that there is a lot of "Merge branch 'master' of XYZ". Technically, this is fine but I feel it obscures the important history of the repository. No one cares that there was a merge, and following funky, rainbow lines in [GitX](http://gitx.frim.nl/) is unnecessary effort.

### Why does this happen?

Sometimes it's unavoidable. If you've been developing on a separate branch, you're eventually going to have to merge it in to master. I'm not talking about that. In fact, you'd probably **want** to know about that merge. Let's look at a simplified scenario for a merge we don't care about.

'X' and 'Y' pull from the repository at 9AM. 'X' works on a patch, commits, pulls and pushes to the repository at 9:30AM. 'Y' works on a patch, commits, pulls and pushes to the repository at 10AM. Sounds good, right? Pulling is equivalent to fetching and merging, resulting in "Merge branch 'master' of XYZ" and more funky, rainbow lines.

### Suggestion

You could stash your changes, pull, pop and push. That's great until you have about 2 or 3 commits you want to push. Plus, I don't  want to have to think about this. Enter rebase.

You can rebase your "local/master" branch against "origin/master". This is not the same as rebasing an already shared branch, because your commits have not been published. You should __never__ rebase something you've already pulled down. Suggested workflow might look something like this.

{% highlight bash %}
$ git commit
$ git pull
$ git rebase -i origin/master
$ git push origin master
{% endhighlight %}

This has the advantage that you don't need to execute the last two commands if there is nothing new pulled down from the second command. It also gives you a chance to squash commits into something more meaningful. Sometimes you want to do this, sometimes it's better to keep them separate. I'll leave that to you. Generally this isn't an issue, but last week we saw a flurry of commits to the repository. Such a process would keep the history nice and linear.

Cheers, Tatey

PS: I've been secretly doing this.

#### Updated 2010-02-26

Lincoln Ramsay pointed out that `git pull` takes an optional `--rebase` argument. [Read the manual for an example](http://www.kernel.org/pub/software/scm/git/docs/git-pull.html).
