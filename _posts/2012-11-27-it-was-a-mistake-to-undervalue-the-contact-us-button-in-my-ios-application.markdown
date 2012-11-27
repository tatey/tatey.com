---
layout: post
title: It was a Mistake to Undervalue the &ldquo;Contact Us&rdquo; Button in my iOS application
---

I'm talking about the "Contact Us" button you see hidden away in the "About" screen of your favourite iOS app. The way it works is you tap "Contact Us" and a new email pops up with the *to* and *subject* pre-filled. Seems like a lot of work, especially when the email is already linked to from iTunes and the app's website. I had never used one myself and naively assumed that nobody uses them. After adding a "Contact Us" button to [Antenna Mate](http://antennamate.com/), I've received more emails this month than I have in the last three months.

Most of the emails were "I love your app, but..." and validating some [old assumptions](http://tatey.com/2011/01/09/planning-the-future-of-antenna-mate/) I had forgotten about. I used this feedback to drive a major enhancement which I'm hoping will continue to strengthen the app's position as the best in its category. But more importantly, it gave me a dialogue with my customers. I'm looking forward to emailing them back and going "Hey, I listened, and here you go".

Sure you're going to receive more emails, but this dialogue can pay off. One of my customers wants the app in New Zealand (It's Australia only) so badly that they found and linked me to the New Zealand data. Something I had spent thirty minutes trying to find, but couldn't.

In case you're wondering what to put in the "Contact Us" button. It opens up a `MFMailComposeViewController` that sets the email to the support email address and the subject to "Antenna Mate vX.X.X Feedback" leaving the customer to focus on the content. If email isn't configured on the device they get an alert "We tried to open an email - Email isn't configured on this device. Try sending an email to support@antennamate.com from your computer. We'd love to have your feedback".
