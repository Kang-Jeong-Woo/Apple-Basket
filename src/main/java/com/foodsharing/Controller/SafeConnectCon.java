package com.foodsharing.Controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.foodsharing.DAO.t_safeDAO;
import com.foodshring.VO.t_safePageVO;
import com.foodshring.VO.t_safeVO;
import com.util.Command;

public class SafeConnectCon implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String url="map/SafeConnect.jsp";
		int safeSeq=Integer.parseInt(request.getParameter("safeSeq"));
        int currentPage = 1;
        if (request.getParameter("pageNum") != null) {
            currentPage = Integer.parseInt(request.getParameter("pageNum"));
        }
        
        t_safePageVO safePageVO = new t_safePageVO();
        safePageVO.setCurrentPage(currentPage);
        safePageVO.setTotalCount(5);
        
        t_safeDAO safeDAO=t_safeDAO.getInstance();
        
        ArrayList<t_safeVO> t_safeList = safeDAO.safeMapList(safePageVO.getStartRow(),safePageVO.getEndRow(),safeSeq);
        request.setAttribute("list", t_safeList);
        request.setAttribute("page", safePageVO);
        
        return url;
	}
}
