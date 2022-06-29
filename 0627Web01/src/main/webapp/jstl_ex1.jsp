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
	<c:forEach var="k" begin="1" end="10" step="1">
	<c:out value="Hello"/>
	<%-- <c:out value="${k%2==0}"/> --%>
	</c:forEach>
	
	<br>
	
	<c:set var="num" value="30"/>
	<!-- 조건문 -->
	<c:if test="${num > 50}">
    <c:out value ="50보다 큼" />
    </c:if>
    <c:if test="${num <= 50}">
    <c:out value ="50보다 작거나 같음" />
    </c:if>
    <br>
    <%
    	int num2 = 100;
    	if(num2>50)
    		out.println("50이상");
    	else
    		out.println("50미만");
    %>
    <br>
    <form>
<!--     미구현 버튼
    <input name="numUser" type="text">
    <button type="submit">결과 확인</button>
    버튼으로 입력 받고 하고 싶음 -->
    
    <br>
    <%
    	// 자바 영역에 있는 배열에 특정한 숫자가 있으면 있다고 화면에 표시 없으면 없다고 표시 (no jstl)
    	int[] numArr = {1,5,8};
    	int user  = 1;
    	// int a = Integer.parseInt(request.getParameter("numUser"));
    	//out.println(a);
    	%>
    

   	<%
    	for(int i=0;i<numArr.length; i++){
    		if(numArr[i]==user){
    			out.println("존재 /");

    		}else{
    			out.println("존재 안함 /");
    		}
    	}
   	%>
   	</form>
   	<br><br>
   	
   
   	
   	<!-- JSTL to JSP -->
   	<c:set var="target" value="해피데이"/>
   	<% String target2 = (String) pageContext.getAttribute("target"); %>
   	<%= target2 %>
   	<br>
   	<!-- JSP to JSTL -->
   	<% String target3 = "비온 뒤 맑음";
   		pageContext.setAttribute("target4", target3);%>
   	<c:out value="${target4}"/>
   	
   	
   	<br>
   	<!-- jstl 버전 -->
 	<c:set var="numArr" value="{1,6,9}"/>
   	<br>
	<c:forEach var="item" items="${numArr}">
   	<c:if test="${item==target}">
   		<c:out value = "일치2"/>
   	</c:if>
   	<c:if test="${item!=target}">
   		<c:out value = "불일치2"/>
   	</c:if>
   	</c:forEach>
</body>
</html>