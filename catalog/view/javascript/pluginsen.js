
//Cart SideNav
function opencart() {
    document.body.classList.add("active");
    document.getElementById("cartnav").style.left = "0";
}

/* Set the width of the side navigation to 0 */
function closecart() {
    document.body.classList.remove("active");
    document.getElementById("cartnav").style.left = "-100%";
}

$(document).ready(function () {
    "use strict";
     $('.slider-for').slick({
          slidesToShow: 1,
          slidesToScroll: 1,
          arrows: false,
          fade: true,
          asNavFor: '.slider-nav'
     });
        $('.slider-nav').slick({
           slidesToShow: 4,
          slidesToScroll: 1,
          asNavFor: '.slider-for',
          dots: false,
          focusOnSelect: true,
        });
});