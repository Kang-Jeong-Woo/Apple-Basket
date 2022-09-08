<%@page import="java.util.Arrays"%>
<%@page import="com.foodshring.VO.t_itemVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.foodsharing.DAO.t_itemDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Applebasket | shop-main</title>

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
		<%@ include file="../Humberger.jsp" %>
    <!-- Humberger End -->
    
    <!-- Header Section Begin -->
    	<%@ include file="../header.jsp" %>
    <!-- Header Section End -->




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
                                    전체카테고리
                                    <span class="arrow_carrot-down"></span>
                                </div>
                                <input type="text" placeholder="어떤 재료가 필요하시나요?">
                                <button type="submit" class="site-btn"></button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Hero Section End -->

    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>Apple Basket</h2>
                        <div class="breadcrumb__option">
                            <a href="./index.jsp">Home</a>
                            <span>Shop</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->
			<section class="product-details spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6">
                    <div class="product__details__pic">
                        <div class="product__details__pic__item">
                            <img class="product__details__pic__item--large" src="./img/${itemVo.itemImg1}" alt="fresh">
                        </div>
                        <div class="product__details__pic__slider owl-carousel owl-loaded owl-drag">
                        <div class="owl-stage-outer"><div class="owl-stage" style="transform: translate3d(-862px, 0px, 0px); transition: all 1.2s ease 0s; width: 1582px;">
	                        <div class="owl-item cloned" style="width: 123.75px; margin-right: 20px;"><img src="./img/${itemVo.itemImg3}" alt="fresh"></div>
	                        <div class="owl-item cloned" style="width: 123.75px; margin-right: 20px;"><img src="./img/${itemVo.itemImg1}" alt="fresh"></div>
	                        <div class="owl-item cloned" style="width: 123.75px; margin-right: 20px;"><img src="./img/${itemVo.itemImg2}" alt="fresh"></div>
	                        <div class="owl-item cloned" style="width: 123.75px; margin-right: 20px;"><img src="./img/${itemVo.itemImg3}" alt="fresh"></div>
	                        <div class="owl-item" style="width: 123.75px; margin-right: 20px;"><img src="./img/${itemVo.itemImg1}" alt="fresh"></div>
	                        <div class="owl-item" style="width: 123.75px; margin-right: 20px;"><img src="./img/${itemVo.itemImg2}" alt="fresh"></div>
	                        <div class="owl-item active" style="width: 123.75px; margin-right: 20px;"><img src="./img/${itemVo.itemImg3}" alt="fresh"></div>
	                        <div class="owl-item cloned active" style="width: 123.75px; margin-right: 20px;"><img src="./img/${itemVo.itemImg1}" alt="fresh"></div>
	                        <div class="owl-item cloned active" style="width: 123.75px; margin-right: 20px;"><img src="./img/${itemVo.itemImg2}" alt="fresh"></div>
	                        <div class="owl-item cloned active" style="width: 123.75px; margin-right: 20px;"><img src="./img/${itemVo.itemImg3}" alt="fresh"></div>
	                        <div class="owl-item cloned" style="width: 123.75px; margin-right: 20px;"><img src="./img/${itemVo.itemImg1}" alt="fresh"></div>
                        </div>
                        </div>
	                        <div class="owl-nav disabled">
		                        <button type="button" role="presentation" class="owl-prev">
		                        	<span aria-label="Previous">‹</span>
		                        </button>
		                        <button type="button" role="presentation" class="owl-next">
		                        	<span aria-label="Next">›</span>
		                        </button>
	                        </div>
	                        <div class="owl-dots disabled">
	                        	<button role="button" class="owl-dot active">
	                        		<span></span>
	                        	</button>
	                        </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                    <div class="product__details__text">
                        <h3>${itemVo.itemName}</h3>
                        <div class="product__details__rating">
                           <c:choose>
								 <c:when test="${review_rating eq 0 }">
								 <span class='starYellow' style='color: orange;'>☆☆☆☆☆</span>
								 </c:when>
								<c:when test="${review_rating eq 1 }">
								  <span class='starYellow' style='color: orange;'>★☆☆☆☆</span>
								 </c:when>
								 <c:when test="${review_rating eq 2 }">
								 <span class='starYellow' style='color: orange;'>★★☆☆☆</span>
								 </c:when>
								 <c:when test="${review_rating eq 3 }">
								 <span class='starYellow' style='color: orange;'>★★★☆☆</span>
								 </c:when>
								 <c:when test="${review_rating eq 4 }">
								 	<span class='starYellow' style='color: orange;'>★★★★☆</span>
								 </c:when>
								 <c:otherwise>
								  <span class='starYellow' style='color: orange;'>★★★★★</span>
								 </c:otherwise>
							</c:choose>
                          	<span>(<c:out value="${cnt}"/> reviews)</span>
                        </div>
                       
                        <div class="product__details__price"> <fmt:formatNumber type="number" maxFractionDigits="0"  value="${itemVo.itemPrice}" /><h3>(1인당 
                        <c:set var="pri" value="${itemVo.itemPrice}" />
                        <fmt:formatNumber type="number" maxFractionDigits="0"  value="${pri div 4}" /> )</h3></div> 
                        <p>${item.itemDesc}</p>
                        <div class="product__details__quantity">
                            <div class="quantity">
                                <div class="pro-qty">
                                    <input type="text" style="width: 100px" id="SSS" value="${itemVo.itemQuant}">
                                </div>
                            </div>
                        </div>
                        <ul>
                        	<li><b>남은 시간</b><span class="clock" data-time="${itemVo.itemDeadline}">${itemVo.itemDeadline}</span></li>
                        	<li><b>신청인</b><span> ${itemVo.curQuant}/4</span></li>
                            <li><b>판매자</b><span>${itemVo.userNm}</span></li>
                            <li><b>안전주소</b><c:out value="${itemVo.safeSeqNm}"/></li>
                        </ul>
                        
                        <div class="text-right"  style="padding-top: 250px;">
                        	<button type="button" class="btn btn-secondary" onclick="javascript:history.go(-1);">목록 </button> | <button type="button" class="btn btn-warning" onclick="javascript:modify();"> 수정 </button> | <button type="button" class="btn btn-danger" onclick="javascript:Delete();">삭제</button>	
                    	</div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Footer Section Begin -->
	<%@ include file="../footer.jsp" %>
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
	   function modify(){
		   setTimeout(() => {
			 	var itemSeq="${itemVo.itemSeq}";
				var url = "<c:url value='./purchaseUpdate.do'/>?itemSeq="+itemSeq;
				$(location).attr('href', url);
			}, 500);
	   }
	   
	   function Delete(){
		   setTimeout(() => {
			 	var itemSeq="${itemVo.itemSeq}";
				var url = "<c:url value='./purchaseDelete.do'/>?itemSeq="+itemSeq;
				$(location).attr('href', url);
			}, 500);
	   }
    </script>
</body>

</html>