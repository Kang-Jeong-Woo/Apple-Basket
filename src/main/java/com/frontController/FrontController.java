package com.frontController;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.foodsharing.Controller.AddCartCon;
import com.foodsharing.Controller.AddrCon;
import com.foodsharing.Controller.CartdeleteCon;
import com.foodsharing.Controller.CommunittyDeleteCon;
import com.foodsharing.Controller.CommunittyListCon;
import com.foodsharing.Controller.CommunittyViewCon;
import com.foodsharing.Controller.FarmeritemdeleteCon;
import com.foodsharing.Controller.JoinCon;
import com.foodsharing.Controller.ListMapCon;
import com.foodsharing.Controller.LoginCon;
import com.foodsharing.Controller.LogoutCon;
import com.foodsharing.Controller.PayMentCon;
import com.foodsharing.Controller.PriceFilterCon;
import com.foodsharing.Controller.PurchaseDeliteCon;
import com.foodsharing.Controller.PurchaseDetailCon;
import com.foodsharing.Controller.PurchaseModifyCon;
import com.foodsharing.Controller.PurchaseUpdateCon;
import com.foodsharing.Controller.PurchaseViewCon;
import com.foodsharing.Controller.PurchaseWriteCon;
import com.foodsharing.Controller.ReviewDelCon;
import com.foodsharing.Controller.ReviewWriteCon;
import com.foodsharing.Controller.SafeConnectCon;
import com.foodsharing.Controller.SearchCon;
import com.foodsharing.Controller.ShoppingCartCon;
import com.foodsharing.Controller.commentDeleteCon;
import com.foodsharing.Controller.commentWriteCon;
import com.foodsharing.Controller.communittyModifyCon;
import com.foodsharing.Controller.communittyUpdateCon;
import com.foodsharing.Controller.communittyWriteCon;
import com.util.Command;
@WebServlet("*.do") //자바파일이다.
public class FrontController extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
request.setCharacterEncoding("utf-8");
		
		//실제 사용자가 입력한 주소
		System.out.println("Url실행: "+request.getRequestURI());
		
		//사이트주소
		String requestUri=request.getRequestURI().toString();
		
		//프로젝트명
		String requestContextPath=request.getContextPath();
		
		//뒷경로
		String command=requestUri.substring(requestContextPath.length(),requestUri.length());
		
		System.out.println("클라이언트가 요청한 주소: "+command);
		
		Command cmm=null; //command Upcasting을 한다..
		
		//url경로 호출경우
			if(command.equals("/index.do")) {
				System.out.println("클라이언트가 요청한 메인 주소: "+requestUri);
				//cmm = new index();
			} else if(command.equals("/ajx_addCart.do")) {
				System.out.println("클라이언트가 요청한 메인 주소: "+requestUri);
				cmm = new AddCartCon();
			} else if(command.equals("/purchaseWrite.do")) {
				System.out.println("클라이언트가 요청한 메인 주소: "+requestUri);
				cmm = new PurchaseWriteCon();
			}  else if(command.equals("/LoginCon.do")) {
				System.out.println("클라이언트가 요청한 메인 주소: "+requestUri);
				cmm = new LoginCon();
			}  else if(command.equals("/LogoutCon.do")) {
				System.out.println("클라이언트가 요청한 메인 주소: "+requestUri);
				cmm = new LogoutCon();
			}else if(command.equals("/JoinCon.do")) {
				System.out.println("클라이언트가 요청한 메인 주소: "+requestUri);
				cmm = new JoinCon();
			}else if(command.equals("/shop-grid.do")) {
				System.out.println("클라이언트가 요청한 메인 주소: "+requestUri);
				//cmm = new FarmerListController();
			} else if(command.equals("/shop-details.do")) {
				System.out.println("클라이언트가 요청한 메인 주소: "+requestUri);
				//cmm = new shopDetailCon();
			} else if(command.equals("/shopping-cart.do")) {
				System.out.println("클라이언트가 요청한 메인 주소: "+requestUri);
				cmm = new ShoppingCartCon();
			} else if(command.equals("/CartdeleteCon.do")) {
				System.out.println("클라이언트가 요청한 메인 주소: "+requestUri);
				cmm = new CartdeleteCon();
			} else if(command.equals("/communittyList.do")) {
				System.out.println("클라이언트가 요청한 메인 주소: "+requestUri);
				cmm = new CommunittyListCon ();
			}  else if(command.equals("/communittyView.do")) {
				System.out.println("클라이언트가 요청한 메인 주소: "+requestUri);
				cmm = new CommunittyViewCon();
			}  else if(command.equals("/communittyWrite.do")) {
				System.out.println("클라이언트가 요청한 메인 주소: "+requestUri);
				cmm = new communittyWriteCon();
			}  else if(command.equals("/communittyUpdate.do")) {
				System.out.println("클라이언트가 요청한 메인 주소: "+requestUri);
				cmm = new communittyUpdateCon();
			}  else if(command.equals("/communittyModify.do")) {
				System.out.println("클라이언트가 요청한 메인 주소: "+requestUri);
				cmm = new communittyModifyCon();
			}  else if(command.equals("/communittyDelete.do")) {
				System.out.println("클라이언트가 요청한 메인 주소: "+requestUri);
				cmm = new CommunittyDeleteCon();
			}   else if(command.equals("/purchaseDetail.do")) { //판매 작성
				System.out.println("클라이언트가 요청한 메인 주소: "+requestUri);
				cmm = new PurchaseDetailCon();
			}  else if(command.equals("/purchaseUpdate.do")) { //판매 수정
				System.out.println("클라이언트가 요청한 메인 주소: "+requestUri);
				cmm = new PurchaseUpdateCon();
			}  else if(command.equals("/purchaseView.do")) { //판매 보기
				System.out.println("클라이언트가 요청한 메인 주소: "+requestUri);
				cmm = new PurchaseViewCon();
			}  else if(command.equals("/purchaseModify.do")) { //판매 데이터전달
				System.out.println("클라이언트가 요청한 메인 주소: "+requestUri);
				cmm = new PurchaseModifyCon();
			}  else if(command.equals("/purchaseDelete.do")) { //판매 삭제
				System.out.println("클라이언트가 요청한 메인 주소: "+requestUri);
				cmm = new PurchaseDeliteCon();
			}  else if(command.equals("/purchaseArrayList.do")) { //주소검색
				System.out.println("클라이언트가 요청한 메인 주소: "+requestUri);
				cmm = new AddrCon();
			}  else if(command.equals("/SearchList.do")) { //검색엔진완료.. 추후 링크알면 처리가됨
				System.out.println("클라이언트가 요청한 메인 주소: "+requestUri);
				//cmm = new SearchMap();
			} else if(command.equals("/reviewWrite.do")) { //리뷰페이지 등록
					System.out.println("클라이언트가 요청한 메인 주소: "+requestUri);
					cmm = new ReviewWriteCon();
			} else if(command.equals("/reviewDel.do")) { //리뷰 삭제
				System.out.println("클라이언트가 요청한 메인 주소: "+requestUri);
				cmm = new ReviewDelCon();
			} else if(command.equals("/PriceFilter.do")) { //가격 검색
				System.out.println("클라이언트가 요청한 메인 주소: "+requestUri);
				cmm = new PriceFilterCon();
			} else if(command.equals("/Search.do")) { //단어 검색
				System.out.println("클라이언트가 요청한 메인 주소: "+requestUri);
				cmm = new SearchCon();
			} else if(command.equals("/SafeMap.do")) { //단어 검색
				System.out.println("클라이언트가 요청한 메인 주소: "+requestUri);
				//cmm = new SearchCon();
			} else if(command.equals("/SafeList.do")) { //단어 검색
				System.out.println("클라이언트가 요청한 메인 주소: "+requestUri);
				//cmm = new SearchCon();
			} else if(command.equals("/commentWrite.do")) { //누락된 Write.do
				System.out.println("클라이언트가 요청한 메인 주소: "+requestUri);
				cmm = new commentWriteCon();
			}else if(command.equals("/Farmeritemdelete.do")) { //누락된 Delete.do
			System.out.println("클라이언트가 요청한 메인 주소: "+requestUri);
				cmm = new FarmeritemdeleteCon();
			} else if(command.equals("/commentDelete.do")) { //누락된 Delete.do
				System.out.println("클라이언트가 요청한 메인 주소: "+requestUri);
				cmm = new commentDeleteCon();
			}else if(command.equals("/payMent.do")) { //상품 결재 처리
				System.out.println("클라이언트가 요청한 메인 주소: "+requestUri);
				cmm = new PayMentCon();
			}else if(command.equals("/MapList.do")) {
				System.out.println("클라이언트가 요청한 메인 주소: "+requestUri);
				cmm = new ListMapCon();
			} else if(command.equals("/MapView.do")) {
				System.out.println("클라이언트가 요청한 메인 주소: "+requestUri);
				cmm = new SafeConnectCon();
			} 
				String moveUrl=cmm.execute(request, response);
				if(moveUrl != null) {
					request.getRequestDispatcher(moveUrl).forward(request, response);
				
			}
	}
}