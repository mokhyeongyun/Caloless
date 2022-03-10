<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="caloless.vo.InfoVO, caloless.dao.InfoDao"%>
<%
int einum = Integer.parseInt(request.getParameter("einum"));
InfoDao dao = new InfoDao();
    InfoVO vo = dao.select(einum);
%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>운동정보 - 수정</title>
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
    <h2 class="page_label">Exercise Information Modify</h2>
    <form action="INFO_MODIFY_proc.jsp" autocomplete="off" method="post" name="INFO_MODIFY">
      <input type="hidden" name="einum" value="<%=einum%>">
      <ul class="info_add_panel_ul">
        <input class="info_add_headline" type="text" placeholder=" 운동 정보명" name="eikind" id="eikind" maxlength="30" value="<%=vo.getEikind()%>"></input>
        <hr class="info_line">
        <li>
          <h4 class="info_label_name">Type and intensity</h4>
          <div class="info_div">
          <input type="text" list="exer_type" name="eiinout" id="eiinout" placeholder=" 운동 환경" value="<%=vo.getEiinout()%>">
          <input type="text" list="exer_name" name="eikind" id="eikind2" placeholder=" 운동 종목" value="<%=vo.getEikind()%>">
          <input type="text" list="exer_met" name="eimet" id="eimet" placeholder=" 운동 강도" value="<%=vo.getEimet()%>">
        </div>
        </li>
        <li>
          <h4 class="info_add_label_name">Advantages</h4>
          <textarea class="info_add_textarea" name="eiadv" id="eiadv" cols="30" rows="10" ><%=vo.getEiadv() %></textarea>
        </li>
        <li>
          <h4 class="info_add_label_name">Weakness</h4>
          <textarea class="info_add_textarea" name="eiweak" id="eiweak" cols="30" rows="10" ><%= vo.getEiweak() %></textarea>
        </li>
        <li>
          <h4 class="info_add_label_name">Precautions</h4>
          <textarea class="info_add_textarea" name="eipre" id="eipre" cols="30" rows="10" ><%=vo.getEipre() %></textarea>
        </li>
      </ul>
      <div class="button_area">
        <button class="gray_button" type="button" onclick="location.href='INFO_LIST.jsp'">이전 페이지</button>
        <button class="blue_button" type="submit" value="" onclick="updateFormCheck()">수정 완료</button>
      </div>
    </form>
  </main>
  <!-- footer area -->
  <script defer src="js/caloless.js"></script>
</body>

</html>