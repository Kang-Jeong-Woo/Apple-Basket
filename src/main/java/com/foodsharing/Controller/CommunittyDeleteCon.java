package com.foodsharing.Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.foodsharing.DAO.t_communittyDAO;
import com.foodshring.VO.t_communittyVO;
import com.foodshring.VO.t_memberVO;
import com.util.Command;

public class CommunittyDeleteCon implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
String url="communitty/communittyProc.jsp";
		
		request.setCharacterEncoding("utf-8");
		t_communittyVO vo=new t_communittyVO();
		String articleSeq=request.getParameter("articleSeq");
		t_communittyDAO communitty=t_communittyDAO.getInstance();
		
		HttpSession session = request.getSession();
		t_memberVO mvo=(t_memberVO)session.getAttribute("vo");
		String mbId=mvo.getMbId();
		int cnt=communitty.Deletecommunitty(articleSeq,mbId);
		request.setAttribute("result",cnt);	
		return url;
	}
}
