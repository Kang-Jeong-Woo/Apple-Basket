package com.foodsharing.Controller;

import java.io.IOException;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.foodsharing.DAO.t_basketDAO;
import com.foodshring.VO.PayWebHostVo;
import com.foodshring.VO.SelectBasketVO;
import com.foodshring.VO.t_memberVO;
import com.util.Command;
import com.util.MailUtil;
import com.util.MesaageUtil;

public class PayMentCon implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String rcid = request.getParameter("reWHCid");
		String rctype = request.getParameter("reWHCtype");
		String rhash = request.getParameter("reWHHash");
		

		/* 장바구니에 담아져있는것... */
		String mbId = request.getParameter("a"); //mb_id
		String itemSeq = request.getParameter("b"); //item_seq
		String basketSeq = request.getParameter("c"); //basket_seq
		
		System.out.println("itemSeq: "+itemSeq);

		String trddt = "";
		String trdtm = "";
		String authyn = "";
		String amt = "";
		String trno = "";
		String resultcd="";
		String authno="";

		PayWebHostVo ipg = new PayWebHostVo(rcid);
		if (ipg.kspay_send_msg("1")) {
			authyn = ipg.kspay_get_value("authyn");
			trno = ipg.kspay_get_value("trno");
			trddt = ipg.kspay_get_value("trddt");
			trdtm = ipg.kspay_get_value("trdtm");
			amt = ipg.kspay_get_value("amt");
			authno = ipg.kspay_get_value("authno");

			if (null != authyn && 1 == authyn.length()) {
				if (authyn.equals("O")) {
			resultcd = "0000";
				} else {
			resultcd = authno.trim();
				}
			}
		}
		
		
		
		
		
		SelectBasketVO vo = new SelectBasketVO();
		
		vo.setMbId(mbId);
		vo.setItemSeq(Integer.parseInt(itemSeq));
		vo.setBasketSeq(Integer.parseInt(basketSeq));
		vo.setTrddttm((trddt+trdtm));
		vo.setAmt(amt);
		vo.setAuthyn(authyn);
		
		t_basketDAO dao=new t_basketDAO();
		int cnt=dao.updateItemId(vo);
		
		//디비저장
		String mbName=request.getParameter("sndOrdername");//m_vo.getMbName();
		String mbPhone=request.getParameter("sndMobile");
		
		System.out.println("mbName: "+mbName);
		System.out.println("mbPhone: "+mbPhone);
		
		//메일 발송
		LocalDate now = LocalDate.now();
		MailUtil ms1 =new MailUtil();
		ms1.mailSend(mbName+"님 상품을 결제하셨습니다.\n","안녕하세요 "+mbName+"님 구매하신 상품이  곧 발송이 될 예정 입니다\n 다시한번 저희 애플마켓 이용해주세요~",mbId);
		
		//문자 발송
		MesaageUtil msg2 =new MesaageUtil();
		msg2.merssageSend("test app 1.2","안녕하세요 "+mbName+"님 구매하신 상품이 결제가되었습니다.\n 다시한번 저희 애플마켓 이용해주세요~",mbPhone);
		
		request.setAttribute("result",cnt);
		request.setAttribute("resultcd",authyn);
		
		String url="payMent/paymentCompleted.jsp";
		return url;
	}

}