package com.foodsharing.Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.foodsharing.DAO.t_itemDAO;
import com.foodshring.VO.t_itemVO;
import com.util.Command;

public class PurchaseViewCon implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url="purchase/purchaseView.jsp";
		request.setCharacterEncoding("utf-8");				
		String itemSeq=request.getParameter("itemSeq");
		t_itemDAO dao=new t_itemDAO();
		t_itemVO itemVo=dao.getItemVO(itemSeq);
		request.setAttribute("itemVo", itemVo);
		System.out.println("itemVo: 값"+itemVo);
		return url;
	}

}
