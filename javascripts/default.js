---
---

(function() {
  /**
   * LaTeX-like default formatting cannot be achieved with pure CSS. We
   * need to provide additional elements and classes to hook in to.
   *
   * Specifically:
   *
   *  - Paragraphs after headings are not indented.
   *  - Extra whitespace after periods. 
   *
   * @return Void
   */
  function paragraph(ps) {
    for (var i = 0; i < ps.length; i++) {
      var p  = ps[i],
          s  = p.previousSibling,
          cs = ['hyphenate'];
      while (s && s.nodeType != 1) {
        s = s.previousSibling;
      }
      if (!s || s.nodeName.match(/^(HEADER|H[1-6])$/)) {
        cs.push('noindent');
      }
      p.innerHTML = p.innerHTML.replace(
        /\.(\s+)/g, 
        '<span class="period">.</span>$1'
      );
      p.setAttribute(
        'class',
        cs.concat((p.getAttribute('class') || '').split(' ')).join(' ')
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
