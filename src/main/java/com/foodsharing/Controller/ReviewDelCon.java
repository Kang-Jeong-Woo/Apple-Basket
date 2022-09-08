package com.foodsharing.Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.foodsharing.DAO.t_reviewDAO;
import com.foodshring.VO.t_reviewVO;
import com.util.Command;

public class ReviewDelCon implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url="./shop-details.jsp?itemName=";
		request.setCharacterEncoding("utf-8");
		String reqItemNm=request.getParameter("itemName");
		String userId=request.getParameter("mbId");
		int reviewSeq=Integer.parseInt(request.getParameter("reviewSeq"));
		
		t_reviewVO vo=new t_reviewVO();
		t_reviewDAO dao=t_reviewDAO.getInstance();
		int cnt=dao.deleteReview(reviewSeq,userId);
		if(cnt>0) {
			System.out.println("리뷰가 정상적으로 저장이되었습니다.");
		} else {
			System.out.println("리뷰가 정상적으로 저장이되지않았으니 확인하시기 바랍니다.");
		}
		return url+reqItemNm;
	}
}
