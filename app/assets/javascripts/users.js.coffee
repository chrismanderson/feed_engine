# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

function setClickable() {
   $('#edit_in_place').click(function(){ ... });
 }

 .click(function(event){ 
  var $editable = $(this);
  if ($editable.hasClass('active-inline')){
    return;
  }
  var contents = $.trim($editable.html().replace();

 }).blur(function(event){ 
 });

 $editable
    .addClass('active-inline')
    .empty();