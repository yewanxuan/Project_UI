$(function () {
    $(".userLogin").click(function () {
        $(".loginArea").show();
        $(".registerArea").hide();
        $(".loginFrame").css("height", "440px");
    })
    $(".userRegister").click(function () {
        $(".loginArea").hide();
        $(".registerArea").show();
        $(".loginFrame").css("height", "600px");
    })
})