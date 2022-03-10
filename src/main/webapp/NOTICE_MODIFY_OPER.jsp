<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="caloless.dao.NoticeDao, caloless.vo.NoticeVO"%>

<%
int nnum=Integer.parseInt(request.getParameter("nnum"));
NoticeDao dao = new NoticeDao();
NoticeVO vo = dao.select(nnum);
%>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>공지사항 수정</title>
  <link rel="stylesheet" href="style.css">
  <link rel="shortcut icon" href="favicon.ico">
  <script defer src="js/caloless.js"></script>
</head>

<body>
  <!-- header area -->
  <header id="header">
    <iframe src="header_logout.jsp" scrolling="no" class="iframe"></iframe>
  </header>
  <!-- main area -->
  <main>
    <h2 class="page_label">Notice Modify</h2>
    <form class="notice_form" action="NOTICE_MODIFY_OPER_proc.jsp" method="get" autocomplete="off" name="notice_form">
    <input type="hidden" name="nnum" value=<%= nnum %>>
      <ul class="notice_panel_ul">
        <li>
          <h4 class="notice_label_name">Title</h4>
          <input class="" type="text" maxlength="50" size="100%" name="ntitle" id="ntitle" value='<%= vo.getNtitle() %>'>
        </li>
        <li>
          <h4 class="notice_label_name">Text</h4>
          <textarea class="notice_update_textarea" maxlength="500" name="ncontent" id="ncontent"><%= vo.getNcontent() %></textarea>
        </li>
      </ul>
      <div class="button_area">
        <button class="red_button" type="reset">다시쓰기</button>
        <button class="blue_button" type="button" onclick="updateCheck()">수정완료</button>
      </div>
    </form>
  </main>
  <!-- footer area -->
</body>

</html>