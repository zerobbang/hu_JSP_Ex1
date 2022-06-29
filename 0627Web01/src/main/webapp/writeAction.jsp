<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- DAO 인스턴스 -->
<%@ page import = "bbs.BbsDAO" %>
<!-- 출력 -->
<%@ page import = "java.io.PrintWriter" %>

<% request.setCharacterEncoding("UTF-8"); %>

<!-- bbs 패키지 -->
<jsp:useBean id="bbs" class="bbs.Bbs" scope="page"></jsp:useBean>
<jsp:setProperty name="bbs" property="bbsTitle" />
<jsp:setProperty name="bbs" property="bbsContent" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%

	String userID = null;

	if(session.getAttribute("userID")!=null){
		// 세션이 유저 id가 비어있지 않으면 가져온다.
		userID = (String)session.getAttribute("userID");
	}
	
	// 위 코드에서 userID 추출 > 스트링 변수에 저장
	if(userID==null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인 필요.')");
		script.println("location.href='login.jsp'");
		script.println("</script>");
	}else{ 
		// 유저 아이디 있을 경우
		if(bbs.getBbsTitle()==null || bbs.getBbsContent()==null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert(제목과 내용을 입력해주세요.')");
			script.println("history.back();");
			script.println("</script>");
		}else{
			// 비어있지 않으면
			BbsDAO bbsDAO = new BbsDAO();
			//글쓰기 백로직 실행
			int result = bbsDAO.write(bbs.getBbsTitle(), userID, bbs.getBbsContent());
			if(result==-1){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('글쓰기 실패')");
				script.println("history.back();");
				script.println("</script>");
			}else{
			// 글 쓰기 성공하면
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href='bbs.jsp'");
			script.println("</script>");
		}
		}
	}


%>
</body>
</html>