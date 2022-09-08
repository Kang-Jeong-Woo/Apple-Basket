<%@page import="com.foodshring.VO.t_memberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
		t_memberVO mem_vo = (t_memberVO)session.getAttribute("vo"); 
		if(mem_vo==null){%>
			<script> 
			alert("로그인하시기 바랍니다.") 
			history.back();
			</script>
		<%}%>
</body>
</html>