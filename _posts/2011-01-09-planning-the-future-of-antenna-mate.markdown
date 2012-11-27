---
layout: post
title: Planning the Future of Antenna Mate
---

[Antenna Mate's](http://antennamate.com) future is increased flexibility, more relevant data and availability in foreign markets. The app was originally conceptualised by [Adrian Frost](http://twitter.com/adrianfrost) out of the frustration of aligning TV antennas and allocating channels in commercial MATV installations. Antenna Mate was designed around use cases that supported the nature of Adrian's work without considering user cases for other demographics. 

After the beta it became apparent that caraveners and motorhome owners were equally as interested in Antenna Mate as professional installers. Both demographics share use cases. Where they diverge on is the emphasis to plan ahead versus more relevant data for making informed decisions. The difficulty in planning the future of Antenna Mate is continuing to satisfy both demographics without compromising the simplicity of the app. My default stance is to satisfy the majority with good defaults and minimise the amount of options. Options increase complexity and smell of a poorly thought out design. Balancing feature requests with code maintenance and a good user experience feels completely polarised.

Having read feature requests from users over and over, similarities begin to emerge and you start to understand what users really want even if they're unsure how to express it. Users make feature requests from the perspectives of their understanding/experience and respective demographic without any consideration for code maintenance or user experience. User feedback is critical, but it's important to carefully evaluate feature requests in a larger context. I value all of my users feedback. Their ideas ultimately seed bigger ideas to the benefit of everyone. As a result, I'm pleased to list the following features that should satisfy a majority of the feature requests I've received to date.

1. **Increase search radius to 150 km** from 100 km. 100 km is an arbitrary limit based on the assumption that users aren't interested in broadcasting sites far away (and performance constraints). Turns out I was wrong.
1. **Spectrum analyser** that lists the theoretical signal strength of each transmitter from your current location. Provides more relevant data for professional installers and is a dependancy for the next feature.
1. **Finding the strongest broadcasting** site as opposed to the closest broadcasting site. Distance isn't necessarily an indicator of the strongest broadcasting site when the transmitters are low powered. Suitable for users in regional areas who prefer major broadcasting sites instead of local, low powered retransmitters. 
1. **Change current location to an arbitrary location**. You search for a location by city, town or suburb and Antenna Mate finds the strongest broadcasting site. This feature will depend on an internet connection for establishing the latitude and longitude of the desired location. In addition, it enables users to get around the 150 km limit. 
1. **Universal app**. When you release an app on the App Store, Apple lists the devices the app is compatible with based on features the developer specifies as dependencies. Turns out the iPad Wifi+3G has a digital compass. Custom graphics and views will need to be created. 
1. **Availability in foreign markets**. The US and UK have a huge caraveners and motorhome demographic who could benefit from Antenna Mate. Moreover, Antenna Mate makes minimal use of the english language, preferring recognisable symbols. Such a design is the perfect candidate for internationalisation opening the possibility of entry into the European market. The biggest barrier to entry is legally attaining transmitter data and collaborating with local testers. Australian's are fortunate that the [ACMA provides this data](http://www.acma.gov.au/WEB/STANDARD/pc=PC_9150) under a Creative Commons licence. 

#### Updated 2012-11-27

Over one year later the search radius was increased to 150km, the default site was changed from the closest to the strongest and became a universal app.

#### Updated 2012-11-27

A spectrum analyser will not be added. The app is successful because it has great defaults. You typically use a spectrum analyser to find the best signal and I am doing that already by estimating the maximum theoretical field strength.

#### Updated 2012-11-27

Changing the current location to an arbitrary location will not be added. The entire user interface is built around where you are now and plotting a bearing to that transmitter. Changing your location invalidates the user interface.

#### Updated 2012-11-27

Availability in foreign markets is still something on my to do list. I haven't been able to find a good source of data in the UK and in the US it appears that people are interested in multiple broadcasting sites at completely different directions. The current user interface assumes only a single broadcasting site.
