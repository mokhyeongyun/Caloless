<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>공지사항 등록</title>
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
    <h2 class="page_label">Notice Registration</h2>
    <form class="notice_form" name="notice_form" action="NOTICE_REGIST_OPER_proc.jsp" method="get" autocomplete="off">
      <ul class="notice_panel_ul">
        <li>
          <h4 class="notice_label_name">Title</h4>
          <input class="notice_update_title" type="text" maxlength="50" size="100%" id="ntitle" name="ntitle">
        </li>
        <li>
          <h4 class="notice_label_name">Text</h4>
          <textarea class="notice_update_textarea" maxlength="500" id="ncontent" name="ncontent"></textarea>
        </li>
      </ul>
      <div class="button_area">
        <button class="gray_button" type="button"><a href="NOTICE_LIST.jsp">이전 페이지</a></button>
        <button class="blue_button" type="button" onclick="registCheck()">등록완료</button>
      </div>
    </form>
  </main>
  <!-- footer area -->
</body>

</html>