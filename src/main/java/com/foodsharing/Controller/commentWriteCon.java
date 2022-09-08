package com.foodsharing.Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.foodsharing.DAO.t_commentDAO;
import com.foodshring.VO.t_memberVO;
import com.util.Command;

public class commentWriteCon implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String url="communitty/commentProc.jsp";
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		t_memberVO mvo=(t_memberVO)session.getAttribute("vo");
		String mbId=mvo.getMbId();
		String articleSeq=request.getParameter("articleSeq");
		String cmtContent=request.getParameter("cmtContent");
	
		t_commentDAO comment=t_commentDAO.getInstance();
		int cnt=comment.Insertcommt(articleSeq,mbId,cmtContent);
		request.setAttribute("result",cnt);
		request.setAttribute("articleSeq",articleSeq);
		return url;
	}
}
