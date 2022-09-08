package com.foodsharing.Controller;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.foodsharing.DAO.t_itemDAO;
import com.foodshring.VO.t_itemVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.util.Command;

public class PurchaseWriteCon implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String url="farmer-itemlist.jsp?MbId=";
		request.setCharacterEncoding("utf-8");
		final String uploadPath = request.getServletContext().getRealPath("/img");
		final int maxPostSize = 20 * 1024 * 1024; // 20M
		String mbId="";
		String itemName = ""; // 상품이름
		String itemPrice = ""; //상품가격
		String itemCate = ""; //상품
		String itemDeadline = ""; //상품 입력 날짜
		String safeSeq = ""; //안전번호
		
		String curQuant = ""; // 구매자 제한
		String itemQuant = ""; // 아이템 수량
		String itemDesc = ""; //상품내용
		
		t_itemVO tvo=new t_itemVO();
		MultipartRequest multipartRequest = new MultipartRequest(request,uploadPath, maxPostSize, "utf-8", new DefaultFileRenamePolicy());
		@SuppressWarnings("unchecked")
		Enumeration<String> enumeration = multipartRequest.getFileNames();
		while(enumeration.hasMoreElements()) {
			
			mbId=multipartRequest.getParameter("mbId"); //사용자 아이디
			itemName = multipartRequest.getParameter("itemName"); // 상품이름
			itemPrice = multipartRequest.getParameter("itemPrice"); //상품가격
			itemCate = multipartRequest.getParameter("itemCate"); //상품
			itemDeadline = multipartRequest.getParameter("itemDeadline"); //상품 입력 날짜
			safeSeq = multipartRequest.getParameter("safeSeq"); //안전번호
			curQuant = multipartRequest.getParameter("curQuant"); // 구매자 제한
			itemQuant = multipartRequest.getParameter("itemQuant"); // 아이템 수량
			itemDesc = multipartRequest.getParameter("itemDesc"); //상품내용
			
			String name = enumeration.nextElement();
			String fileName = multipartRequest.getOriginalFileName(name);
			
			
			if(name.equals("itemImg1")) {
				if(!"".equals(fileName)&&fileName!=null) {
					tvo.setItemImg1(fileName);
				 }
			}
			
			if(name.equals("itemImg2")) {
				if(!"".equals(fileName)&&fileName!=null) {
					tvo.setItemImg2(fileName);
				 }
			}
			
			if(name.equals("itemImg3")) {
				if(!"".equals(fileName)&&fileName!=null) {
					tvo.setItemImg3(fileName);
				 }
			}

		}

			tvo.setMbId(mbId);
			tvo.setItemName(itemName);
			System.out.println("itemPrice: "+itemPrice);
			tvo.setItemPrice(Integer.parseInt(itemPrice));
			tvo.setItemCate(itemCate);
			tvo.setItemDeadline(itemDeadline);
			tvo.setSafeSeq(Integer.parseInt(safeSeq));
			tvo.setCurQuant(Integer.parseInt(curQuant));
			tvo.setItemCate(itemCate);
			tvo.setItemFlag("Y");
			tvo.setItemDesc(itemDesc);
			tvo.setItemQuant(Integer.parseInt(itemQuant));
			
			t_itemDAO dao=new t_itemDAO();
			int cnt=dao.ItemInsert(tvo);
			System.out.println("cnt: "+cnt);
			if(cnt>0) {
				url="index.jsp";
				System.out.println("저장에 성공했습니다.");
			} else {
				url="/farmer-itemlist.jsp?MbId="+mbId;
			}
			
		return url;
	}
}