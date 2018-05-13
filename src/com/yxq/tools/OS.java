package com.yxq.tools;

public class OS {
    /*
    * 判断是win还是Mac操作系统
    * */
    public static boolean getMacStatus () {
        String osName = System.getProperties().getProperty("os.name");
        if (osName.indexOf("mac")>=0 || osName.indexOf("Mac")>=0){
            return true;
        } else{
            return false;
        }
    }
}
