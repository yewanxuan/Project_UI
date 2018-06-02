package com.yxq.action;

import java.io.UnsupportedEncodingException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import com.yxq.actionSuper.MySuperAction;
import com.yxq.bean.CommentSingle;
import com.yxq.bean.InfoSingle;
import com.yxq.dao.OpDB;
//import com.yxq.tools.OS;
import com.yxq.tools.DoString;

public class threadAction extends MySuperAction {
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
        String sqlmore = "select *from tb_comment where info_id = "+threadId;
        commentlist = myOp.OpListComment(sqlmore,null);
        request.setAttribute("commentlist",commentlist);
        //System.out.println("infoSingle:"+infoSingle.getInfoContent());
        return "success";
    }
    public String sendComment() throws UnsupportedEncodingException{
    	OpDB myOp = new OpDB();
        String req_userid = request.getParameter("req_userid");
        String rsp_userid = request.getParameter("rsp_userid");
        String info_id = request.getParameter("info_id");
        String detail = request.getParameter("detail");
        detail=new String(detail.getBytes("8859_1"), "utf8");
        String date=DoString.dateTimeChange(new java.util.Date());
		String sql="insert into tb_comment(req_userid,rsp_userid, info_id,detail,req_date) values(?,?,?,?,?)";
		Object []params = {req_userid,rsp_userid,info_id,detail,date};
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
