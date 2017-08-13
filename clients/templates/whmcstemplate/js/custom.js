(function($){
  "use strict";

// ______________ RESPONSIVE MENU
  $('#navigation').superfish({
    delay: 300,
    animation: {
      opacity: 'show',
      height: 'show'
    },
    speed: 'fast',
    dropShadows: false
  });

  $(function() {
    $('#navigation').slicknav({
      label: "",
      closedSymbol: "&#8594;",
      openedSymbol: "&#8595;"
    });
  });

})(jQuery);