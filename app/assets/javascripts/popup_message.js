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
