<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	// 로그인 된 사람만 글쓰기 화면 전환 가능
	String userID = null;
	if(session.getAttribute("userID")!=null){
		// 세션이 유저 id가 비어있지 않으면 가져온다.
		userID = (String)session.getAttribute("userID");
	}else{
		// 로그인 실패
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인해야 가능합니다.')");
		script.println("history.back()");
		script.println("</script>");
	}
%>
<jsp:include page="header.jsp"></jsp:include>
<div class="container">
	<div class="row">
		<form action="writeAction.jsp" method="POST">
			<table class="table table-striped">
				<tbody>
					<tr>
						<td><input type="text" class="form-control" placeholder="글 제목"
							id="bbsTitle" name="bbsTitle" maxlength="50"/>
						</td>
					</tr>
					<tr>
						<td>
							<textarea class="form-control" placeholder="글 내용"
								id="bbsContent" name="bbsContent" maxlength="2048"
								row="10" cols="10"></textarea>
						</td>
					</tr>
				</tbody>
			</table>
			<input type="submit" class="btn btn-primary pull-right" value="글쓰기"/>
		</form>
	</div>
</div>

</body>
</html>