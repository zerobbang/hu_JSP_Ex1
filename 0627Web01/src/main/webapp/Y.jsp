<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
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
	// 내장되어 있는 함수 호출
	out.println(session.getAttribute("name"));
	%>
	
	<!-- choose : case 같은 개념 , otherwise : default 개념-->
	<c:choose>
	<c:when test="${sessionScope.name eq'홍길동'}"> <!-- el 표기법 - 라이브러리 필요 -->
		<c:out value="홍길동!!"/>
	</c:when>
	<c:otherwise>
		<c:out value="홍길동 아님"/>
	</c:otherwise>
	</c:choose>
</body>
</html>