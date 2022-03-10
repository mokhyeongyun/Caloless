<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String userid = (String)session.getAttribute("userid");
	if(userid != null){
		session.invalidate();
	}
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script>
		alert("로그아웃 완료되었습니다. 메인으로 이동합니다.");
		location.href="logIn.jsp";
	</script>
</body>
</html>