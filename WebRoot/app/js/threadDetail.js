/**
 * 显示回复框
 * @param {Number} idx li元素下标
 * */
function showReplyFoo(idx) {
    var liObj = document.getElementsByClassName('com-tail');
    for (var i = 0; i < liObj.length; i++) {
        liObj[i].style.display = "none";
    }
    liObj[idx].style.display = "block";
}