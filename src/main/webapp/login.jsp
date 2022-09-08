<%@page import="com.foodshring.VO.t_memberVO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lnag="ko">
<head>
	<meta charset="UTF-8">
	<title>로그인</title>
	<link rel="stylesheet" href="./css/login.css">
	<script src="login.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.12.4.min.js"></script>
	<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
</head>
<body>

	<div class="main">
		<!--웹페이지 상단-->
	<!-- Header Section Begin -->
<center>  <a href="index.jsp"> <img alt="apple basket" src="./img/logo.png"></a> </center>
<!-- Header Section end -->
	<div class="main-signup">
		
		<!--로그인 부분-->
		<span></span>
		<section class="login-wrap">
			<form action="LoginCon.do" method="post">
			<div class="login-id-wrap">
				<input placeholder="아이디" type="text" class="input-id" name = "mbId"></input>
			</div>
			<div class="login-pw-wrap">
				<input placeholder="비밀번호" type="password" name = "mbPw" class="input-pw" onkeyup="if(window.event.keyCode==13){Login()}"></input>
			</div>

			<div class="login-btn-wrap" onclick="Login()">
				<button class="login-btn" type ="submit" >로그인</button>
			</div>

			<div class="under-login">
				<span class="stay-check">
					<input type="checkbox" name="stay-btn" value="stay" class="stay-checkbox">로그인 상태 유지
				</span>
			</div>
			</form>
		</section>
		
		<!--회원가입-->
		<section class="join-wrap">
			<div class="join-box">
				<div class="join-btn">
					<a href="join.jsp" target="_blank" title="join">회원가입</a>
				</div>
			</div>
		</section>
		</div>
		
		<!--저작권 정보-->
		<footer>
			<div class="copyright-wrap">
				<span> <img src="" width=70px> Copyright </span>
			</div>
		</footer>
	</div>
</body>
<script>
	function Login() {
		  $.ajax({
	            url : "LoginCon.do",
	            type : "post",
	            data : {
	            	mbId : $('input[name=mbId]').val(),
	            	mbPw : $('input[name=mbPw]').val()
	            }, 
	            dataType : "text",
	            success : function(res) {
	               if(res == "1"){
	                  // 로그인 성공
	            	   //if(mbGubun.equals("1")){
	            	   //window.location.href="farmer-index.jsp";
	                  //}else{
	                	  //href 안에는 프로토콜이 들어있어야 해서 full path가 있어야 한다.
	                	  //.jsp로 쓰려면 java foward할때나 \
	                	  // 자바 객체가 아니라 브라우저 객체기 때문에 full path가 있어야한다.
	                	 //window.location.href="http://localhost:8081/FoodSharing2/index.jsp";
	                  // 로그인 성공    
	                	 location.href="index.jsp";
	               }else {
	                  // 로그인 실패
	                  alert('아이디 또는 비밀번호를 잘못 입력했습니다.\n입력하신 내용을 다시 확인해주세요.')
	                  //$('.error_msg').html('아이디 또는 비밀번호를 잘못 입력했습니다.<br>'
	                       // + '입력하신 내용을 다시 확인해주세요.');
	               }
	            },
	            fail : function(){
	               alert('실패');
	            }
	         });
	}
</script>
</html>