package com.yxq.action;

import java.util.Iterator;
import java.util.List;

import com.yxq.bean.UserSingle;
import com.yxq.dao.OpDB;

public class Main {
	public static void main(String[]args) throws Exception{
		InfoAction ia= new InfoAction();
		System.out.println(ia.ListShow());

	}
}
