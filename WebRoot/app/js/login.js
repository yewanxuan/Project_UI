$(function () {
    $(".userLogin").click(function () {
        $(".loginArea").show();
        $(".registerArea").hide();
    })
    $(".userRegister").click(function () {
        $(".loginArea").hide();
        $(".registerArea").show();
    })
})
