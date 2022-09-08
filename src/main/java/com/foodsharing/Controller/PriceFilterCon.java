package com.foodsharing.Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.foodsharing.DAO.t_itemDAO;
import com.foodsharing.DAO.t_memberDAO;
import com.foodshring.VO.t_itemJoinVO;
import com.foodshring.VO.t_itemVO;
import com.foodshring.VO.t_memberVO;
import com.google.gson.Gson;
import com.util.Command;

public class PriceFilterCon implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String minprice = request.getParameter("minprice");
		String maxprice = request.getParameter("maxprice");
		
		ArrayList<t_itemJoinVO> list = new t_itemDAO().priceList(minprice, maxprice);
		
		Gson gson = new Gson();
		String json = gson.toJson(list);
		
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		out.print(json);
		
		System.out.println(json);
		
		return null;
	
	}

}
