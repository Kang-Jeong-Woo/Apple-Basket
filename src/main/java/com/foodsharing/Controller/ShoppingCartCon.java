package com.foodsharing.Controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.foodsharing.DAO.t_basketDAO;
import com.foodshring.VO.t_memberVO;
import com.util.Command;

public class ShoppingCartCon implements Command{
	
	public String execute (HttpServletRequest request, HttpServletResponse response) {
		t_basketDAO basket_dao = new t_basketDAO();
		String itemSeq1 = request.getParameter("itemSeq");
		int itemSeq = Integer.parseInt(itemSeq1);
		String MbId = request.getParameter("MbId");
		String moveUrl;
		if(basket_dao.insertItemId(itemSeq, MbId)>0) {
			System.out.println("success");
			moveUrl = "shoping-cart.jsp";
		}else {
			System.out.println("fail");
			moveUrl = "index.jsp";
		}
		return moveUrl;
	}
}