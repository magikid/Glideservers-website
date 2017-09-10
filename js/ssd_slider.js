    // ______________ VPS SLIDER
    (
      function($, undefined) {
        $.ui.slider.prototype.options =
        $.extend({},
          $.ui.slider.prototype.options, {
            paddingMin: 0,
            paddingMax: 0
          }
          );
        $.ui.slider.prototype._refreshValue =
        function() {
          var
          oRange = this.options.range,
          o = this.options,
          self = this,
          animate = (!this._animateOff) ? o.animate : false,
          valPercent,
          _set = {},
          elementWidth,
          elementHeight,
          paddingMinPercent,
          paddingMaxPercent,
          paddedBarPercent,
          lastValPercent,
          value,
          valueMin,
          valueMax;
          if (self.orientation === "horizontal") {
            elementWidth = this.element.outerWidth();
            paddingMinPercent = o.paddingMin * 100 / elementWidth;
            paddedBarPercent = (elementWidth - (o.paddingMin + o.paddingMax)) * 100 / elementWidth;
          } else {
            elementHeight = this.element.outerHeight();
            paddingMinPercent = o.paddingMin * 100 / elementHeight;
            paddedBarPercent = (elementHeight - (o.paddingMin + o.paddingMax)) * 100 / elementHeight;
          }
          if (this.options.values && this.options.values.length) {
            this.handles.each(function(i, j) {
              valPercent =
              ((self.values(i) - self._valueMin()) / (self._valueMax() - self._valueMin()) * 100) * paddedBarPercent / 100 + paddingMinPercent;
              _set[self.orientation === "horizontal" ? "left" : "bottom"] = valPercent + "%";
              $(this).stop(1, 1)[animate ? "animate" : "css"](_set, o.animate);
              if (self.options.range === true) {
                if (self.orientation === "horizontal") {
                  if (i === 0) {
                    self.range.stop(1, 1)[animate ? "animate" : "css"]({
                      left: valPercent + "%"
                    }, o.animate);
                  }
                  if (i === 1) {
                    self.range[animate ? "animate" : "css"]({
                      width: (valPercent - lastValPercent) + "%"
                    }, {
                      queue: false,
                      duration: o.animate
                    });
                  }
                } else {
                  if (i === 0) {
                    self.range.stop(1, 1)[animate ? "animate" : "css"]({
                      bottom: (valPercent) + "%"
                    }, o.animate);
                  }
                  if (i === 1) {
                    self.range[animate ? "animate" : "css"]({
                      height: (valPercent - lastValPercent) + "%"
                    }, {
                      queue: false,
                      duration: o.animate
                    });
                  }
                }
              }
              lastValPercent = valPercent;
            });
} else {
  value = this.value();
  valueMin = this._valueMin();
  valueMax = this._valueMax();
  valPercent =
  ((valueMax !== valueMin) ? (value - valueMin) / (valueMax - valueMin) * 100 : 0) * paddedBarPercent / 100 + paddingMinPercent;
  _set[self.orientation === "horizontal" ? "left" : "bottom"] = valPercent + "%";
  this.handle.stop(1, 1)[animate ? "animate" : "css"](_set, o.animate);
  if (oRange === "min" && this.orientation === "horizontal") {
    this.range.stop(1, 1)[animate ? "animate" : "css"]({
      width: valPercent + "%"
    }, o.animate);
  }
  if (oRange === "max" && this.orientation === "horizontal") {
    this.range[animate ? "animate" : "css"]({
      width: (100 - valPercent) + "%"
    }, {
      queue: false,
      duration: o.animate
    });
  }
  if (oRange === "min" && this.orientation === "vertical") {
    this.range.stop(1, 1)[animate ? "animate" : "css"]({
      height: valPercent + "%"
    }, o.animate);
  }
  if (oRange === "max" && this.orientation === "vertical") {
    this.range[animate ? "animate" : "css"]({
      height: (100 - valPercent) + "%"
    }, {
      queue: false,
      duration: o.animate
    });
  }
}
};
$.ui.slider.prototype._normValueFromMouse =
function(position) {
  var
  o = this.options,
  pixelTotal,
  pixelMouse,
  percentMouse,
  valueTotal,
  valueMouse;
  if (this.orientation === "horizontal") {
    pixelTotal = this.elementSize.width - (o.paddingMin + o.paddingMax);
    pixelMouse = position.x - this.elementOffset.left - o.paddingMin - (this._clickOffset ? this._clickOffset.left : 0);
  } else {
    pixelTotal = this.elementSize.height - (o.paddingMin + o.paddingMax);
    pixelMouse = position.y - this.elementOffset.top - o.paddingMin - (this._clickOffset ? this._clickOffset.top : 0);
  }
  percentMouse = (pixelMouse / pixelTotal);
  if (percentMouse > 1) {
    percentMouse = 1;
  }
  if (percentMouse < 0) {
    percentMouse = 0;
  }
  if (this.orientation === "vertical") {
    percentMouse = 1 - percentMouse;
  }
  valueTotal = this._valueMax() - this._valueMin();
  valueMouse = this._valueMin() + percentMouse * valueTotal;
  return this._trimAlignValue(valueMouse);
};
}
)(jQuery);
      var vpsnameval = new Array('SSD-128', 'SSD-256', 'SSD-512', 'SSD-1024', 'SSD-2048 + 2 Free IPv4'); //VPS plan names
      var memoryval = new Array('128 MB', '256 MB', '512 MB', '1024 MB', '2048 MB'); //Memory array per plan
      var cpuval = new Array('1 Core', '2 Cores', '2 Cores', '3 Cores', '4 Cores'); //CPU array per plan
      var diskspaceval = new Array('5 GB', '10 GB', '20 GB', '40 GB', '80 GB'); //Disk Space array per plan
      var bandwidthval = new Array('1 TB', '3 TB', '6 TB', '12 TB', '24 TB'); //Bandwidth array per plan
      var decimalval = new Array('.49', '.49', '.99', '.49', '.49'); //Decimal array per plan
      var priceval = new Array('1', '3', '5', '12', '22'); //Price array per plan
      var urlval = new Array('33', '23', '25', '28', '29'); //WHMCS pid array per plan
      var finalurl = 'https://www.glideservers.com/clients/cart.php?a=add&pid='; //Update "whmcs.audemedia.com" with your WHMCS/billing system installation URL
      var starting_point = 3; //Where the slider stops on first page load. Ideal to sign a plan as popular.
      $(document).ready(function() {
        $("#vps-slider").slider({
          range: 'min',
          animate: true,
          min: 1,
              max: 5, //Update this if you less or more plans
              paddingMin: 0,
              paddingMax: 0,
              slide: function(event, ui) {
                $('.vps-prices-container #vps_name_option span.how_much').html(vpsnameval[ui.value - 1]);
                $('.vps-prices-container #disk_space_option span.how_much').html(diskspaceval[ui.value - 1]);
                $('.vps-prices-container #memory_option span.how_much').html(memoryval[ui.value - 1]);
                $('.vps-prices-container #cpu_option span.how_much').html(cpuval[ui.value - 1]);
                $('.vps-prices-container #bandwidth_option span.how_much').html(bandwidthval[ui.value - 1]);
                $('.vps-prices-container #price_amount').html(priceval[ui.value - 1]);
                $('.vps-prices-container a.order-vps').attr('href', finalurl + urlval[ui.value - 1]);
                $('.vps-prices-container #decimal').html(decimalval[ui.value - 1]);
              },
              change: function(event, ui) {
                $('.vps-prices-container #vps_name_option span.how_much').html(vpsnameval[ui.value - 1]);
                $('.vps-prices-container #disk_space_option span.how_much').html(diskspaceval[ui.value - 1]);
                $('.vps-prices-container #memory_option span.how_much').html(memoryval[ui.value - 1]);
                $('.vps-prices-container #cpu_option span.how_much').html(cpuval[ui.value - 1]);
                $('.vps-prices-container #bandwidth_option span.how_much').html(bandwidthval[ui.value - 1]);
                $('.vps-prices-container #price_amount').html(priceval[ui.value - 1]);
                $('.vps-prices-container a.order-vps').attr('href', finalurl + urlval[ui.value - 1]);
                $('.vps-prices-container #decimal').html(decimalval[ui.value - 1]);
              }
            });
  $("#amount").val("$" + $("#vps-slider").slider("value"));
  $('#vps-slider').slider('value', starting_point);
  $('.vps-plan').click(function() {
    tt_amount = parseInt(this.id.slice(5)) + 1;
    $('#vps-slider').slider('how_much', tt_amount);
  });
});
   // ______________ ACCORDION ICONS
   $('.collapse').on('show.bs.collapse', function(){
    var i = $(this).parent().find('i')
    i.toggleClass('fa-plus-square-o fa-minus-square-o');
  }).on('hide.bs.collapse', function(){
    var i = $(this).parent().find('i')
    i.toggleClass('fa-minus-square-o fa-plus-square-o');
  });
</script>
<script>
  (function($) {
    "use strict";
    window.odometerOptions = {
      format: 'd'
    };
    $(window).load(function() {
       // ______________ COMPARISON TABLE SHOW/HIDE
       $('#show-comparison-table').click(function() {
        $('.products-table').toggle("slow");
      });
     // ______________  PRICE SWITCH
     $(".price-per-period .permonth").click(function() {
      $(".monthprice").fadeIn(500);
      $(".yearprice").hide();
      $(".twoyearprice").hide();
      $(".price-per-period .permonth").addClass("btn-shared-checked");
      $(".price-per-period .permonth").removeClass("btn-default");
      $(".price-per-period .peryear").removeClass("btn-shared-checked");
      $(".price-per-period .peryear").addClass("btn-default");
      $(".price-per-period .per2yrs").removeClass("btn-shared-checked");
      $(".price-per-period .per2yrs").addClass("btn-default");
    });
     $(".price-per-period .peryear").click(function() {
      $(".monthprice").hide();
      $(".yearprice").fadeIn(500);
      $(".twoyearprice").hide();
      $(".price-per-period .permonth").removeClass("btn-shared-checked");
      $(".price-per-period .permonth").addClass("btn-default");
      $(".price-per-period .peryear").addClass("btn-shared-checked");
      $(".price-per-period .peryear").removeClass("btn-default");
      $(".price-per-period .per2yrs").removeClass("btn-shared-checked");
      $(".price-per-period .per2yrs").addClass("btn-default");
    });
     $(".price-per-period .per2yrs").click(function() {
      $(".monthprice").hide();
      $(".yearprice").hide();
      $(".twoyearprice").fadeIn(500);
      $(".price-per-period .permonth").removeClass("btn-shared-checked");
      $(".price-per-period .permonth").addClass("btn-default");
      $(".price-per-period .peryear").addClass("btn-default");
      $(".price-per-period .peryear").removeClass("btn-shared-checked");
      $(".price-per-period .per2yrs").removeClass("btn-default");
      $(".price-per-period .per2yrs").addClass("btn-shared-checked");
    });
   });
jQuery(document).ready(function() {
  $('.odometer').waypoint(function() {
   setTimeout(function(){
    $('#odometer1.odometer').html(510);
  }, 500);
   setTimeout(function(){
    $('#odometer2.odometer').html(81825);
  }, 1000);
   setTimeout(function(){
    $('#odometer3.odometer').html(920);
  }, 1500);
   setTimeout(function(){
    $('#odometer4.odometer').html(8000);
  }, 2000);
   setTimeout(function(){
    $('#odometer5.odometer').html(5001);
  }, 2500);
   setTimeout(function(){
    $('#odometer6.odometer').html(392);
  }, 3000);
 }, { offset: 800, triggerOnce: true });
});
})(jQuery);