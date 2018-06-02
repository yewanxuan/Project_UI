package com.ywx.action;

import java.io.UnsupportedEncodingException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import com.ywx.actionSuper.MySuperAction;
import com.ywx.bean.CommentSingle;
import com.ywx.bean.InfoSingle;
import com.ywx.bean.UserSingle;
import com.ywx.dao.OpDB;
//import com.yxq.tools.OS;
import com.ywx.tools.DoString;

public class ThreadAction extends MySuperAction {
    /*
    * 帖子展示
    * */
    public String threadShow(){
        OpDB myOp = new OpDB();
        InfoSingle infoSingle = null;
        List commentlist = new ArrayList();
        String threadId = request.getParameter("threadId");
        String sql="SELECT * from tb_info WHERE id = " + threadId;
        infoSingle = myOp.OpSingleShow(sql, null);
        session.remove("commentSingle");
        session.put("commentSingle", infoSingle);
        String sqlmore = "select *from tb_comment where info_id = "+threadId+ "ORDER BY req_date DESC";
        commentlist = myOp.OpListComment(sqlmore,null);
        request.setAttribute("commentlist",commentlist);
        //System.out.println("infoSingle:"+infoSingle.getInfoContent());
        return "success";
    }
    public String sendComment() throws UnsupportedEncodingException{
    	OpDB myOp = new OpDB();

        String req_userid = null;
        String rsp_userid = request.getParameter("rsp_userid");
        String info_id = request.getParameter("info_id");
        String detail = request.getParameter("detail");
        String req_name = null; 
        String rsp_name = null;
        String date=DoString.dateTimeChange(new java.util.Date());
        detail=new String(detail.getBytes("8859_1"), "utf8");
		if(rsp_userid != null && !rsp_userid.equals("-1") &&rsp_userid != ""){
			System.out.println("rsp_userid is"+rsp_userid);
        	UserSingle us = myOp.OpUser("select * from tb_user where id = '"+ rsp_userid+"'", null);
        	rsp_name = us.getName();
        }
		if(session.get("loginUser")!=null){
			UserSingle us = (UserSingle) session.get("loginUser");;
			req_userid = us.getId();
			System.out.println("req_userid is"+req_userid);
			req_name = us.getName();
		}

		String sql="insert into tb_comment(req_userid,rsp_userid, info_id,detail,req_date,req_name,rsp_name) values(?,?,?,?,?,?,?)";
		Object []params = {req_userid,rsp_userid,info_id,detail,date,req_name,rsp_name};
		System.out.println(req_userid+rsp_userid+info_id+detail+date);
    	myOp.OpUpdate(sql, params);
    	System.out.println("detail:"+detail);
        String sqlmore = "select * from tb_comment where info_id = "+info_id + " ORDER BY req_date DESC";
        System.out.println("sqlmore: " + sqlmore);
        List commentlist = myOp.OpListComment(sqlmore,null);
        request.setAttribute("commentlist",commentlist);
        return "success";
    }
    public String showComment(){
    	OpDB myOp = new OpDB();

        //System.out.println("infoSingle:"+infoSingle.getInfoContent());
        return "success";
    }
}