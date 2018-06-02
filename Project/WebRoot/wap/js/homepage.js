$(function () {
    var queryStr = location.search;
    var tests = location.href;
    var mainList = $(".mainListArea");
    var infoList = $(".infoListArea");
    var subList = $(".subListArea");
    var listObj = $(".listArea");
    //alert(test);
    // 决定是显示主页还是显示对应列表
    if (tests.indexOf("info_ListShow")>=0||tests.indexOf("subsql=info_type")>=0) {
        mainList.hide();
        infoList.show();
        subList.show();
    } 
    else if(tests.indexOf("info_SearchShow")>=0||tests.indexOf("info_Edit")>=0){
        mainList.hide();
        infoList.show();
        subList.hide();
    }
    else {
        infoList.hide();
        mainList.show();
        subList.hide();
    }
})

function viewInfoFun(id, typeid) {
    // location.href = 'info_ListShow.action?infoType='+typeid+'&tiptop='+id;
    location.href = "wapthread_threadShow.action?threadId=" + id;
}

function deleteThread(id) {
    console.log("id:" + id)
    $.ajax({
        type: 'post',
        url: 'wapinfo_Edit.action',
        data: id,
        dataType: 'json',
        success: function () {
            console.log(data)
        }
    })
}