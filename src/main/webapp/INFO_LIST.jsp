<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="caloless.vo.InfoVO, caloless.dao.InfoDao, java.util.ArrayList"%>
<%
InfoDao dao = new InfoDao();
    ArrayList<InfoVO> list = dao.select();
%>

<%
String userid = (String)session.getAttribute("userid");
%>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>운동정보 리스트</title>
  <link rel="stylesheet" href="style.css">
  <link rel="shortcut icon" href="favicon.ico">
</head>

<body>
  <!-- header area -->
  <header id="header">
    <iframe src="header_logout.jsp" scrolling="no" class="iframe"></iframe>
  </header>
  <!-- main area -->
  <main>
    <h2 class="page_label">Exercise Information List</h2>
    <form class="notice_list_form" action="" autocomplete="off">
      <ul class="notice_list_panel_ul">
        <hr class="info_line">
        <li>
          <p class="notice_no_p">번호</p>
          <p class="notice_title_p">운동명</p>
          <p class="notice_date_p">운동환경</p>
        </li>
        <%
        for(InfoVO vo : list) {
        %>
        <li>
          <p class="notice_no_p"><%=vo.getEinum() %></p>
          <p class="notice_title_p"><a href="INFO_DETAIL_OPER.jsp?einum=<%=vo.getEinum()%>"><%=vo.getEikind() %></a></p>
          <p class="notice_date_p"><%=vo.getEiinout() %></p>
        </li>
        <% } %>
      </ul>
      <div class="button_area">
        <button class="empty_button" type="button"></button>
        <% if(userid!=null && userid.equals("admin")) { %>
        <button class="blue_button" type="button" onclick="location.href='INFO_REGIST.jsp'">등록하기</button>
        <% } %>
      </div>
    </form>
  </main>
  <!-- footer area -->
  <script defer src="js/caloless.js"></script>
</body>

</html>