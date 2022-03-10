<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="caloless.vo.ExerRecVO, caloless.dao.ExerRecDao"%>
<%
String userid = request.getParameter("userid");
String erdate = request.getParameter("erdate");

ExerRecDao dao = new ExerRecDao();
int result = dao.delete(userid, erdate);

if(result ==1){%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <script>
        alert("기록이 삭제되었습니다. 리스트로 이동합니다.");
        location.href="RECORD_LIST.jsp";
    </script>
</body>
</html>
<%
}
%>



