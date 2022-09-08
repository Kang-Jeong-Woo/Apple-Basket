package com.foodsharing.Controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.foodsharing.DAO.t_safeDAO;
import com.foodshring.VO.t_safeVO;
import com.util.Command;

public class AddrSearchCon implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url="zipAddr/searchCenter.jsp";
		request.setCharacterEncoding("utf-8");
		String keywordType=request.getParameter("keywordType");
		String keywordText=request.getParameter("keywordText");
		
		if("".equals(keywordType)&&keywordType==null) {
			keywordType="all";
		}
		t_safeDAO t_safeVO=t_safeDAO.getInstance();
		//ArrayList<t_safeVO> postalCodes = t_safeVO.get_SearchVO(keywordType, keywordText);
		//System.out.println(postalCodes);
		//request.setAttribute("postalCodes",postalCodes);
		return url;
	}
}
