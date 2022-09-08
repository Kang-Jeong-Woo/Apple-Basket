<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.foodsharing.DAO.*"%>
<%@page import="com.foodshring.VO.*"%>    
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
    	<section class="featured spad">
	        <div class="container">
	        	<div class="col-lg-12">
	        		<form action="./communittyModify.do" method="post" enctype="multipart/form-data">
	        		<input type="hidden" name="articleSeq" value="${communittyView.articleSeq}">
	        		<input type="hidden" name="mbId" value="${communittyView.mbId}">
							<table class="table">
							  <thead>
							    <tr>
							      <th scope="col" class="text-right">작성자</th>
							      <th class="text-left align-middle">${communittyView.uname}</th>
							    </tr>
							  </thead>
							  <tbody>
							    <tr>
							      <th scope="row" class="text-right align-middle">제목</th>
							      <td>
							         <div class="checkout__input">
                                       <input type="text" name="articleTitle" value="${communittyView.articleTitle}">
                                    </div>
							      </td>
							    </tr>
							    <tr>
							      <th scope="row" class="text-right align-middle">파일</th>
							      <td><input type="file" name="articleFile" size="80" >&nbsp;${communittyView.articleFile}</td>
							    </tr>
							    <tr>
							      <th scope="row"  class="text-right align-middle">작성내용</th>
							      <td><textarea name="articleContent" cols="100" rpws="100">${communittyView.articleContent}</textarea></td>
							    </tr>
							  </tbody>
							  	<tr>
							      <th scope="row"></th>
							      <td class="text-center"><button type="button" class="btn btn-primary" onclick="history.go(-1);">이전으로</button>
							      <button type="submit" class="btn btn-info">수정하기</button>
							      </td>
							    </tr>
							  </tbody>
							</table>
					 	</form>
	        	</div>
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
    <script src="https://cdn.ckeditor.com/4.19.1/standard/ckeditor.js"></script> 
		<script>
			CKEDITOR.replace('articleContent');
		</script>
</body>
</html>