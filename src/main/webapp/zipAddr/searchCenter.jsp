<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>우리동네 안전주소</title>
<script type="text/javascript">
</script>
</head>
<body>
<div id="dialog">
    <h2>안전주소 검색</h2>
    <form action="search" method="post" onsubmit="return check(this);">
        <div>
            <label for="keyword">주소 : </label>
            <input type="text" name="keyword" size="20">
            <input type="submit" value="검색" /><br />
            <span>-지역구를 선택 하세요.</span><br />
        </div>
    </form><br /><br />
    <c:if test="${not empty postalCodes}">
        <h3>검색 결과에서 적절한 안전주소를 선택하세요.</h3>
        <table>
            <tr>
                <th>지역 구</th>
                <th>센터 명</th>
                <th>주소 명</th>
            </tr>
            <c:forEach var="postalCode" items="${postalCodes}">
            <tr>
                <td>
                    <a href="javascript:close_search(${postalCode.no});"
                        id="gungu_${postalCode.no}">${postalCode.code}</a>
                </td>
                <td>
                    <a href="javascript:close_search(${postalCode.no});"
                        id="addr_${postalCode.no}">${postalCode.address}</a>
                </td>
                 <td>
                    <a href="javascript:close_search(${postalCode.no});"
                        id="center_${postalCode.no}">${postalCode.address}</a>
                </td>
            </tr>
            </c:forEach>
        </table>
    </c:if>
</div>
</body>
</html>