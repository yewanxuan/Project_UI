/**
 * 判断是否为PC
 * @return {Boolean} isFlag PC为true,移动设备为false
 * */
function isPC() {
    var agentInfo = navigator.userAgent;
    var devices = new Array("Android", "iPhone", "SymbianOS", "Windows Phone", "iPad", "iPod");
    var isFlag = true;
    for (var i = 0; i < devices.length; i++) {
        if (agentInfo.indexOf(devices[i]) > 0) {
            isFlag = false;
            return isFlag;
        }
    }
    return isFlag;
}