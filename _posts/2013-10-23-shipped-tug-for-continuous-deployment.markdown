---
layout: post
title: Shipped&#58; Tug for Continuous Deployment
---

In April I wrote about [experimenting with continuous deployment for feature branches](/2013/05/06/experimenting-with-continuous-deployment-for-feature-branches). Now I'm happy to announce [Tug is available to everyone for free while in beta](http://tugapp.com). Basically, you configure a template and then it creates a staging instance on Heroku for every branch that's pushed to GitHub. When the branch is merged, the instance is torn down. Everything is logged for troubleshooting and the dashboard shows you what is deployed and where.

At work it's become an integral part of shipping. We use Tug to get product changes in the hands of everyone at the company. That means developers can focus on slinging code and non-technical people can quickly give feedback. In addition, because our staging environments are identical to our production environments it lets us experiment with changing the stack, switching environment variables and getting external testers on board. Basically, we know that if our tests pass and staging deploys then we can confidently ship to production.

Now your team can get from this this too. [Try out Tug](http://tugapp.com). Would love to get your feedback.
