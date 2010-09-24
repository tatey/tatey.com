---
---

(function() {
  /**
   * LaTeX-like default formatting cannot be achieved with pure CSS. We
   * need to provide additional elements and classes to hook in to.
   *
   * Specifically:
   *
   *  - Extra whitespace after periods. 
   *
   * @return Void
   */
  function paragraph(ps) {
    for (var i = 0; i < ps.length; i++) {
      var p = ps[i];
      p.innerHTML = p.innerHTML.replace(
        /\.(\s+)/g, 
        '<span class="period">.</span>$1'
      );
      p.setAttribute(
        'class',
        (p.getAttribute('class') || '') + ' hyphenate'
      );
    }
  }
  
  DomReady.ready(function() {
    // LaTeX-like default formatting
     paragraph(document.getElementsByTagName('p'));

     // Hyphenate paragraphs
     Hyphenator.run();

     // Google Analytics
     _gat._getTracker("UA-8340632-1")._trackPageview();
  });
})();
