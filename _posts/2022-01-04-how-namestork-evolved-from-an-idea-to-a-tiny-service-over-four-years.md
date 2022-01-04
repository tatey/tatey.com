---
title: How Namestork evolved from an idea to a tiny service over four years
layout: post
---

This is the story behind my tiny service, [Namestork](https://namestork.app). It brings nine names to you and your partner's inbox once a day at a time of your choosing. If you're looking for a calm way to find the perfect name for your baby consider trying it.

# Idea

In 2017 my partner and I were expecting our second child and we weren’t happy with any of the names we had. We were overwhelmed with scrolling endless A-Z lists. We were tired of putting down each others’ suggestions. We didn’t know if we were having a girl or a boy. Our baby was 6 months away and all we could feel was this pressure to come up with a name.

Why were we rushing it? We had time on our side. We wanted to move at a slower, calmer pace. That's when the idea came to us. What if we could get a handful of names delivered to our inbox once a day? A mix of popular and unique names that we could look at in the morning along with our newsletters. We could favourite the names we liked, and if we both favourited the same name, we'd get told about our match. If we didn't like any of the names, that's ok, we could calmly move on knowing we'd get more the next day.

I began to imagine how the service might work, but I didn't know if it was going to help us find a baby name. I was determined for it to be a sustainable hobby so I set myself two constraints. The first was to budget my time to a few hours a week. The second was to imagine the least I could get away with, and when I imagined that, I challenged myself to get away with even less.

# Test #1: What's it like to get a daily email with random baby names?

The first thing I wanted to test was the medium. My plan was to email a list of random baby names once a day, similar to how you might get daily newsletters sent to your inbox. If I could get away with email then I could expirement faster because I wouldn't need to make native apps for iOS and Android.

I sat at my computer and typed `rails new`. I defaulted everything. I used Minitest. I used callbacks. I wrote fat controllers. I was cheating and my progress was flying. After four nights over two weeks I had created a basic service. My partner and I were getting random baby names in our inboxes. We could tap a name to favourite it. We got another email when we had a match. There was no way to sign up or sign in. There was no user interface or customisation. There was no way to stop the emails or see favourites. Just [random baby names from public datasets](https://github.com/tatey/list_of_baby_names) I scraped together. 

My partner and I didn't get many matches, but when we did, we both knew we had a baby name to talk about over dinner. The matches we got become our shortlist and the random names we were being exposed to widened our perspective. We had heard some of these names before, but we weren't considering them because they were outside our sphere, so rediscovering them was a delight. We weren't putting down each other's suggestions anymore. We weren't feeling pressure anymore. It was fun!

# Test #2: Would it work with other people?

The next thing I wanted to test was other people using the service. The service was working well for us and we were having fun, but would it work for other people and would they have fun too?

I needed a domain for the web and mail server, but I didn't want to get stuck here. I quickly registered something a bit long, but completely unambigious: findmeababyname.com. We invited our friends, our co-workers, and anyone we knew who was expecting. To my delight people wanted to try it out so I typed `rails console` and created a record in the database to sign them up. They found some invalid names like "infant" and "unknown". They found a bug where the favorite link would sometimes break because of how I expired tokens. Mostly, they told me what they liked, and what they didn't, and no one wanted to stop the emails. I could see names were being favourited and matches were being made.

The basic service was working, but it would take months before I learned if it helped anyone find a baby name. My next decision was between going deeper on the mechanics or designing the user interface. Given most people seemed satisfied with how the mechanics worked, I opted to polish what was already there over adding new features. I opened Sketch and [designed the daily list of baby name suggestions](https://dribbble.com/shots/4017603-List-of-baby-name-suggestions-by-Namestork). This is the most important screen people landed on it when they favorited a name from their inbox. I didn't design any more screens in Sketch. With this mock up as inspiration I designed the rest of the user interface straight in HTML and CSS. I like working on nice things and now the service looked nice enough.

# Hiatus

At the start of 2018 we welcomed our baby into the world and the service had given us a handful of matches. If we had a girl she would have been Willow, but we had a boy, so we named him Hamish (Dean was a close second). It worked! We calmly found a name for our baby.

The service was sending about 50 emails a day, and while it worked for us, taking it to the next level wouldn't be sustainable at this time in my life. My partner and I had a new human we were responsible for. No one could sign up. There was still a weird bug with expired tokens. The service would need to be maintained and the servers would need to be patched. It wasn't generating any revenue.

One of the neat things about sending an email once a day is you already have a way to reach out to people. When I made changes to the service I would place a paragraph at the top to give everyone a heads up. I used this technique to announce my decision to shutdown the service and set the reply-to to my personal email address. I waited until people told me they copied down their shortlists and then I shut the service down and let the domain expire.

# Test #3: Launch on Product Hunt

At the end of 2020 I caught up with a friend who had welcomed their second child that year. They shared with me the name they gave their child came from the service. I was chuffed. I was looking to pick up a hobby again so I dusted off the service with the intent to launch publically.

Over the next few weeks I made it so you could sign up, invite your partner (or not!), stop the emails, change the time of day, and filter based on gender. I wanted to test if people would sign up cold and I wanted to test if they'd sign up knowing the service would be supported by classified ads. I didn't do the work to put the ads in because I was trying to get away with the least, but I wanted to see if stating it would deter people. This is an excerpt from the home page:

> We run a single classified ad at the bottom of the daily email. There's no tracking. There's no spy pixels. We don't sell or share any data with the advertiser. The only data the advertiser knows is they're running an ad on Namestork.

I had let findmeababyname.com expire so I needed a domain. I didn't like the old domain and decided to think of something new. I like names that are short, descriptive, and fun. I wanted something people could remember, type into a search engine, and find from the first result. I came up with Namestork, like a stork that brings you baby names. Someone already had the .com which was a bit of a bummer, but undeterred I registered namestork.app. 

I've been a long time lurker on Product Hunt, but I've never posted before. I noticed the posts I usually upvote have a nice logo, impactful description, a few screenshots, and a compelling home page. I thought this would give me the best chance of success so I set out to replicate it. I [bought and customised a stock logo](https://mastodon.social/@tatey/106513613651379845), decorated some screenshots, wrote an FAQ on the home page, and [launched on Product Hunt](https://www.producthunt.com/posts/namestork). It didn't get in the top 10, but [people did sign up](https://mastodon.social/@tatey/106539251805874111), and at its peak the service was sending about 500 emails a day.

# What's next?

I have two goals.

The first is to improve the service. I'm sitting on a tonne of feedback and I've got a few ideas on how to refine the mechanics, like flitering based on culture. 

The second is to make the service sustainable. It's costing me about US$25/m when you factor in the VPS, backups, mail, and monitoring. I'm not convinced people would pay a monthly subscription for the service, so I'd like to expirement with running a single classified ad which doesn't share data back to the advertiser. I think this could be a good compromise between sustainabilty and privacy. This model is common in other regular emails, like newsletters.

If you're looking to diplomatically find the perfect name for your baby consider trying [Namestork](https://namestork.app). If you have any thoughts, questions, or comments I'd love to hear them. Drop me an email [tate@tatey.com](mailto:tate@tatey.com?subject=Namestork).
