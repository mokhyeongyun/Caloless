<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
 import="caloless.vo.UserVO, caloless.dao.UserDao,caloless.vo.ExerInfoVO, caloless.dao.ExerInfoDao,caloless.vo.ExerRecVO, caloless.dao.ExerRecDao, java.util.ArrayList"%>
 <%
 //String userid = (String)session.getAttribute("userid");
 String erdate = request.getParameter("erdate");
 String userid = request.getParameter("userid");
 
 ExerRecDao erdao= new ExerRecDao();
 ExerRecVO ervo = erdao.select(userid, erdate);
 
 UserDao urdao = new UserDao();
 UserVO urvo = urdao.select(userid);
 
 ExerInfoDao dao = new ExerInfoDao();
 ArrayList<ExerInfoVO> list = dao.select();
 
 %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>운동 기록지 - 수정</title>
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
  <main class="main_record_panel">
      <h2 class="page_label">Workout Record</h2>
      <form class="record_form" name="record_form" action="record_modify_proc.jsp" method="get">
      <input type="hidden" name="userid" value="<%=userid %>">
      <input type="hidden" name="erdate" value="<%=erdate %>">
        <ul class="record_add_panel_ul">
          <h2 class="record_add_name">DATE</h2>
           <li>
            <input type="number" name="year" value=<%=ervo.getEryear() %>  readonly >
            <input type="number" name="month" value=<%=ervo.getErmonth() %> readonly >
            <input type="number" name="day" value=<%=ervo.getErday() %> readonly >
          </li>
          <h2 class="record_add_name">TYPE & INTENSITY</h2>
          <li>
            <select class="side" name="inout" id="inout" onchange="selectClick()">
              <option value="none">Type</option>
              <option value="inside" <%if(ervo.getInout().equals("실내운동")){%>selected<%} %>>실내 운동</option>
              <option value="outside" <%if(ervo.getInout().equals("실외운동")){%>selected<%} %>>실외 운동</option>
            </select>
            <select class="kind" name="einum" id="kind">
              <option value="none">Intensidy</option>
              <option value=<%=ervo.getEinum() %> selected><%=ervo.getKind() %></option>
               <%for(ExerInfoVO vo : list){%>
                      <option name=<%=vo.getEiinout() %> style="display:none"  value=<%=vo.getEinum() %>><%=vo.getEikind() %></option> 
              <%} %>
            </select>
          </li>
          <h2 class="record_add_name">Working out Time</h2>
          <li>
          <% int hour,minute,second;
               hour= ervo.getErtime()/(60*60);
               minute= ervo.getErtime()/60-(hour*60);
               second= ervo.getErtime()%60;
           %>
              <input type="number" id="hour" name="hour" value=<%=hour %> maxlength="2" oninput="numberMaxLength(this)" onblur="erupdatetimeFormCheck()">
              <input type="number" id="minute" name="minute" value=<%=minute %> maxlength="2" oninput="numberMaxLength(this)"  onblur="erupdatetimeFormCheck()">    
              <input type="number" id="second" name="second" value=<%=second %> maxlength="2" oninput="numberMaxLength(this)"  onblur="erupdatetimeFormCheck()">
          </li>
          <h2 class="record_add_name">Weight</h2>
          <li>
            <p name="weight" value=<%=urvo.getUweight() %>><%=urvo.getUweight() %></p>
          </li>
        </ul>
         <div class="button_area">
           <button class="gray_button" type="button" onclick="location.href='RECORD_LIST.jsp'">이전 페이지</button>
          <button class="blue_button" type="button" onclick="erupdateFormCheck()">수정완료</button>
          </div>
          <div class="button_area">
          <a href="record_delete_proc.jsp?userid=<%=userid%>&erdate=<%=erdate%>"><button class="red_button" type="button">삭제하기</button></a>
          </div>
      </form>
  </main>
</body>

</html>