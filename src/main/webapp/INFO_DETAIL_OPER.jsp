<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="caloless.vo.InfoVO, caloless.dao.InfoDao"%>
<%
int einum = Integer.parseInt(request.getParameter("einum"));
InfoDao dao = new InfoDao();
    InfoVO vo = dao.select(einum);
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
  <title>운동정보상세 - 관리자</title>
  <link rel="stylesheet" href="style.css">
  <link rel="shortcut icon" href="favicon.ico">
</head>

<body>
  <!-- header area -->
  <header id="header">
    <iframe src="header_logout.jsp" scrolling="no" class="iframe"></iframe>
  </header>
  <!-- main area -->
  <main >
    <h2 class="page_label">Information</h2>
    <form action="INFO_MODIFY.jsp" autocomplete="off" method="post" name="INFO_MODIFY">
    <input type="hidden" name="einum" value="<%=einum%>">
      <ul class="info_panel_ul">
        <h4 class="info_headline" name="eikind" value="<%=vo.getEikind()%>"><%=vo.getEikind() %></h4>
        <hr class="info_line">
        <li>
          <h4 class="info_label_name">Type and intensity</h4>
          <p name="eiinout"><%=vo.getEiinout() %></p>
          <p><%=vo.getEikind() %></p>
          <p class="info_p" name="eimet"><%=vo.getEimet() %></p>
        </li>
        <li>
          <h4 class="info_label_name">Advantages</h4>
          <!-- <p class="info_final_p">실내 / 실외 운동</p> -->
          <textarea class="info_textarea" name="eiadv" id="eiadv" cols="30" rows="10" readonly><%=vo.getEiadv() %></textarea>
        </li>
        <li>
          <h4 class="info_label_name">Weakness</h4>
          <textarea class="info_textarea" name="eiweak" id="eiweak" cols="30" rows="10" readonly><%=vo.getEiweak() %></textarea>
        </li>
        <li>
          <h4 class="info_label_name">Precautions</h4>
          <textarea class="info_textarea" name="eipre" id="eipre" cols="30" rows="10" readonly><%=vo.getEipre() %></textarea>
        </li>
      </ul>
      <div class="button_area">
        <button class="gray_button" type="button" onclick="location.href='INFO_LIST.jsp'">이전 페이지</button>
         <% if(userid!=null && userid.equals("admin")) { %>
        <button class="blue_button" type="submit">수정하기</button>
         <% } %>
      </div>
      <% if(userid!=null && userid.equals("admin")) { %>
      <div class="button_area">
        <a href="INFO_DELETE_proc.jsp?einum=<%=einum%>"><button class="red_button" type="button">삭제하기</button></a>
      </div>
      <% } %>
    </form>
  </main>
  <!-- footer area -->
  <script defer src="js/caloless.js"></script>
</body>

</html>