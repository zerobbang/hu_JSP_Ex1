<!-- JSP로 구구단 만들어 보기 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<!-- JSP 사용 여부 가져오기 -->
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구구단 JSP</title>
</head>
<body>
<!-- forEach 반본문 -->
<c:forEach var = "dan" begin = "2" end="9" >
	<c:forEach var = "i" begin = "1" end = "9">
		<c:out value="${dan} * ${i} = ${dan*i}"/>
		<br>
	</c:forEach>	
	<br>
</c:forEach>
</body>
</html>