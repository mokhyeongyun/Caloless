<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="caloless.dao.NoticeDao, caloless.vo.NoticeVO, java.util.ArrayList"%>
    
<%
NoticeDao dao = new NoticeDao();
ArrayList<NoticeVO> list = dao.select();
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
  <title>공지사항 리스트</title>
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
    <h2 class="page_label">Notice List</h2>
    <form class="notice_list_form" action="" autocomplete="off">
      <ul class="notice_list_panel_ul">
        <hr class="info_line">
        <li>
          <p class="notice_no_p">No</p>
          <p class="notice_title_p">Title</p>
          <p class="notice_date_p">Date</p>
        </li>
        <% for(NoticeVO vo : list){ %>
        <li>
          <p class="notice_no_p"><%= vo.getNnum() %></p>
          <p class="notice_title_p"><a href="NOTICE_DETAIL_OPER.jsp?nnum=<%= vo.getNnum() %>"><%= vo.getNtitle() %></a></p>
          <p class="notice_date_p"><%= vo.getNdate() %></p>
        </li>
        <% } %>
      </ul>
      <div class="button_area">
        <a href=""><button class="empty_button" type="button">이전 페이지</button></a>
        <% if(userid!=null && userid.equals("admin")) { %>
        <a href="NOTICE_REGIST_OPER.jsp"><button class="blue_button" type="button">등록하기</button></a>
        <% } %>
      </div>
      
    </form>
    
    
  </main>
  <!-- footer area -->
</body>


</html>