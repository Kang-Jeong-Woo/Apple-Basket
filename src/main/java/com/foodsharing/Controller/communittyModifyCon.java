package com.foodsharing.Controller;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.foodsharing.DAO.t_communittyDAO;
import com.foodshring.VO.t_communittyVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.util.Command;

public class communittyModifyCon implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String url="communitty/communittyProc.jsp";
		
		request.setCharacterEncoding("utf-8");
		t_communittyVO vo=new t_communittyVO();
			
		    final String uploadPath = request.getServletContext().getRealPath("/upload");
			final int maxPostSize = 20 * 1024 * 1024; // 20M
			String articleSeq=null;
			MultipartRequest multipartRequest = new MultipartRequest(request,uploadPath, maxPostSize, "utf-8", new DefaultFileRenamePolicy());
			@SuppressWarnings("unchecked")
			Enumeration<String> enumeration = multipartRequest.getFileNames();
			while(enumeration.hasMoreElements()) {
			
				String name = enumeration.nextElement();
				String fileName = multipartRequest.getOriginalFileName(name);
				articleSeq=multipartRequest.getParameter("articleSeq");
				vo.setArticleSeq(multipartRequest.getParameter("articleSeq"));
				vo.setArticleContent(multipartRequest.getParameter("articleContent"));
				if(!"".equals(fileName)) {
					vo.setArticleFile(fileName);
				 }
				vo.setArticleTitle(multipartRequest.getParameter("articleTitle"));
				vo.setMbId(multipartRequest.getParameter("mbId"));
			}
			
			t_communittyDAO communitty=t_communittyDAO.getInstance();
			int cnt=communitty.updatecommunitty(vo);
			request.setAttribute("articleSeq",articleSeq);	
			request.setAttribute("result",cnt);	
		return url;
	}
}
