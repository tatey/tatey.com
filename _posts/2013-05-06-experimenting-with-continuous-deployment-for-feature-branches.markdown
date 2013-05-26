---
layout: post
title: Experimenting With Continuous Deployment for Feature Branches
---

At work we've been [experimenting with a tool](https://twitter.com/tatejohnson/status/311268504995254273) that deploys our project to a staging environment every time a developer pushes to GitHub. If the branch has already been deployed, it will drop, create and seed the database. If the branch has never been deployed, it will provision a new instance. The end result is the same. A usable, working instance of the project accessible to anyone in the company, especially non-developers. You could think of it as continuous deployment for feature branches.

Internally the tool is known as Tug and it deploys straight from GitHub to Heroku. Tug announces when the deploy has finished in Campfire along with the URL. There's also a dashboard for quickly seeing which branches have been deployed and their URLs. You can also get a log of the output captured from the API and command line to troubleshoot any problems. To date, we've had 10 failed deploys out of 460.

[![]({% asset_path posts/2013-05-06-experimenting-with-continuous-deployment-for-feature-branches/tug_thumb.png %})]({% asset_path posts/2013-05-06-experimenting-with-continuous-deployment-for-feature-branches/tug.png %})

Tug works well for us because we use feature branches heavily for development. We're a small team, but it's not uncommon to have 2 or 3 concurrent branches. The last thing we want to be thinking about is how are we going to get some early feedback from other people in the company. Even as a developer, it's nice to be able to look at a pull request and then go and try the code out without having to mess around with my local repository.

What I'm trying to gauge is whether other developers would find this useful in their organisation, or if we have our processes wrong. This idea is not unique to me. We practised this process without the automation at [Everyday Hero](http://everydayhero.com) and the guys at [Ennova](http://ennova.com.au) shipped [Koi Deploy](https://koideploy.com/) for Rails Rumble.

#### Updated 2013-05-20

[View the slides](https://speakerdeck.com/tatey/experimenting-with-continuous-deployment-for-feature-branches) from my lightning talk which I gave at [Sydney DevOps](http://www.meetup.com/devops-sydney/) on 16th May, 2013.
