---
layout: post
title: I built a native macOS app to do my quarterly BAS with OpenCode
---

For the last 15 years I have been selling [Antenna Mate](https://antennamate.com) on the App Store, and every quarter that means submitting a Business Activity Statement (BAS) to report on my Goods and Services Tax (GST) obligations _(Paying our tax is important!)_.

My workflow has largely been the same. Download invoices from App Store Connect, gather business purchases, paste everything into a spreadsheet, calculate GST, then copy the numbers into the Australian Tax Office (ATO) portal. It's not glamorous, but it's routine and portable.

For years I have wished for a little macOS app where I could drag in PDFs and it would figure everything out for me. No spreadsheet. No accountant. No scripting. Just a focused tool for my workflow. Every time I was tempted, the complexity relative to what Antenna Mate earns would put me off.

Two weekends ago the equation flipped. I used [OpenCode](https://opencode.ai) and GPT 5.3 to prompt an entire app into existence with no manual editing. The result is a fully native, SwiftUI backed macOS app called _Ugh BAS_.

![Screenshot of BAS pane showing GST totals](/images/posts/2026-03-01-i-built-a-native-macos-app-to-do-my-quarterly-bas-with-opencode-screenshot-2026-03-01-at-10-41-53-am.png)
![Screenshot of purchases pane showing list of invoices/receipts](/images/posts/2026-03-01-i-built-a-native-macos-app-to-do-my-quarterly-bas-with-opencode-screenshot-2026-03-01-at-10-42-14-am.png)

It has a sidebar with quarters, and within each quarter there are screens for sales, purchases, and a GST summary. When I drag in screenshots of App Store Connect reports and PDF invoices the app queues up jobs for processing. Each job extracts text using Vision.framework, sends the text to an LLM (OpenAI in this case, but could be any provider), gets back structured JSON, renders the result in a table, and calculates the GST totals automatically (and instantly!). I still log into the ATO portal and paste the numbers myself, but the parts of my workflow that make me go "Ughhhhh" are gone.

What impressed me most is I haven't compiled a macOS app in over a decade, nor have I developed with SwiftUI (you can guess the last time I developed with Cocoa in earnest), and yet I was able to make a polished app in one focused weekend. It has all the little affordances of a [Mac-arsed app](https://daringfireball.net/linked/2020/03/20/mac-assed-mac-apps) such as native controls, keyboard shortcuts, and comfortable conventions (even if it is Tahoe 😅). 

The work was not writing code, or figuring out individual APIs. It was designing the user experience, modelling the data flows, and proving my idea one iteration at a time. The toggling between plan and build mode in OpenCode felt like a quality pairing session that made the architecture better.

First, I started small and prompted a Ruby CLI that took PDFs, extracted the text with tesseract, and generated a spreadsheet. The fidelity of text it extracted wasn't good enough, so I sent the text to an LLM and it got all the details perfectly.

Then, I prompted a macOS app that called out to the Ruby CLI and rendered the results in a table. Once I proved that worked, I iterated on the UI until I got something semi-polished. I also didn't use Xcode. I prompted a make-esque script that did everything from the CLI, including killing the running app and launching it again to keep the feedback loop tight.

Finally, I prompted an entire rewrite of the Ruby CLI into a "Swift engine" and continued to polish the UI until it felt like a truly Mac-arsed app. If I didn't tell anyone I had done it with OpenCode, they'd be none the wiser.

The cost of proving out ideas has collapsed. Granted, this is low stakes and not depended on by 1000s of people, but ideas which previously seemed out of reach can be potentially proved out in a focused weekend. "Ugh BAS" will never be published. It is a local, opinionated, beautiful macOS app built exactly for my workflow.

![Screenshot of creating a new quarter](/images/posts/2026-03-01-i-built-a-native-macos-app-to-do-my-quarterly-bas-with-opencode-screenshot-2026-03-01-at-10-52-23-am.png)

Now every financial quarter I will fire it up, drag in my documents, copy the totals, and lodge my BAS in the ATO portal in under 5 minutes. No spreadsheet, just my wish come true.
