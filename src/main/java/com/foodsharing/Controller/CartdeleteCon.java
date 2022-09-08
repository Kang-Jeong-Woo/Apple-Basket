package com.foodsharing.Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.foodsharing.DAO.t_basketDAO;
import com.foodshring.VO.t_memberVO;
import com.util.Command;

public class CartdeleteCon implements Command{
	
	public String execute (HttpServletRequest request, HttpServletResponse response) throws IOException {
		t_basketDAO basket_dao = new t_basketDAO();
		String basketSeq1 = request.getParameter("basketSeq");
		int basketSeq = Integer.parseInt(basketSeq1);
		String MbId = request.getParameter("MbId");
		PrintWriter out = response.getWriter();
		if(basket_dao.deleteItemId(basketSeq, MbId)>0) {
			System.out.println("success");
			out.write("1");
		}else {
			System.out.println("fail");
			out.write("0");
		}
		return null;
	}
}