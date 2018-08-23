$(document).ready(function() {
  $(document).on('click', '#popup_click', function(e) {
    $(document.body).append('<div id="popup_text"></div>');
    $('#popup_text').dialog({
          modal: true,
          open: function(){
            $('#popup_text').html('Текст для проверки вывода информациии.');
          },
          close: function(){
            $(this).dialog('destroy');
            $(this).remove();
          }
      });
      var $dialog = $(".ui-dialog");
      $dialog.addClass("modal-content");
  });
});

// $(function(){
//       $("[data-tooltip]").mousemove(function (eventObject) {
//           $data_tooltip = $(this).attr("data-tooltip");
//           $("#tooltip").html($data_tooltip)
//               .css({
//                 "top" : eventObject.pageY + 5,
//                 "left" : eventObject.pageX + 5
//               })
//               .show();
//           }).mouseout(function () {
//             $("#tooltip").hide()
//               .html("")
//               .css({
//                   "top" : 0,
//                   "left" : 0
//               });
//       });
// });

$(function() {
    var $tooltip = $("#tooltip");

    $("[data-tooltip]")
        .mousemove(function ( eventObject ) {

            $tooltip.text( $(this).data("tooltip") )
                .css({
                    "top" : eventObject.pageY + 5,
                    "left" : eventObject.pageX + 5
                })
                .show();

        })
        .mouseout(function () {

            $tooltip.hide()
                .empty()
                .css({
                    "top" : 0,
                    "left" : 0
                });

        });

});

$(function () {
  $('.real-show-hint').on("click", function(e){
    e = e || window.event;
    e.preventDefault();
    var ypos = $(this).offset().top+24;
    var xpos = $(this).offset().left;
    var RealHint =  $(this).data('hint');
    $(RealHint).css('top',ypos);
    $(RealHint).css('left',xpos);
    $(RealHint).toggle('fast');
    return;
    });

  $('.prm-cross').on('click', function(){
    $(this).parent().hide('fast');
    return false;
  });

});
