(function() {
  $(window).scroll(function() {
    var nav_drop, nav_trans, scroll;
    scroll = $(window).scrollTop();
    nav_trans = ".navbar-brand, .navbar-right li a";
    nav_drop = ".navbar, .dropdown-menu";
    if (scroll > 0) {
      $(nav_drop).addClass("active");
      $(nav_trans).addClass("white");
      $(nav_trans).removeClass("dark");
    } else {
      $(nav_drop).removeClass("active");
      $(nav_trans).removeClass("white");
      $(nav_trans).addClass("dark");
    }
  });

}).call(this);
