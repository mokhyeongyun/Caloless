<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import="caloless.vo.UserVO, caloless.dao.UserDao"%>
    <%
    String userid = (String)session.getAttribute("userid");
%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>header logout</title>
  <link rel="stylesheet" href="style.css">
  <link rel="shortcut icon" href="favicon.ico">
</head>

<body>
  <header>
    <h2 class="header_title" ><a href="RECORD_LIST.jsp"  target="_parent">Caloless</a></h2>
    <nav class="header_nav">
      <ul class="header_nav_menu">
        <li><a href="NOTICE_LIST.jsp" target="_parent">Notice</a></li>
        <li><a href="My_Page.jsp" target="_parent">My page</a></li>
        <li><a href="INFO_LIST.jsp" target="_parent">exercise information</a></li>
        <li><a href="logout.jsp" target="_parent">Log out</a></li>
      </ul>
    </nav>
  </header>
</body>

</html>