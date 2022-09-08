<%@page import="com.foodshring.VO.SelectBasketVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.foodsharing.DAO.t_basketDAO"%>
<%@page import="com.foodshring.VO.t_memberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>FoodSharing</title>

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap"
	rel="stylesheet">

<!-- CSS Styles -->
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
	<% 
	
	t_memberVO vo = (t_memberVO)session.getAttribute("vo");
	//사이트주소
	String requestUri=request.getRequestURI().toString();
	
	//프로젝트명
	String requestContextPath=request.getContextPath();
	
	//command
	String command=requestUri.substring(requestContextPath.length(),requestUri.length());
	
	System.out.println("requestUri : "+requestUri);
	System.out.println("command : "+command);
	System.out.println("requestContextPath : "+requestContextPath);
	%>
	<!-- Header Section Begin -->
	<header>
		<div class="container">
			<div class="row">
				<div class="col-lg-3">
					<div class="header__logo">
						<a href="./index.jsp"><img src="img/logo.png" alt=""></a>
					</div>
				</div>
				<div class="col-lg-6">
					<nav class="header__menu">
						<ul class="active" >
							<li><a href="./index.jsp" <% if(command.equals("/index.jsp")){%>style="color: #7FAD39;"<%} %>>홈</a></li>
							<li><a href="./shop-grid.jsp" <% if(command.equals("/shop-grid.jsp")){%>style="color: #7FAD39;"<%} %>>상품목록</a></li>
							<li><a href="communittyList.do" <% if(command.contains("communittyList")){%>style="color: #7FAD39;"<%} %>>커뮤니티</a></li>
							<!-- <li><a href="#">게시판</a>
								<ul class="header__menu__dropdown">
									<li><a href="#">1.게시판</a></li>
									<li><a href="#">2.게시판</a></li>
								</ul></li> -->

							<li><a href="./MapList.do" <% if(command.equals("/MapList.do")){%>style="color: #7FAD39;"<%} %>>안전주소</a></li>


							<% if(vo!=null && vo.getMbGubun().equals("1")){ %>
								<li><a href="./farmer-itemlist.jsp?MbId=<%=vo.getMbId()%>" <% if(command.equals("/farmer-itemlist.jsp")){%>style="color: #7FAD39;"<%} %>>판매목록</a></li>
							<%}%>
						</ul>
					</nav>
				</div>
				<div class="col-lg-3">
					<div class="header__cart" style="float: center">
						<div class="header__top__right__auth">
							<%if(vo == null){%>
							<a href="login.jsp"><i class="fa fa-user">로그인</i></a>
							<%}else {%>
							<ul>
								<li><a href="./shoping-cart.jsp"><i class="fa fa-shopping-bag"></i> 
								<span>
								<%	t_basketDAO basket_dao = new t_basketDAO();
								ArrayList<SelectBasketVO> list = basket_dao.getAll(vo.getMbId());
								%>
								<%=list.size() %>
								 </span></a></li>
							<li class="header__cart__price" style ="0px 4px;">item: <span>0원</span></li>
							 <li style="float:right;"><a href="LogoutCon.do"><%=vo.getMbName()%>님 &nbsp;<i class="fa fa-user">로그아웃</i></a></li>
							</ul>
							<%}%>
						</div>
					</div>
				</div>
			</div>
			<div class="humberger__open">
				<i class="fa fa-bars"></i>
			</div>
		</div>
	</header>
	<!-- Header Section End -->

	</script>
</body>
</html>