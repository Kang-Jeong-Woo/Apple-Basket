package com.foodsharing.Controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.foodsharing.DAO.t_itemDAO;
import com.foodsharing.DAO.t_reviewDAO;
import com.foodshring.VO.t_itemVO;
import com.foodshring.VO.t_memberVO;
import com.foodshring.VO.t_reviewVO;
import com.util.Command;

public class PurchaseUpdateCon implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url="purchase/purchaseUpdate.jsp";
		request.setCharacterEncoding("utf-8");				
		String itemSeq=request.getParameter("itemSeq");

		//세션
		HttpSession session = request.getSession();
		t_memberVO tvo=(t_memberVO)session.getAttribute("vo");
		String userId=tvo.getMbId();
		String userName = tvo.getMbName()+"( "+userId+" )";				
		
		//아이템 불러오기
		t_itemDAO dao=new t_itemDAO();
		t_itemVO itemVo=dao.getItemVO(itemSeq);
				
		//별점
		t_reviewDAO reviewdao = new t_reviewDAO();
        ArrayList<t_reviewVO> review = reviewdao.itemSelect(Integer.parseInt(itemSeq)); 
        int review_rating = review.get(0).getRoundReview();
        int cnt=review.get(0).getReviewCount();
		
		
		request.setAttribute("itemVo", itemVo);
		request.setAttribute("userId",userId);
		request.setAttribute("userName",userName);
		request.setAttribute("review", review);
		request.setAttribute("review_rating",review_rating);
		request.setAttribute("cnt",cnt);
		return url;
	}

}
