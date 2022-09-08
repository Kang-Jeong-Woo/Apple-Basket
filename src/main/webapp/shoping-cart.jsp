<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="com.foodshring.VO.SelectBasketVO"%>
<%@page import="com.foodshring.VO.t_basketVO"%>
<%@page import="com.foodsharing.DAO.t_basketDAO"%>
<%@page import="java.util.ArrayList"%>
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
<title>AppleBasket | shop cart</title>

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap"
	rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
<link rel="stylesheet" href="css/nice-select.css" type="text/css">
<link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
<link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
<link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="css/style.css" type="text/css">
<link rel="stylesheet"href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
<!-- ajax 쓰려면 이거 써야함 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.12.4.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

</head>

<body>
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>

	<!-- Humberger Begin -->
	<%@ include file="./Humberger.jsp"%>
	<!-- Humberger End -->

	<!-- Header Section Begin -->
	<%@ include file="./header.jsp"%>
	<!-- Header Section End -->

	<%
	t_memberVO mem_vo = (t_memberVO) session.getAttribute("vo");
	if (vo == null) {
	%>
	<script> 
			alert("로그인하시기 바랍니다.") 
			history.back();
			</script>
	<%
	}
	%>

	<!-- Hero Section Begin -->
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
									전체카테고리 <span class="arrow_carrot-down"></span>
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
	<section class="breadcrumb-section set-bg"
		data-setbg="img/breadcrumb.jpg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="breadcrumb__text">
						<h2>장바구니</h2>
						<div class="breadcrumb__option">
							<a href="./index.jsp">Home</a> <span>장바구니</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Breadcrumb Section End -->

    <!-- Shoping Cart Section Begin -->
    <section class="shoping-cart spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="shoping__cart__table">
                        <table>
                            <thead>
                                <tr>
                                    <th class="shoping__product">제품</th>
                                    <th>가격</th>
                                    <th>수량</th>
                                    <th>금액</th>
                                    <th>결재상태</th>
                                    <th></th>
                                    <th style="display: none;">번호</th>
                                </tr>
                            </thead>
                            
                            <!-- list를 가져오는 query문 -->
                            <%
                    		t_basketDAO basket_dao = new t_basketDAO();
                    		ArrayList<SelectBasketVO> list = basket_dao.getAll2(vo.getMbId());
                    		if(list!=null){
                    			session.setAttribute("list",list);
                    		}
                    		int totalprice = 0;
                            %>
                            <tbody>
                            <%for(int i =0;i<list.size();i++){ %>
								<tr class="checkPoint<%=i%>">
								    <td class="shoping__cart__item">
								        <img src="img/<%=list.get(i).getItemImg1() %>" alt="">
								        <h5 value="t_name"><%=list.get(i).getItemName() %></h5>
								        <input type="hidden" name="<%=list.get(i).getItemName() %>" value="name">
								    </td>
								    <td class="shoping__cart__price(<%=i%>)" id = "p_price<%=i%>" name="p_price<%=i%>">
								        <%=list.get(i).getItemPrice() %>
								    </td>
								    <td class="shoping__cart__quantity">
								        <div class="quantity">
								            <div class="pro-qty">
									            <span class="dec qtybtn" onclick="dec_changePnum(<%=i%>)">-</span>
								                <input class="p_num" type="text" value="1" name="p_num<%=i%>" onkeyup="changePnum(<%=i%>)">
									            <span class="inc qtybtn" onclick="changePnum(<%=i%>)">+</span>
								            </div>
								        </div>
								    </td>
								    <td class="shoping__cart__total<%=i%> total"><fmt:formatNumber value='<%=list.get(i).getItemPrice() %>' pattern='#,###' />원</td>
								    <td><%
								    		if("X".equals(list.get(i).getAuthyn())){
								    			out.println("<B>미 결제</b>");
								    		}else if(!"X".equals(list.get(i).getAuthyn())){
								    			out.println("<B style='color:red;';>결제 완료</b>");
								    		} else{
								    			out.println("<B>결제 오류</b>");
								    		}
								    		%></td>
								   		 
								        <%
								    		if("X".equals(list.get(i).getAuthyn())){
								    			%>
								    			<td class="shoping__cart__item__close" onclick="cartdelete(<%=list.get(i).getBasketSeq()%>,'checkPoint<%=i%>')">
								    			<%
								    			out.println("<span class='icon_close' onclick='delItem()'></span>");
								    			}else if(!"X".equals(list.get(i).getAuthyn())){
								    			%>
								    			<td class="shoping__cart__item__close">
								    			<%
								    			out.println("<span></span>");
								    			} else{
								    			%>
								    			<td class="shoping__cart__item__close" onclick="cartdelete(<%=list.get(i).getBasketSeq()%>,'checkPoint<%=i%>')">
								    			<%
								    			out.println("<B>결재 오류</b>");
								    			}
								    		%>
								        
								    </td>
								</tr>
                                <%totalprice+=list.get(i).getItemPrice();}%>
                            </tbody>
                        </table>
                    </div>
                </div>
                
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="shoping__cart__btns">
                        <a href="./shop-grid.jsp" class="primary-btn cart-btn">쇼핑을 계속</a>
                        <a href="shoping-cart.jsp" class="primary-btn cart-btn cart-btn-right"><span class="icon_loading"></span>
                           수량초기화</a>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="shoping__continue">
                        <div class="shoping__discount">
                            <h5>할인 코드</h5>
                            <form action="#">
                                <input type="text" placeholder="쿠폰 코드를 입력하세요">
                                <button type="submit" class="site-btn">쿠폰적용</button>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="shoping__checkout">
                        <h5>장바구니 합계</h5>
                        <ul>
                            <li>소계 <span>원</span><span id="checkoutTotalPrice_T"><%=totalprice %></span></li>
                            <li>할인 금액 <span><span id="checkoutTotalPrice_T">0 원</span></li>
                            <li>총 금액 <span> 원</span><span id="checkoutTotalPrice"><%=totalprice %></span></li>
                        </ul>
                       <a href="#" class="primary-btn" onclick="Alert()">결제를 진행하세요</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Shoping Cart Section End -->


	<!-- Footer Section Begin -->
	<%@ include file="./footer.jsp"%>
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

	<script>
    function cartdelete(seqq, removeItem) {
    	$.ajax({
	            url : "CartdeleteCon.do",
	            type : "post",
	            data : {
	            	MbId : "<%=vo.getMbId()%>",
		    		basketSeq : seqq
	            },
	            dataType : "text",
	            success : function(res) {
	            	console.log(res);
	               if(res == 1){
	            	   //console.log(removeItem);
	            	   $("."+removeItem).remove();
	            	   var item_total = document.querySelectorAll('.total');
		               	var resultMoney = 0;
		               	for(var i = 0; i < item_total.length; i++){
		               		resultMoney += parseInt(item_total[i].innerText.substr(0, item_total[i].innerText.length -1 ));
		               	}
		               	document.querySelector('#checkoutTotalPrice_T').innerHTML = resultMoney.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
		           	    document.querySelector('#checkoutTotalPrice').innerHTML = resultMoney.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
	               }else {
	            	   alert('수정실패');
	               }
	            },
	            error : function(){
	               alert('전체실패');
	            }
	         });
  };
    
	function Alert() {
		alert('반드시 장바구니를 지참하여 환경을 지키는데 도움을 주세요!!', 'success');
		setTimeout(() => {
			window.location = "checkout.jsp?totalprice="+"<%= totalprice %>"
		}, 2500);
	}
	
	var alert = function(msg, type) {
		swal({
			title : '알고계셨나요?',
			text : msg,
			type : type,
		});
	}
	
	function sleep(ms){
		const wakeuptime = Date.now()+ms;
		while (Date.now()< wakeuptime){}
	}
	
	function changePnum(pos){
		var count1 = document.querySelector('input[name=p_num'+pos+']').value;
		let count = parseInt(count1)+1;
		let price1 = document.querySelector('#p_price'+pos).innerText;
		let price = parseInt(price1);
		let newval = count*price;
		document.querySelector('.shoping__cart__total'+pos).textContent = (newval.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ","))+"원";
		
		var totalPrice1 = document.querySelector('#checkoutTotalPrice').innerText;
		let totalPrice=parseInt(totalPrice1);
		totalPrice += price;
		
		document.querySelector('#checkoutTotalPrice').innerHTML = totalPrice;
		document.querySelector('#checkoutTotalPrice_T').innerHTML = totalPrice;
		sessionStorage.setItem("totalPrice",totalPrice);
	};
	
	function dec_changePnum(pos){
		var count1 = document.querySelector('input[name=p_num'+pos+']').value;
		let count = parseInt(count1)-1;
		let price1 = document.querySelector('#p_price'+pos).innerText;
		let price = parseInt(price1);
		let newval = count*price;
		document.querySelector('.shoping__cart__total'+pos).textContent = (newval.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ","))+"원";
		
		var totalPrice1 = document.querySelector('#checkoutTotalPrice').innerText;
		let totalPrice=parseInt(totalPrice1);
		totalPrice -= price;
		
		document.querySelector('#checkoutTotalPrice').innerHTML = totalPrice;
		document.querySelector('#checkoutTotalPrice_T').innerHTML = totalPrice;
		sessionStorage.setItem("totalPrice",totalPrice);
	};
	

	</script>
</body>

</html>