package com.foodsharing.Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.foodsharing.DAO.t_itemDAO;
import com.foodshring.VO.t_itemVO;
import com.foodshring.VO.t_memberVO;
import com.util.Command;

public class PurchaseDeliteCon implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url="purchase/purchaseProc.jsp";
		
		
		request.setCharacterEncoding("utf-8");
		String itemSeq=request.getParameter("itemSeq");
		t_itemDAO dao=new t_itemDAO();
		int cnt=dao.itemDelete(itemSeq);
		request.setAttribute("result",cnt);	
		return url;
	}
}
