<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- DAO 인스턴스 -->
<%@ page import = "User.UserDAO" %>
<!-- 출력 -->
<%@ page import = "java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>

<!--  -->
<!-- User패키지에 클래서 User -->

<jsp:useBean id="User" class="User.User" scope="page"></jsp:useBean>
<jsp:setProperty name="User" property="userID" />
<jsp:setProperty name="User" property="userPassword" />



<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		UserDAO userDAO = new UserDAO();
		int result = userDAO.login(User.getUserID(), User.getUserPassword());
		
		// 1이면 로그인 성공
		// 로그인 실행 결과에 따라 화면에 띄울 스크립트 생성
		if(result==1){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			// 대소문자 조심
			script.println("location.href='index.jsp'");
			script.println("</script>");
		}else if(result ==0 ){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('비밀번호가 잘못되었습니다.')");
			script.println("history.back();");
			script.println("</script>");
		}else if(result==-1){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('아이디가 존재하지 않습니다.')");
			script.println("history.back();");
			script.println("</script>");
		}else if(result == -2){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('DB에서 오류가 발생했습니다.')");
			script.println("history.back();");
			script.println("</script>");
		}
		%>
</body>
</html>