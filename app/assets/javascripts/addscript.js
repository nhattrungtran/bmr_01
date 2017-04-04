$(document).ready(function(){
  //MY ACCOUNT EDIT FIELDS
  $('.edit_field').hide();
    $('.edit').on('click', function (e) {
      e.preventDefault();
      $($(this).attr('href')).toggle('slow', function(){});
    });
  $('.edit_field a,.edit_field input[type=submit]').click(function() {
    $('.edit_field').hide(400);
  });

});
