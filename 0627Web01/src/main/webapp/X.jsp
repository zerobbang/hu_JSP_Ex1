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
		// JSTL, JSP 주고 받기 방법 2 > request 나 session에 담기
		session.setAttribute("name", "홍길동");
	%>
</body>
</html>