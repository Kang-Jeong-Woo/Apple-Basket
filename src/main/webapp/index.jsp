<%@page import="com.foodshring.VO.t_itemJoinVO"%>
<%@page import="com.foodsharing.DAO.t_safeDAO"%>
<%@page import="com.foodshring.VO.t_safeVO"%>
<%@page import="com.foodshring.VO.t_itemVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.foodsharing.DAO.t_itemDAO"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="com.foodshring.VO.t_memberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="zxx">

<head>
<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Applebasket | main</title>

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap"
	rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet"href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
<link rel="stylesheet" href="css/nice-select.css" type="text/css">
<link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
<link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
<link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="css/style.css" type="text/css">
<link rel="stylesheet" href="./css/style.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
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
	<!-- Header Section end -->
	
	<!-- Hero Section Begin -->

	<section class="hero">
		<div class="container">
			<div class="row">
				<div class="col-lg-3">
					<div class="hero__categories">
						<div class="hero__categories__all">
							<i class="fa fa-bars"></i> <span>????????????</span>
						</div>
						<ul>
							<li><a href="#">??????</a></li>
							<li><a href="#">??????</a></li>
							<li><a href="#">?????????</a></li>
							<li><a href="#">?????????</a></li>
							<li><a href="#">?????????</a></li>
							<li><a href="#">?????????</a></li>
							<li><a href="#">???</a></li>
							<li><a href="#">????????? ??????</a></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-9">
					<div class="hero__search">
						<div class="hero__search__form">
							<form action="#">
								<div class="hero__search__categories">
									?????? ???????????? <span class="arrow_carrot-down"></span>
								</div>
								<input type="text" placeholder="?????? ????????? ???????????????????">
								<button type="submit" class="site-btn">??????</button>
							</form>
						</div>
					</div>
					<div class="hero__item set-bg" data-setbg="img/hero/banner.jpg">
						<div class="hero__text">
							<span>????????? ??????</span>
							<h2>
								?????? <br />99.9% ?????????
							</h2>
							<p>?????? ?????? ??? ????????????</p>
							<a href="#" class="primary-btn">SHOP NOW</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Hero Section End -->

	<!-- Categories Section Begin -->
	<section class="categories">
		<div class="container">
			<div class="row">
				<div class="categories__slider owl-carousel">
					<div class="col-lg-3">
						<div class="categories__item set-bg"
							data-setbg="img/categories/cat-1.jpg">
							<h5>
								<a href="#">????????? ??????</a>
							</h5>
						</div>
					</div>
					<div class="col-lg-3">
						<div class="categories__item set-bg"
							data-setbg="img/categories/cat-2.jpg">
							<h5>
								<a href="#">?????????</a>
							</h5>
						</div>
					</div>
					<div class="col-lg-3">
						<div class="categories__item set-bg"
							data-setbg="img/categories/cat-3.jpg">
							<h5>
								<a href="#">??????</a>
							</h5>
						</div>
					</div>
					<div class="col-lg-3">
						<div class="categories__item set-bg"
							data-setbg="img/categories/cat-4.jpg">
							<h5>
								<a href="#">?????????</a>
							</h5>
						</div>
					</div>
					<div class="col-lg-3">
						<div class="categories__item set-bg"
							data-setbg="img/categories/cat-5.jpg">
							<h5>
								<a href="#">?????????</a>
							</h5>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Categories Section End -->


	<!-- Featured Section Begin -->
	<%
		t_itemDAO item_dao = new t_itemDAO();
		ArrayList<t_itemJoinVO> list2 = item_dao.getAll1();
	%>

	<section class="featured spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="section-title">
						<h2>?????? ??????</h2>
					</div>
					<div class="featured__controls">
						<ul>
							<li class="active" data-filter="*">All</li>
							<li data-filter=".vegetable">??????</li>
							<li data-filter=".fruit">??????</li>
							<li data-filter=".nuts">?????????</li>
							<li data-filter=".dairy">?????????</li>
							<li data-filter=".meat">?????????</li>
							<li data-filter=".fish">?????????</li>
							<li data-filter=".tangerine">???</li>
							<li data-filter=".ugly">?????????</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="row featured__filter">
			<%if(vo!=null){ %>
			<input type='hidden' name='mbId' value='<%=vo.getMbId()%>'>
			<%} %>
			<%
				System.out.println(list2.size());
	            for(int i=0; i<list2.size();i++){
		            String str = list2.get(i).getMbId();
		            String[] str_id = str.split("@");
		            String str2 = list2.get(i).getSafeCenter();
		            String[] str2_id = str2.split(" ");
            %>
				<div class="col-lg-3 col-md-4 col-sm-6 mix oranges <%= list2.get(i).getItemCate()%>">
					<div class="featured__item">
						<div class="featured__item__pic set-bg">
							<span><a href="shop-details.jsp?itemSeq=<%=list2.get(i).getItemSeq()%>"><img alt="freshmeat"
									src="./img/<%= list2.get(i).getItemImg1()%>"></a></span>
							<ul class="featured__item__pic__hover">
								<li><a href="#"><i class="fa fa-heart"></i></a></li>
								<li><a href="#"><i class="fa fa-retweet"></i></a></li>
								<!-- <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li> -->
								<li><a onclick = "addCart(<%=list2.get(i).getItemSeq() %>)" ><i class="fa fa-shopping-cart"></i></a></li>
							</ul>
						</div>
						<div class="featured__item__text">
							<div>
								<span class="clock"
									data-time="<%= list2.get(i).getItemDeadline() %>">clock</span> 
									<span><a href="./shop-details.jsp"><%=list2.get(i).getItemName()%></a></span>
							</div>
							<div>
								<span class="seller"><i class="fa fa-solid fa-user"></i><%= str_id[0] %></span>
								
									<span class="location"><i class="fa fa-solid fa-map"></i><%= str2_id[0]%></span>
								
								<span class="price"><i class="fa fa-solid fa-won"></i><fmt:formatNumber value="<%= list2.get(i).getItemPrice() %>" pattern="#,###" /></span>
								
							</div>
						</div>
					</div>
				</div>
				<%}%>
				<%// ?????? lib, el ???????????? (fmt) formatting  %>
			</div>
		</div>
	</section>
	<!-- Featured Section End -->

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
	<script src="js/moment.min.js"></script>
	<script src="js/main.js"></script>

	<script>
	    let date1 = moment(); //"YYYY-MM-DD HH:mm:ss"
	    let date2 = document.getElementsByClassName("clock");
    	function clock() {
			for(let i = 0; i < date2.length; i++) {
				let date1 = moment();
				let now_date = date1.format("YYYY-MM-DD HH:mm:ss");
			    let due_date = moment(date2[i].getAttribute('data-time'));
			    let time = due_date.diff(now_date, "seconds");
			    let day = parseInt(time/86400);
			    time %= 86400;
			    let hour = parseInt(time/3600);
			    time %= 3600;
			    let minute = parseInt(time/60);
			    let second = parseInt(time%60);
				date2[i].innerText = `\${day}??? `+
				`\${hour < 10 ? `0\${hour}` : hour}:`+
				`\${minute < 10 ? `0\${minute}` : minute}:`+
				`\${second < 10 ? `0\${second}` : second}`;
			}
			console.log("clock()??????")
	    }
	    setInterval(function() {clock()}, 1000); // 1????????? ??????
	    
		var alert = function(title, msg, type) {
			swal({
				title : title,
				text : msg,
				type : type,
				button: "???????????????!!"
			});
		}
	    function addCart(seq){
	    	  $.ajax({
		            url : "ajx_addCart.do",
		            type : "post",
		            data : {
		            	mbId : $('input[name=mbId]').val(),
		            	seq : seq,
		            },
		            dataType : "text",
		            success : function(res) {
		               if(res == 1){
		                  //alert('??????','??????????????? ??? ???????????? ????','success')
		            	   swal({
		       				title : '??????',
		       				text : '??????????????? ??? ???????????? ????',
		       				icon : 'success',
		       				button: "???????????????~"
		       			});
		               }else {
		                  alert('??????','??????????????? ????????? ??????????????????.','error')
		               }
		            },
		            error : function(){
		               alert('??????');
		            }
		         });
	    }
	    
	    
    </script>
</body>
</html>