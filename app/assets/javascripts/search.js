$(document).on('turbolinks:load', function(){
  $(".field-1").autocomplete({
    source: "/reviews/autocomplete",
    autoFocus: true,
    minLength: 1
  })
});
