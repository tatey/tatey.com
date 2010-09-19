(function($) {
  /**
   * Default LaTeX-like formatting cannot be achieved with pure CSS. We
   * need to provide additional elements and classes which can be styled
   * with CSS. 
   *
   * Specifically:
   *
   *   - Paragraphs after headings are not indented.
   *   - Extra whitespace after periods. 
   *
   * @return jQuery
   */
  $.fn.paragraph = function() {
    return this.each(function() {
      var $this = $(this);
      if (!$this.prev()[0] || $this.prev()[0].nodeName.match(/^(HEADER|H[1-6])$/i)) {
        $this.addClass('noindent');
      }
      $this
        .html(
          $this
            .html()
            .replace(/\.(\s+)/g, '<span class="period">.</span>$1')
        )
        .addClass('hyphenate');
    });
  }
  
  $(document).ready(function() {
    // Default LaTeX formatting
    $('p').paragraph();
    
    // Hyphenate paragraphs
    Hyphenator.run();
    
    // Google Analytics
    try {
      _gat._getTracker("UA-8340632-1")._trackPageview();
    } catch(e) {}
  });
})(jQuery);
