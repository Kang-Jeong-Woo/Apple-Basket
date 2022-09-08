<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>AppleBasket</title>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
	<%@ taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt" %>

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
    <section class="breadcrumb-section set-bg" data-setbg="img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>안전주소</h2>
                        <div class="breadcrumb__option">
                            <a href="./index.jsp">Home</a>
                            <span>안전주소 항목보기</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->
    <!-- Map Begin -->
    <div class="map">
			    	<div class="col-lg-12">
	        		<div class='content' style="width: 100%; margin-bottom: 10px;">
			<table class="table table-hover">
				<thead>
					<tr>
						<th style="width: 5%" class="text-right">번호</th>
						<th class="text-center" style="width: 15%">상품명</th>
						<th style="width: 15%" class="text-center">판매장소</th>
						<th style="width: 20%" class="text-right">판매주소</th>
						<th style="width: 25%" class="text-center">판매자</th>
						<th style="width: 10%" class="text-right">마감일</th>
						<th style="width: 10%" class="text-right">등록일</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${fn:length(list) > 0}">
						    <c:set var="i" value="1"/>
						 		<c:forEach items="${list}" var="row">
						 			<tr>
						 				<td id='tdStyle' class="text-right">${row.safeSeq}</td>
						 				<td name='title' class="text-center"><a href="shop-details.jsp?itemSeq=${row.itemSeq}">${row.itemName}</a></td>
						 				<td name='title' class="text-center"><a href="shop-details.jsp?itemSeq=${row.itemSeq}">${row.safeCenter}</a></td>
						 				<td name='title' class="text-right"><a href="shop-details.jsp?itemSeq=${row.itemSeq}">${row.safeAddr}</a></td>
						 				<td name='title' class="text-right">${row.userNm}</td>
						 				<td name='title' class="text-right">${row.itemDeadline}</td>
						 				<td name='title' class="text-right">${row.regDate}</td>
						 			</tr>
						 		</c:forEach>
							<c:set var="i" value="0"/>
						</c:when>
						<c:otherwise>
							 <tr>
								<td colspan="5" align="center">작성된 게시물이 없습니다.</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
			
								
			
	           </div>
	           <!-- 페이징 시작 -->
					<c:if test="${ page.currentPage > page.block }">
					<c:choose>
						<c:when test="${search == null }">
							<center>
								<a href="MapView.do?pageNum=1">처음</a>&nbsp;
				                <a href="MapView.do?pageNum=${ page.startPage - 1 }">이전</a>&nbsp;
			                </center>
	                        </c:when>
						<c:otherwise>
							<a href="MapView.do?pageNum=1&select=${select}&search=${search }">처음</a>&nbsp;  
	                        <a href="MapView.do?pageNum=${ page.startPage - 1}&select=${select }&search=${search }">이전</a>&nbsp;
	                    </c:otherwise>
					</c:choose>
				</c:if>
				<c:if test="${ page.currentPage <= page.block }">
					<span style="color: gray;">처음&nbsp;</span>
					<span style="color: gray;">이전&nbsp;</span>
				</c:if>
				<c:forEach var="i" begin="${ page.startPage }"
					end="${ page.endPage }">
					<c:if test="${ i == page.currentPage }">
						<strong>${ i }&nbsp;</strong>
					</c:if>
					<c:if test="${ i != page.currentPage }">
						<c:choose>
							<c:when test="${search == null }">
								<a href="MapView.do?pageNum=${ i }">${ i }&nbsp;</a>
							</c:when>
							<c:otherwise>
								<a href="MapView.do?pageNum=${ i }&select=${select }&search=${search }">${ i }&nbsp;</a>
							</c:otherwise>
						</c:choose>
					</c:if>
				</c:forEach>
				<c:if test="${ page.endPage < page.allPage }">
					<c:choose>
						<c:when test="${search == null }">
                             &nbsp;<a href="MapView.do?pageNum=${ page.endPage + 1 }">다음</a>
                             &nbsp;<a href="MapView.do?pageNum=${ page.allPage }">끝</a>
						</c:when>
						<c:otherwise>
	                         &nbsp;<a href="MapView.do?pageNum=${ page.endPage + 1 }&select=${select }&search=${search }">다음</a>
	                         &nbsp;<a href="MapView.do?pageNum=${ page.allPage }&select=${select }&search=${search }">끝</a>
						</c:otherwise>
					</c:choose>
				</c:if>
				<c:if test="${ page.endPage >= page.allPage }">
						<span style="color: gray;">&nbsp;다음</span>
					    <span style="color: gray;">&nbsp;끝</span>
				</c:if>	
				<!-- 페이징 끝 -->
				<div class="text-right">
					<button type="button" class="btn btn-primary" onclick="history.go(-1);">이전으로</button>
				</div>
	        </div>
        
    </div>
    <!-- Map End -->
    
    <div class="contact-form spad"></div>

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
    <script src="js/main.js"></script>



</body>

</html>