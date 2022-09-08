<%@page import="com.foodshring.VO.t_itemVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.foodsharing.DAO.t_itemDAO"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>AppleBasket</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="css/style.css" type="text/css">
</head>

<body>

    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>
    
    <!-- Humberger Begin -->
		<%@ include file="./Humberger.jsp" %>
    <!-- Humberger End -->

    <!-- Header Section Begin -->
    <%@ include file="./header.jsp" %>
    <!-- Header Section End -->

    <!-- Hero Section Begin -->
    
    <% 
    	t_itemDAO item_dao = new t_itemDAO();
    	String mbId= request.getParameter("MbId");
    	String itemSeq= request.getParameter("itemSeq");
		ArrayList<t_itemVO> list = item_dao.getFarmerList(mbId);
		int itemDelete = item_dao.itemDelete(itemSeq);
		
	%>
	
	
    <section class="hero hero-normal">
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="hero__categories">
						<div class="hero__categories__all">
							<i class="fa fa-bars"></i> <span>재료종류</span>
						</div>
						<ul>
							<li><a href="#">채소</a></li>
							<li><a href="#">과일</a></li>
							<li><a href="#">견과류</a></li>
							<li><a href="#">유제품</a></li>
							<li><a href="#">신선육</a></li>
							<li><a href="#">수산물</a></li>
							<li><a href="#">귤</a></li>
							<li><a href="#">못난이 상점</a></li>
						</ul>
					</div>
                </div>
                <div class="col-lg-9">
                    <div class="hero__search">
                        <div class="hero__search__form">
                            <form action="#">
                                <div class="hero__search__categories">
                                    전체카테고리
                                    <span class="arrow_carrot-down"></span>
                                </div>
                                <input type="text" placeholder="어떤 재료가 필요하시나요?">
                                <button type="submit" class="site-btn">검색</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Hero Section End -->

    <!-- Breadcrumb Section Begin -->
   <table class="table table-hover">
                        <h2><%=vo.getMbName() %> 님의 판매목록</h2>
                      
                      
                            <thead>
                                <tr>
                                    <th class="shoping__product">상품번호</th>
                                    <th>상품</th>
                                    <th>단가(box)</th>
                                    <th>판매수량</th>
                                    <th>판매금액</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                            <table >
						      <%
								for(int i=0; i<list.size();i++){
									if(list.get(i).getMbId().equals(vo.getMbId())){
										System.out.print("for문 실행");
						  	  %>
                                <tr>
                                 	<td class="shoping__cart__seq" style="width: 300px ;">
                                        
                                        <h5><%= list.get(i).getItemSeq()%> </h5>
                                    </td>
                                    <td class="shoping__cart__item">
                                        <img src="./img/<%= list.get(i).getItemImg1()%>" alt="" style=" height: 90px; width: 120px">
                                        <h5><%= list.get(i).getItemName()%> </h5>
                                    </td>
                                    <td class="shoping__cart__price">
                                        <%= list.get(i).getItemPrice()%> 
                                    </td>
                                    <td class="shoping__cart__quantity">
                                        <div class="quantity">
                                            <div class="shoping__cart__quantity">
                                                <%= list.get(i).getItemQuant()%> 
                                            </div>
                                        </div>
                                    </td>
                                    <td class="shoping__cart__total">
                                        <%= list.get(i).getItemPrice()*list.get(i).getItemQuant()%> 
                                    </td>
                                    <td class="shoping__cart__item__close">
                                        <span class="icon_close"></span>
                                        
                                    </td>
                                    </td>
                                 </tr>

                                    <%} else{
                                    	System.out.print("else문 실행");
                                    }}%>
                       
                                 
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="shoping__cart__btns">
                        <a href="#" class="primary-btn cart-btn">상품등록</a>
                        <a href="#" class="primary-btn cart-btn cart-btn-right">
                            상품 전체 삭제</a>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="shoping__continue">
                        <div class="shoping__discount">
                           
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="shoping__checkout">
                   
                        <h5>총 매출</h5>
                        <ul>
                        
                            <li>판매수량 
                     <%	int cnt = 0;
                        int sum = 0;
                    	for(int i=0; i<list.size();i++){
							if(list.get(i).getMbId().equals(vo.getMbId())){
								cnt += list.get(i).getItemQuant();
								sum += list.get(i).getItemQuant()*list.get(i).getItemPrice();
							}} %>
                            <span><fmt:formatNumber value="<%= cnt%>" pattern="#,###"/>개
 							</span></li>
                          
                            <li>총 매출액 
                            <span><fmt:formatNumber value="<%= sum%>" pattern="#,###"/>원
 							</span></li>
                        </ul>
                    </div>
                </div>
              
            </div>
        </div>
    </section>
    <!-- Shoping Cart Section End -->

    <!-- Footer Section Begin -->
 	<%@ include file="./footer.jsp" %>
    <!-- Footer Section End -->

    <!-- Js Plugins -->
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.nice-select.min.js"></script>
    <script src="js/jquery-ui.min.js"></script>
    <script src="js/jquery.slicknav.js"></script>
    <script src="js/mixitup.min.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/main.js"></script>


</body>

</html>