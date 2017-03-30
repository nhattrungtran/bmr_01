$(document).ready(function(){
  //MAIN SEARCH
  $('.main-search input[name=radio]').change(function() {
    var showForm = $(this).val();
    $('.form').hide();
    $('#'+showForm).show();
  });

  //MY ACCOUNT EDIT FIELDS
  $('.edit_field').hide();
    $('.edit').on('click', function (e) {
      e.preventDefault();
      $($(this).attr('href')).toggle('slow', function(){});
    });
  $('.edit_field a,.edit_field input[type=submit]').click(function() {
    $('.edit_field').hide(400);
  });

  //TABS
  $('.tab-content').hide().first().show();
  $('.inner-nav li:first').addClass('active');

  $('.inner-nav a').on('click', function (e) {
    e.preventDefault();
    $(this).closest('li').addClass('active').siblings().removeClass('active');
    $($(this).attr('href')).show().siblings('.tab-content').hide();
  var currentTab = $(this).attr('href');
  if (currentTab == '#location')
  initialize();
  });
  var hash = $.trim( window.location.hash );
  if (hash) $('.inner-nav a[href$=''+hash+'']').trigger('click');

  $('.f-item .radio').click(function() {
    $('.f-item').removeClass('active');
    $(this).parent().addClass('active');
  });

  //SCROLL TO TOP BUTTON
  $('.scroll-to-top').click(function () {
    $('body,html').animate({
      scrollTop: 0
    }, 800);
    return false;
  });

  $('.top-right-nav li:last-child,.social li:last-child,.twins .f-item:last-child,'+
    '.ribbon li:last-child,.room-types li:last-child,.three-col li:nth-child(3n),'+
    '.reviews li:last-child,.three-fourth .deals .one-fourth:nth-child(3n),'+
    '.full .deals .one-fourth:nth-child(4n),.locations .one-fourth:nth-child(3n),'+
    '.pager span:last-child,.get_inspired li:nth-child(5n)').addClass('last');
  $('.bottom nav li:first-child,.pager span:first-child').addClass('first');

  //ROOM TYPES MORE BUTTON
  $('.more-information').slideUp();
  $('.more-info').click(function() {
    var moreinformation = $(this).closest('li').find('.more-information');
    var txt = moreinformation.is(':visible') ? '+ more info' : ' - less info';
    $(this).text(txt);
    moreinformation.stop(true, true).slideToggle('slow');
  });
 // LIST AND GRID VIEW TOGGLE
  $('.view-type li:first-child').addClass('active');

  $('.grid-view').click(function() {
    $('.three-fourth article').attr('class', 'one-fourth');
    $('.three-fourth article:nth-child(3n)').addClass('last');
    $('.view-type li').removeClass('active');
    $(this).addClass('active');
  });

  $('.list-view').click(function() {
    $('.three-fourth article').attr('class', 'full-width');
    $('.view-type li').removeClass('active');
    $(this).addClass('active');
  });

//LOGIN & REGISTER LIGHTBOX
  $('.close').click(function(event) {
    event.preventDefault;
    $('.lightbox').hide();
  });

});
