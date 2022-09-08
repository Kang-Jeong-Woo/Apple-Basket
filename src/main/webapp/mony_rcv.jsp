<%@ page contentType="text/html;charset=utf-8" %>
<%
	String rcid		= request.getParameter("reCommConId");
	String rctype	= request.getParameter("reCommType");
	String rhash	= request.getParameter("reHash");
	String a = request.getParameter("a");
	String b = request.getParameter("b");
	String c = request.getParameter("c");
%>
<html>
<head>
<meta http-equiv="Cache-Control" content="no-cache"> 
<meta http-equiv="Pragma" content="no-cache"> 
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>AppleMarket(<%=rcid%>)</title>
<script language="JavaScript">
<!--
    function init()
	{
 		if (typeof(top.opener) == "undefined" || typeof(top.opener.eparamSet) == "undefined" || typeof(top.opener.goResult) == "undefined")
 		{ //전달 못받을경우.. 존재하지않을경우
 			alert("이전 페이지를 확인할 수 없어 결제를 중단합니다!!");
 			self.close();
 			return;
 		}
	<% if (null != rcid && 10 > rcid.length()){ %>
			alert("결제요청정보(<%=rcid%>)를 확인할 수 없어 결제를 중단합니다!!");
			self.close();
			return;
	<% }else{ %>
	        top.opener.eparamSet("<%=rcid%>","<%=rctype%>","<%=rhash%>");
	        top.opener.goResult();
	<% } %>
			setTimeout( 'self.close()', '3000' );
	    }

    init();
-->
</script>
</head>
<body>
 	<table width="100%" height="100%" border="0" cellspacing="0" cellpadding="0">
     <tr>
        <td valign="middle" align="center"><table width="450" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><img src="./img/processing.gif" width="450" height="141"></td>
          </tr>
          <tr>
            <td><img src="./img/process_step.gif" width="456" height="20"></td>
          </tr>
        </table>		
		</td>
      </tr>
    </table>
</body>
</html>