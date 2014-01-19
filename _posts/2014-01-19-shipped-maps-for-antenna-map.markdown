---
layout: post
title: Shipped&#58; Maps for Antenna Mate
---

[Maps for Antenna Mate][1] is an experimental web application for finding and linking to transmitters in your browser. It's built entirely with AngularJS + Jekyll and hosted on S3 + Cloudfront for extra low latency goodness.

I decided to [open source the code][2] as a learning tool for new developers. When I started with AngularJS I wish I could have gotten my hands on real-world code. There are thousands of snippets scattered over blogs but by themselves you get an incomplete picture. How do you run tests? Where should files be placed? How do you perform a deploy?

I'm also hoping it will boost the sales of [Antenna Mate for iOS][3], or at least compliment it. Maps is for finding transmitters ahead of time and requires an internet connection. The app is for finding the best transmitter from your current location and plotting a bearing. It's blazingly fast and doesn't require an internet connection. By having distinct applications it allows me to keep the products simple and the scope tight.

[AngularJS][4] is an absolute joy to develop with. What Ruby on Rails did for the backend in 2007, AngularJS is doing for the frontend in 2014.

[1]: http://maps.antennamate.com
[2]: https://github.com/tatey/maps.antennamate.com
[3]: http://antennamate.com
[4]: http://angularjs.org
