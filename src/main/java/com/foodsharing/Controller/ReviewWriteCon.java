package com.foodsharing.Controller;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.foodsharing.DAO.t_reviewDAO;
import com.foodshring.VO.t_itemVO;
import com.foodshring.VO.t_reviewVO;
import com.util.Command;

public class ReviewWriteCon implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String url="./review/ReviewWriteProc.jsp";
		
		
		request.setCharacterEncoding("utf-8");
		String reqItemNm=request.getParameter("itemName");
		t_reviewVO vo=new t_reviewVO();
		t_reviewDAO dao=t_reviewDAO.getInstance();
		vo.setMbId(request.getParameter("mbId"));
		vo.setReviewContent(request.getParameter("reviewContent"));
		vo.setItemSeq(Integer.parseInt(request.getParameter("itemSeq")));
		
		if(request.getParameter("reviewRating")!=null && !"".equals(request.getParameter("reviewRating"))) {
			vo.setReviewRating(Integer.parseInt(request.getParameter("reviewRating")));
		} else {
			vo.setReviewRating(0);
		}
		
		int cnt=dao.ReviewWrite(vo);
		request.setAttribute("result",cnt);
		return url;
	}
}
