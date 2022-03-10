<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="caloless.dao.NoticeDao, caloless.vo.NoticeVO"%>
    
<%
int nnum=Integer.parseInt(request.getParameter("nnum"));
NoticeDao dao = new NoticeDao();
NoticeVO vo = dao.select(nnum);
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
  <title>공지사항</title>
  <link rel="stylesheet" href="style.css">
  <link rel="shortcut icon" href="favicon.ico">
  <script src="js/caloless.js"></script>
  <script> 
  function submit2(form) { 
    form.action="NOTICE_DELETE_proc.jsp"; 
    form.submit(); 
    return true; 
  } 
</script> 
  
</head>

<body>
  <!-- header area -->
  <header id="header">
    <iframe src="header_logout.jsp" scrolling="no" class="iframe"></iframe>
  </header>
  <!-- main area -->
  <main>
    <h2 class="page_label">Notice</h2>
    <form class="notice_form" action="NOTICE_MODIFY_OPER.jsp" autocomplete="off" method="get" name="notice_form">
    <input type="hidden" name="nnum" value=<%= vo.getNnum() %>>      
      <ul class="notice_detail_panel_ul">
        <li>
          <div class="notice_title_panel">
            <h4 class="notice_title_name" name="ntitle" value=<%= vo.getNtitle() %>><%= vo.getNtitle() %></h4>
          </div>
        </li>
        <li>
          <div class="notice_textarea_panel">
            <p class="notice_textarea" name="ncontent" value=<%= vo.getNcontent() %>><%= vo.getNcontent() %></p>
          </div>
        </li>
      </ul>
      <div class="button_area">
        <button class="gray_button" type="button" onclick="location.href='NOTICE_LIST.jsp'">이전 페이지</button>
        <% if(userid!=null && userid.equals("admin")) { %>
        <button class="blue_button" type="submit">수정하기</button>
        <% } %>
      </div>
      <% if(userid!=null && userid.equals("admin")) { %>
      <div class="button_area">
        <button class="red_button" type="button" onclick="submit2(this.form)">삭제하기</button>
      </div>
      <% } %>
    </form>
  </main>
  <!-- footer area -->
</body>

</html>