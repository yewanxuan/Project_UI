package com.yxq.tools;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DoString {
	//把手打字符 变成html里面字符
	public static String HTMLChange(String source){
		String changeStr="";
		changeStr=source.replaceAll("&","&amp;");
		changeStr=changeStr.replaceAll(" ","&nbsp;");
		changeStr=changeStr.replaceAll("<","&lt;");
		changeStr=changeStr.replaceAll(">","&gt;");		
		changeStr=changeStr.replaceAll("\r\n","<br>");
		return changeStr;
	}
	public static String dateTimeChange(Date source){
		//SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		//String changeTime=format.format(source);
		SimpleDateFormat sdformat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String changeTime=sdformat.format(source);		
		return changeTime;
	}
}
