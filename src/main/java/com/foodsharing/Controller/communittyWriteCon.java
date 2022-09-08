package com.foodsharing.Controller;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.foodsharing.DAO.t_communittyDAO;
import com.foodshring.VO.t_communittyVO;
import com.foodshring.VO.t_memberVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.util.Command;

public class communittyWriteCon implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "communitty/communittyProc.jsp";
		request.setCharacterEncoding("utf-8");
		
		t_communittyVO vo=new t_communittyVO();
		
		HttpSession session = request.getSession();	
		t_memberVO tvo=(t_memberVO)session.getAttribute("vo");
		String userId=tvo.getMbId();
		
		final String uploadPath = request.getServletContext().getRealPath("/upload");
		final int maxPostSize = 20 * 1024 * 1024; // 10M
		
		MultipartRequest multipartRequest = new MultipartRequest(request,uploadPath, maxPostSize, "utf-8", new DefaultFileRenamePolicy());
		@SuppressWarnings("unchecked")
		Enumeration<String> enumeration = multipartRequest.getFileNames();
		while(enumeration.hasMoreElements()) {
		
			String name = enumeration.nextElement();
			String fileName = multipartRequest.getOriginalFileName(name);
			vo.setArticleContent(multipartRequest.getParameter("articleContent"));
			if(!"".equals(fileName)) {
				vo.setArticleFile(fileName);
			 }
			vo.setArticleTitle(multipartRequest.getParameter("articleTitle"));
			vo.setMbId(userId);
		}
		
		t_communittyDAO communitty=t_communittyDAO.getInstance();
		int cnt=communitty.insertcommunitty(vo);
		request.setAttribute("result",cnt);	
		return url;
	}
}
