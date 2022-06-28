<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%= request.getParameter("age") %>
<% out.println(request.getParameter("age")); %>
<br>
<% 	// getParameter는 무조건 String으로 받아옴
	int a = Integer.parseInt(request.getParameter("num1"));
	int b = Integer.parseInt(request.getParameter("num2"));
	int result = a +b;
	
	// A에 전달한다.
	String url = "A.jsp";

/* 	// get 방식
	String appendUrl = "?result="+result;
	response.sendRedirect(url+appendUrl); */
	
	// post 방식
	pageContext.getSession().setAttribute("result", result);
	response.sendRedirect(url);

   %>
</body>
</html>