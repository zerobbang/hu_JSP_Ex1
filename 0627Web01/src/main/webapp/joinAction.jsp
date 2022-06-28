<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- DAO 인스턴스 -->
<%@ page import = "User.UserDAO" %>
<!-- 출력 -->
<%@ page import = "java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>

<!-- User패키지에 클래서 User -->
<jsp:useBean id="User" class="User.User" scope="page"></jsp:useBean>
<jsp:setProperty name="User" property="userID" />
<jsp:setProperty name="User" property="userPassword" />
<jsp:setProperty name="User" property="userName" />
<jsp:setProperty name="User" property="userGender" />



<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>회원가입 액션</title>
</head>
<body>
	<%
		UserDAO userDAO = new UserDAO();
		int result = userDAO.join(User);
		
		// 벡엔드에서 유효성 검사
		if(User.getUserID()==null || User.getUserPassword()==null || User.getUserName()==null || User.getUserGender()==null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('빈칸이 있습니다.')");
			script.println("history.back();");
			script.println("</script>");
			return; // 회원가입 과정 종료
		}else{
			if(result==1){	//회원가입 성공시
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href='login.jsp'");
			script.println("</script>");
			}
			else if(result==-1){	 //중복발생
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('아이디가 이미 존재합니다.')");
				script.println("history.back()");	//뒤로가기
				script.println("</script>");
			}else if(result==2){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('빈칸이 있습니다.')");
				script.println("history.back();");
				script.println("</script>");
			}
			else{
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('처리하지 못한 이상한 에러가 발생했습니다.')");
				script.println("history.back()");	//뒤로가기
				script.println("</script>");
			}
		}
		%>
</body>
</html>
