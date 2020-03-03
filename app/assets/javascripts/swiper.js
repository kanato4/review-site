window.addEventListener('turbolinks:load', function() {
  var mySwiper = new Swiper('.swiper-container', {
    loop: true,
    autoHeight: true,
    navigation: {
      nextEl: '.swiper-button-next',
      prevEl: '.swiper-button-prev'
    },
    pagination: {
      el: '.swiper-pagination',
      type: 'bullets',
      clickable: true
    }
  });
}, false);