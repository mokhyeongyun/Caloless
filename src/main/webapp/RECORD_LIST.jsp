<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
 import="caloless.vo.UserVO, caloless.dao.UserDao,caloless.vo.ExerRecVO, caloless.dao.ExerRecDao, java.util.ArrayList"%>
 
 <%
 
 String userid = (String)session.getAttribute("userid");
 ExerRecDao dao = new ExerRecDao();
 ArrayList<ExerRecVO> list = dao.select(userid);
 
 UserDao urdao = new UserDao();
 UserVO urvo = urdao.select(userid);
 %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>운동 기록지 - 리스트</title>
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
  <main class="main_list_panel">
      <h2 class="page_label">Workout Record List</h2>
        <ul class="record_list_panel_ul">
           <%for(ExerRecVO vo : list){
               int hour,minute,second;
               double kcal;
               kcal=vo.getEimet()*3.5*urvo.getUweight()*0.005*(vo.getErtime()/60);
               hour= vo.getErtime()/(60*60);
               minute= vo.getErtime()/60-(hour*60);
               second= vo.getErtime()%60;
           %>
          <h2 class="record_list_date_name"><%=vo.getEryear() %> . <%=vo.getErmonth() %> . <%=vo.getErday() %></h2><span>:          <%= vo.getErdate()%></span>
          <a href="RECORD_MODIFY.jsp?userid=<%=userid%>&erdate=<%=vo.getErdate()%>" style="text-decoration:none; color:black;">
          <li>
            <p><%= vo.getInout()%> - <%=vo.getKind() %></p>
            <p><%= hour %>시간 <%=minute%>분 <%=second %>초</p>
            <p><%= Math.round(kcal*10)/10.0%> kcal</p>
          </li>
          </a>
          <% } %>
        </ul>
        <div class="button_area">
          <button class="empty_button" type="button"></button>
          <button class="blue_button" type="button" onClick="location.href='RECORD_REGIST.jsp'">등록하기</button>
        </div>
  </main>
</body>

</html>