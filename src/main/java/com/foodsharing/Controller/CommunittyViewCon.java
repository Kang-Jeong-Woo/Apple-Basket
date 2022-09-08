package com.foodsharing.Controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.foodsharing.DAO.t_commentDAO;
import com.foodsharing.DAO.t_communittyDAO;
import com.foodshring.VO.t_commentVO;
import com.foodshring.VO.t_communittyVO;
import com.util.Command;

public class CommunittyViewCon implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		String url="communitty/communittyView.jsp";
		String articleSeq=request.getParameter("articleSeq");
		
		//게시글
		t_communittyDAO communitty=t_communittyDAO.getInstance();
		t_communittyVO t_vo=communitty.get_communittyVO(articleSeq);
		System.out.println("communittyView불러오는것 확인입니다. "+t_vo);
		request.setAttribute("communittyView",t_vo);
		
		t_commentDAO commentDAO=t_commentDAO.getInstance();
		ArrayList<t_commentVO> commentVO = commentDAO.get_commentList(articleSeq);
		request.setAttribute("comment",commentVO);
		System.out.println("댓글 불러오는것 확인입니다. "+commentVO);
		System.out.println(commentVO.toString());
		
		return url;
	}
}
