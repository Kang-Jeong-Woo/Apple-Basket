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

public class SearchCon implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String input_str = request.getParameter("input_str");
		
		
		ArrayList<t_itemJoinVO> list = new t_itemDAO().Search_str(input_str);
		
		Gson gson = new Gson();
		String json = gson.toJson(list);
		
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		out.print(json);
		
		System.out.println(json);
		
		return null;
	
	}

}
