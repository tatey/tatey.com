---
layout: post
title: A LaTeX Default Formatting Inspired Design
time: '15:37'
---

Since the start of the academic year, I've authored my documents in LaTeX. LaTeX documents are gorgeous to read and the source of inspiration for the new design of tatey.com. If you haven't read a LaTeX document before, take a look at the [apacite package documentation](http://www.ctan.org/tex-archive/biblio/bibtex/contrib/apacite/apacite.pdf). 

I have gone to great lengths to replicate LaTeX default formatting on the web. CSS3 `font-face` provides the Computer Modern Unicode font and JavaScript provides additional elements and classes to style. You'll note that the first paragraph after a heading is not indented and there is extra whitespace after periods in sentences. More importantly, the page still looks great if JavaScript or CSS3 is unavailable. In addition, there is a stylesheet for small and medium sized displays such as the iPhone and iPad. Oh, and it's HTML5 (Not that it means anything, but all the cool kids are doing it. Right?).

### Updated 2010-09-24 {: .note }

[Peter pointed out](http://twitter.com/riddle/status/25386100717) you can use the immediate sibling selector to not indent the first paragraph after a heading. I've been doing CSS for years and have never known. Always learning, love it.
{: .note }
