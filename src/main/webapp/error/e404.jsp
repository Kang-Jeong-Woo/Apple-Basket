<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Error404</title>
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
<style>

#content {
	font-size: 12px;
	font-family: sans-serif;
	width: 862px;
}

table {
	border-collapse: collapse;
	border: 1px solid black;
	width: 800px;
}

table th {
	background: #7BA518;
	padding: 5px;
	border: 1px dotted black;
}

table td {
	padding: 5px;
	border: 1px dotted black;
}
</style>
</head>
<body>
	<br />
	<br />
	<center>
	<div id="content">
		<img src="img/error/error404.png" alt="404에러~" />
		<table>
			<tr>
				<th>오류</th>
			</tr>
			<tr>
				<td style="text-align: center;color: white;font-size: 20px;"><B>예상하지 못한 에러가 발생했습니다.</B></td>
			</tr>
		</table>
			<br />
			<center>
				<button type="button" class="btn text-white" style="background-color: green;" onclick="location.href='index.jsp'">이전으로</button>
			</center>
		</div>
	</center>
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