package com.foodsharing.Controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.foodsharing.DAO.t_commentDAO;
import com.foodsharing.DAO.t_communittyDAO;
import com.foodshring.VO.t_commentVO;
import com.foodshring.VO.t_communittyVO;
import com.foodshring.VO.t_memberVO;
import com.util.Command;

public class communittyUpdateCon implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String url="communitty/communittyUpdate.jsp";
		
		
		String articleSeq=request.getParameter("articleSeq");
		t_communittyDAO communitty=t_communittyDAO.getInstance();
		t_communittyVO t_vo=communitty.get_communittyVO(articleSeq);
		System.out.println("communittyView불러오는것 확인입니다. "+t_vo);
		request.setAttribute("communittyView",t_vo);
		
		t_commentDAO commentDAO=t_commentDAO.getInstance();
		ArrayList<t_commentVO> commentVO = commentDAO.get_commentList(articleSeq);
		request.setAttribute("articleSeq",articleSeq);
		request.setAttribute("comment",commentVO);
		return url;
	}
}
