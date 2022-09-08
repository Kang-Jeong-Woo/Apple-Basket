<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>우리동네 안전주소 검색</title>
<link rel="stylesheet" type="text/css" href="./css/zipcode.css">
<script type="text/javascript" src="./js/zip.js"></script>
<script>
	function close_search(no,addr){
		
		window.opener.document.purchase.safeSeq.value = no;
			//document.getElementById("postalcode_" + no).childNodes[0].nodeValue;
	    window.opener.document.purchase.addr.value = addr;
	    	//document.getElementById("address_" + no).childNodes[0].nodeValue;
	    self.close();
		
	}
</script>
</head>
<body>
<div id="dialog">
	<h2>우편번호 검색</h2>
	<form action="./purchaseArrayList.do" method="post" onsubmit="return check(this);">
		<div>
			<label for="keyword">주소 : </label>
			<input type="text" name="keyword" size="20">
			<input type="submit" value="검색" /><br />
			<span>- 지명을 입력하세요.</span><br />
			<span class="error-text" id="error_keyword"></span>
		</div>
	</form><br /><br />
	<c:if test="${not empty postalCodes}">
		<h3>검색 결과에서 적절한 안전주소를 선택하세요.</h3>
		<table>
			<tr>
				<th>안전주소 구청</th>
				<th>주소</th>
			</tr>
			<c:forEach var="postalCode" items="${postalCodes}">
			<tr>
				<td>
					<a href="javascript:close_search(${postalCode.safeSeq},'${postalCode.safeAddr}');" id="postalcode_${postalCode.safeSeq}">${postalCode.safeCenter}</a>
				</td>
				<td>
					<a href="javascript:close_search(${postalCode.safeSeq},'${postalCode.safeAddr}');" id="address_${postalCode.safeSeq}">${postalCode.safeAddr}</a>
				</td>
			</tr>
			</c:forEach>
		</table>
	</c:if>
</body>
</html>