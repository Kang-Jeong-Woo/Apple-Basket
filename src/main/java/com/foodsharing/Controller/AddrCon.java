package com.foodsharing.Controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.foodsharing.DAO.t_communittyDAO;
import com.foodsharing.DAO.t_safeDAO;
import com.foodshring.VO.t_communittyVO;
import com.foodshring.VO.t_safeVO;
import com.util.Command;

public class AddrCon implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		String keyword = request.getParameter("keyword");
		
		t_safeVO postalCode = new t_safeVO();
		
		t_safeDAO postalCodeDAO=t_safeDAO.getInstance();
		System.out.println("keyword: "+keyword);
		ArrayList<t_safeVO> postalCodeList = postalCodeDAO.get_safeVO(keyword);
		System.out.println("postalCodeList: "+postalCodeList);
		request.setAttribute("postalCodes", postalCodeList);
		return "map/zipAddr.jsp";
	}

}
