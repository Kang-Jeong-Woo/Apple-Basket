package com.foodsharing.Controller;

import java.time.LocalDate;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.foodsharing.DAO.t_memberDAO;
import com.util.Command;
import com.util.MailUtil;
import com.util.MesaageUtil;

public class JoinCon implements Command{

	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String adminYn = "";
		String mbId = request.getParameter("mbId");
		String mbPw = request.getParameter("mbPw");
		String mbName = request.getParameter("mbName");
		String mbPhone = request.getParameter("mbPhone");
		String mbYear = request.getParameter("year");
		String mbMonth = request.getParameter("month");
		String mbDay = request.getParameter("day");
		String mbGender = request.getParameter("mbGender");
		String mbGubun = request.getParameter("mbGubun");
		String mbAddr = request.getParameter("re_roadAddress");
		String mbJoindate = request.getParameter("mbJoindate");
		if(mbId.equalsIgnoreCase("admin"))
			adminYn = "Y";
		else
			adminYn = "N";
		
		String mbBirthdate = mbYear + "-" + mbMonth + "-" + mbDay;
		
		
		
		// 같은 상자에 담아준다는 느낌
		t_memberDAO dao = new t_memberDAO();
		int cnt = dao.Join(mbId, mbPw, mbName, mbPhone, mbBirthdate, mbGender, mbGubun, mbAddr, mbJoindate, adminYn);

		// WEB_JDBC프로젝트에 JOinCon Servlet을 참조하여
		// 위 입력된 정보를 message_member에 입력하고
		// 입력 후 main.jsp로 돌아가시오

		if (cnt > 0) {
			System.out.println("회원가입 성공");
			
			//알림기능 처리...
			//mbName / mbId / 가입일
			LocalDate now = LocalDate.now();
			MailUtil ms1 =new MailUtil();
			ms1.mailSend("안녕하세요 "+mbName+"님 반갑습니다!!!\n","안녕하세요 "+mbName+"님 반갑습니다!!!\n"+mbName+"님 ( "+mbId+" )의 가입일은 "+now+" 입니다\n 가입을 축하드립니다.",mbId);
			MesaageUtil msg2 =new MesaageUtil();
			msg2.merssageSend("test app 1.2","안녕하세요 "+mbName+"님 반갑습니다!!!\n"+mbName+"님 ( "+mbId+" )의 가입일은 "+now+" 입니다\n 가입을 축하드립니다.",mbPhone);
			
		} else {
			System.out.println("입력실패");
		}
		// if 안에 안쓰고 밖으로 뺀 이유가
		// 회원가입 성공하든 성공안하든 메인페이지로 이동 하게 하려고
		// return 값을 if 안에 쓰려면 else 구문에도 return값을 써야 에러가 안난다
		return "login.jsp";

	}
}
