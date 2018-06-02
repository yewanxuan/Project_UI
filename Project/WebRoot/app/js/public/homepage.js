$(function () {
    var queryStr = location.search;
    var tests = location.href;
    var mainList = $(".mainListArea");
    var infoList = $(".infoListArea");
    var subList = $(".subListArea");
    var listObj = $(".listArea");
    //alert(test);
    // 决定是显示主页还是显示对应列表
    if(tests.indexOf("info_SearchShow")>=0||tests.indexOf("info_Edit")>=0){
        mainList.hide();
        infoList.show();
        subList.show();
    }
    else if(tests.indexOf("index.action")>=0){
        infoList.hide();
        mainList.show();
        subList.hide();
    }
})

function viewInfoFun(id, typeid) {
    //location.href = 'info_ListShow.action?infoType='+typeid+'&tiptop='+id;
    location.href = "thread_threadShow.action?threadId=" + id;
}