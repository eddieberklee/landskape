$(function() {
    $("#showbutton").click(function() {
        expanded = $(".user-bio").css("height") !== "0px";
        if (expanded) {
            $(this).html("show")
        }
        else {
            $(this).html("hide")
        }
        $(".user-bio").animate({
            height: (expanded ? "0px" : "100px")
        }, 200);
    });
});
