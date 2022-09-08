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

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt" %>

<title>FoodSharing</title>

	<!-- Google Font -->
	<link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" type="text/css">
</head>

<body>
	<%//memberVo vo = (userVo)session.getAttribute("vo"); %>
		
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>
    
    <!-- Humberger Begin -->
		<%@ include file="../Humberger.jsp" %>
    <!-- Humberger End -->
    
	<!-- Header Section Begin -->
		<%@ include file="../header.jsp" %>
	<!-- Header Section end -->
	
				<div class="row">
				<div class='col-md-6'></div>
				</div>
		</div>
    	<section class="featured spad">
	        <div class="container">
	        	<div class="col-lg-12">
	        		<div class='content' style="width: 100%; margin-bottom: 10px;">
			<table class="table table-hover">
				<thead>
					<tr>
						<th style="width: 10%">번호</th>
						<th class="text-center">제목</th>
						<th style="width: 20%" class="text-center">작성자</th>
						<th style="width: 10%" class="text-right">작성일자</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${fn:length(list) > 0}">
						    <c:set var="i" value="1"/>
							<c:forEach items="${list}" var="row">
								<tr>
									<td id='tdStyle'>${row.articleSeq}</td>
									<td name='title'><a href="communittyView.do?articleSeq=${row.articleSeq}">${row.articleTitle}</a>&nbsp;<small>(${row.countNum})</small>
									<input type="hidden" id="tid" name='articleSeq' value='${row.articleSeq}'></td>
									<td id='tdStyle'>${row.uname}<input type="hidden" id="mbId" name='mbId' value='${row.mbId}'></td>
									<td id='tdStyle' class="context-right">${row.articleDate}</td>
								</tr>
								<c:set var="i" value="${i+1}"/>
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
			
					<c:choose>
					    <c:when test="${sessionScope.vo ne null}">
							<div class="text-right">
							<button type="button" class="btn btn-primary" onclick="location.href='communitty/communittyWrite.jsp';">작성하기</button>
					    </c:when>
					    <c:otherwise>
					    </c:otherwise>
					</c:choose>
			
	           </div>
	           <!-- 페이징 시작 -->
				<c:if test="${ page.currentPage > page.block }">
					<c:choose>
						<c:when test="${search == null }">
							<center>
								<a href="communittyList.do?pageNum=1">처음</a>&nbsp;
				                <a href="communittyList.do?pageNum=${ page.startPage - 1 }">이전</a>&nbsp;
			                </center>
	                        </c:when>
						<c:otherwise>
							<a href="communittyList.do?pageNum=1&select=${select}&search=${search }">처음</a>&nbsp;  
	                        <a href="communittyList.do?pageNum=${ page.startPage - 1}&select=${select }&search=${search }">이전</a>&nbsp;
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
								<a href="communittyList.do?pageNum=${ i }">${ i }&nbsp;</a>
							</c:when>
							<c:otherwise>
								<a href="communittyList.do?pageNum=${ i }&select=${select }&search=${search }">${ i }&nbsp;</a>
							</c:otherwise>
						</c:choose>
					</c:if>
				</c:forEach>
				<c:if test="${ page.endPage < page.allPage }">
					<c:choose>
						<c:when test="${search == null }">
                             &nbsp;<a href="communittyList.do?pageNum=${ page.endPage + 1 }">다음</a>
                             &nbsp;<a href="communittyList.do?pageNum=${ page.allPage }">끝</a>
						</c:when>
						<c:otherwise>
	                         &nbsp;<a href="communittyList.do?pageNum=${ page.endPage + 1 }&select=${select }&search=${search }">다음</a>
	                         &nbsp;<a href="communittyList.do?pageNum=${ page.allPage }&select=${select }&search=${search }">끝</a>
						</c:otherwise>
					</c:choose>
				</c:if>
				<c:if test="${ page.endPage >= page.allPage }">
						<span style="color: gray;">&nbsp;다음</span>
					    <span style="color: gray;">&nbsp;끝</span>
				</c:if>		
				<!-- 페이징 끝 -->
	        </div>
        </section>
	
	<!-- Footer Section Begin -->
	<%@ include file="../footer.jsp" %>
	<!-- Footer Section End -->

    <!-- Js Plugins -->
    <script src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.nice-select.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery-ui.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.slicknav.js"></script>
    <script src="${pageContext.request.contextPath}/js/mixitup.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/owl.carousel.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/main.js"></script>

</body>
</html>