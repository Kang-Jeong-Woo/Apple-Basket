package com.foodsharing.Controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.foodsharing.DAO.t_communittyDAO;
import com.foodshring.VO.t_communittyPageVO;
import com.foodshring.VO.t_communittyVO;
import com.util.Command;

public class CommunittyListCon implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		String url="communitty/communittyList.jsp";
	
        int currentPage = 1;
        if (request.getParameter("pageNum") != null) {
            currentPage = Integer.parseInt(request.getParameter("pageNum"));
        }
        String select = request.getParameter("select");
        String search = request.getParameter("search");
    	
        t_communittyDAO communitty=t_communittyDAO.getInstance();
    	
        t_communittyPageVO communittyPageVO = new t_communittyPageVO();
        communittyPageVO.setCurrentPage(currentPage);
        communittyPageVO.setTotalCount(communitty.getCommunittyCount(select, search));
        
        ArrayList<t_communittyVO> t_communittyList = communitty.listCommunitty(communittyPageVO.getStartRow(),communittyPageVO.getEndRow(),select,search);
        System.out.println("t_communittyList: "+t_communittyList.toString());
        request.setAttribute("list", t_communittyList);
        request.setAttribute("page", communittyPageVO);
        
        // select, search를 넘겨줘서 페이징을 했을때도 값이 남아있게 한다.
        request.setAttribute("select", select);
        request.setAttribute("search", search);
        
		return url;
	}
}
