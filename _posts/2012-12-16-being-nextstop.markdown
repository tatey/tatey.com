---
layout: post
title: Behind Next Stop
published: false
---

The project began a year ago after the Brisbane City Council made the locations of every bus stop in Brisbane available under an open license. I only worked on the project for up to 8 hours per week and since then I've had to deal with bad data, changing data, changing jobs, moving cities and managing somewhat of a social life.

The bus stops by themselves were useless. When catching new routes, I never knew the stop to get off at. I wanted to tell Next Stop the route I was on and where I was going. Next Stop would find the closest bus stop and would alert me after leaving the second last stop. I didn't want to keep the app open, and I don't want to configure anything. I'm terrible at judging distance, so asking me to set an alarm at 500m before is useless. How far is that? Is there another stop in between?

I began working on a scraper that collected the bus routes, times and stops from the TransLink website. I could them match the bus stop data from the Brisbane City Council on name and position on the street. This technique allowed me to reliably match about 85% of the stops on a strict criteria. Unfortunately both TransLink and the Brisbane City Council were missing data. I was pretty pissed off and put the project on the back burner.

A few months later TransLink completely revamped their website. The most attractive addition to me was the location data for each bus stop. I changed the scraper to collect the location data and could reliably source all of the data from a single source. This gave me the motivation to start building the iOS app. I had a working prototype in a few weeks which I was testing everyday on the way to work with promising results.

Going from prototype to shipping app was an enormous effort. My first area of focus was pinning down the workflow. I had a dozen sketches of how it should work, but nothing beats handing the app over for someone to use. The feedback I received informed the final version of the workflow you experience today. Next came adding Core Data for persistence, then searching, then battery optimisation, then diagnostics followed by the website and marketing copy. A beta was distributed to testers after milestone.

Next Stop is by no means finished. I have a tonne of enhancements I want to include, but its in a state where its ready for everyday commuters to use. Lastly, Next Stop would not have existed without the support I had from Jason Weathered, Rachael Battle and Odin Dutton. All of them provided the feedback and motivation I needed to ship Next Stop. Thanks guys.
