<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>hello</div>
	<div>안녕</div>
	<%= new java.util.Date() %>
	<%
		for(int i=0; i<10; i++){
			out.println(i);
		}
		%>
	
</body>
</html>