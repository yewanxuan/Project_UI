package com.yxq.action;

import com.yxq.actionSuper.MySuperAction;
import com.yxq.bean.InfoSingle;
import com.yxq.dao.OpDB;
import com.yxq.tools.OS;

public class threadAction extends MySuperAction {
    public String threadShow(){
        OpDB myOp = new OpDB();
        InfoSingle infoSingle;
        String threadId = request.getParameter("threadId");
        String sql="SELECT * from tb_info WHERE id = " + threadId;
        infoSingle = myOp.OpSingleShow(sql, null);
        request.setAttribute("tipSingle", infoSingle);
        System.out.println("infoSingle:"+infoSingle.getInfoContent());
        return "success";
    }
    public String sendComment(){
        return "success";
    }
    public String showComment(){
        return "success";
    }
}
