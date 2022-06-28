<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@page import="java.util.Enumeration"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action ="B.jsp">
	<input name='age' type='text'>
	<button type='submit'>버튼</button>
	<br>
	<input name='num1' type='text'>
	<input name='num2' type='text'>
	<button type="submit">출력</button>
	
</form>
<% 	
/* 	// get 방식
	String name = request.getParameter("name");
	out.println(name); */
	
	
	// post 방식
	String resultFromB = String.valueOf(pageContext.getSession().getAttribute("result"));
	out.println(resultFromB);
	
	

	%>

<%-- // 헤더 모든 정보 받아오기
	<%
	Enumeration names = request.getHeaderNames();
	while (names.hasMoreElements()) {
    String name = (String)names.nextElement();
    out.println(name+" : ["+request.getHeader(name) + "]<br/>");
}
%> --%>
</body>
</html>