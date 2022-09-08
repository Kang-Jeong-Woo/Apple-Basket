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
    	<section class="featured spad">
	        <div class='container'>
		<div class='header' style="margin-bottom: 20px;">
			<h2>게시글 정보</h2>
		</div>
		<div class='content' style="margin-bottom: 10px;">
			<table class="table">
				<tr>
					<th>번호</th>
					<td>${communittyView.articleSeq}</td>
				</tr>
				<tr>
					<th>작성자</th>
					<td>${communittyView.uname}</td>
				</tr>
				<tr>
					<th>업로드 된파일</th>
					<td>
						<c:choose>
			        		<c:when test="${!empty communittyView.articleFile}">
			        			<a href="./upload/${communittyView.articleFile}">${communittyView.articleFile}</a>
			        		</c:when>
			        		<c:otherwise>
			        			파일이 존재하지 않습니다.
			        		</c:otherwise>
			        	</c:choose>
					</td>
				</tr>
				<tr>
					<th>제목</th>
					<td>${communittyView.articleTitle}</td>
				</tr>

				<tr>
					<th>내용</th>
					<td style="height: 400px;">${communittyView.articleContent}</td>
				</tr>
			</table>

			<input type="hidden" id='articleSeq' value='${communittyView.articleSeq}'>
			
		</div>

		<div class='footer' style="margin-bottom: 50px">
			<div style="margin-bottom: 50px">
				<div>
					<h3>댓글</h3>
					
					<br/>
					<table class="table">
						<c:choose>
							<c:when test="${fn:length(comment) > 0}">
								<c:forEach items="${comment}" var="list">
									<tr>
										<td class="text-right align-middle">
											<input type="hidden" id="cmtSeq" name='cmtSeq' value='${list.cmtSeq}'>
											<strong>${list.userNm}</strong>
										</td>
										<td style="width: 60%;" align="left">
										&nbsp;${list.cmtContent}
										</td>
										<td style="width: 18%;" align="right">
										${list.cmtDate}
										  <c:if test="${sessionScope.vo.mbId == list.mbId}">
										 	<button class='btn btn-primary btn-sm' name='btnCDelete' onclick="commentDelete();">삭제</button>
										  </c:if>
										</td>
									</tr>
								</c:forEach>
							</c:when>
						</c:choose>
					</table>	
				</div>
				<div>
				<form method="post" action="./commentWrite.do">
					<table class="table">
						<tr>
							<c:choose>
								<c:when test="${sessionScope.vo.mbId != null}">
									<td style='vertical-align: middle;'><strong>${sessionScope.vo.mbName}</strong></td>
									<td style="width: 83%">
									
									<input type="hidden" id='articleSeq' name="articleSeq" value='${communittyView.articleSeq}'>
									<textarea class="form-control" name="cmtContent" id="cmtContent" rows="3"></textarea></td>
									<td style='vertical-align: middle;'>
										
										<button type="submit" class="btn btn-primary" id='btnWrite'>댓글작성</button>
										
									</td>
								</c:when>
								<c:otherwise>
									<td align="center" colspan="3">로그인 후 댓글을 입력할 수 있습니다.</td>
								</c:otherwise>
							</c:choose>
						</tr>
					</table>
					</form>	
						<%-- <input type="hidden" id='articleSeq' value='${communittyView.articleSeq}'> --%>
				</div>
			</div>
			<div class="text-right">
					<button type="button" class="btn btn-primary" id='btnBack' onclick="historyGo();">이전으로</button>
	    		   <c:if test="${sessionScope.vo.mbId == communittyView.mbId}">
					<button type="button" class="btn btn-primary" id='btnModify' onclick="modify();">수정</button>
					<button type="button" class="btn btn-primary" id='btnDelete' onclick="Delete()">삭제</button>
				</c:if>
			</div>
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
		CKEDITOR.replace('cmtContent');
		function modify(){
			var articleSeqNo='${communittyView.articleSeq}';
			var url = "<c:url value='/communittyUpdate.do'/>?articleSeq="+articleSeqNo;
			$(location).attr('href', url);
		}
		function historyGo(){
			var url = "<c:url value='/communittyList.do'/>";
			$(location).attr('href', url);
		}
		function Delete(){
			
			var cmtContent = document.getElementById("cmtContent").value;
			var articleSeqNo='${communittyView.articleSeq}';
			var url = "<c:url value='/communittyDelete.do'/>?cmtContent="+cmtContent+"&articleSeq="+articleSeqNo;
			$(location).attr('href', url);
		}
		
		function commentDelete(){
			var cmtSeq = document.getElementById("cmtSeq").value;
			var url = "<c:url value='/commentDelete.do'/>?cmtSeq="+cmtSeq;
			$(location).attr('href', url);
		}
	</script>
</body>
</html>