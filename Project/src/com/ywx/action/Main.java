package com.ywx.action;

import java.util.Iterator;
import java.util.List;

import com.ywx.bean.UserSingle;
import com.ywx.dao.OpDB;

public class Main {
	public static void main(String[]args) throws Exception{
		InfoAction ia= new InfoAction();
		System.out.println(ia.ListShow());

	}
}
