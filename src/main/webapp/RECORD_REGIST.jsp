<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
 import="caloless.vo.UserVO, caloless.dao.UserDao,caloless.vo.ExerRecVO, caloless.dao.ExerRecDao,caloless.vo.ExerInfoVO, caloless.dao.ExerInfoDao, java.util.ArrayList"%>
 <%
 String userid = (String)session.getAttribute("userid");
 System.out.println(userid);
 
 UserDao urdao = new UserDao();
 UserVO urvo = urdao.select(userid);
 
 System.out.println(urvo.getUweight());
 
 ExerInfoDao dao = new ExerInfoDao();
 ArrayList<ExerInfoVO> list = dao.select();
 %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>운동 기록지 - 등록</title>
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
      <h2 class="page_label">Workout Record Registration</h2>
      
      <form class="record_form" name="record_form" action="record_regist_proc.jsp" method="get">
       <input type="hidden" name="userid" value=<%=userid %>>
        <ul class="record_add_panel_ul">
          <h2 class="record_add_name">DATE</h2>
          <li>
            <input type="number" id="year" name="eryear" placeholder=" Year" onblur="erdateFormCheck()" maxlength="4" oninput="numberMaxLength(this)">
            <input type="number" id="month" name="ermonth" placeholder=" Month" onblur="erdateFormCheck()" maxlength="2" oninput="numberMaxLength(this)">
            <input type="number" id="day" name="erday" placeholder=" Day" onblur="erdateFormCheck()" maxlength="2" oninput="numberMaxLength(this)">
          </li>
          <h2 class="record_add_name">TYPE & INTENSITY</h2>
          <li>
            <select class="side" name="inout" id="inout" onchange="selectClick()">
              <option value="none">Type</option>
              <option value="inside">실내 운동</option>
              <option value="outside">실외 운동</option>
            </select>
            <select class="kind" name="einum" id="kind">
              <option value="none">Intensidy</option>
               <%for(ExerInfoVO vo : list){%>
                      <option name=<%=vo.getEiinout() %> style="display:none"  value=<%=vo.getEinum() %>><%=vo.getEikind() %></option> 
              <%} %>
            </select>
          </li>
          <h2 class="record_add_name">Working out Time</h2>
          <li>
            <input type="number" id="hour" name="hour" value="0" maxlength="2" oninput="numberMaxLength(this)" onblur="erdateFormCheck()">
            <input type="number" id="minute" name="minute" value="0" maxlength="2" oninput="numberMaxLength(this)" onblur="erdateFormCheck()">    
            <input type="number" id="second" name="second" value="0" maxlength="2" oninput="numberMaxLength(this)" onblur="erdateFormCheck()">
          </li> 
          <h2 class="record_add_name">Weight</h2>
          <li>
            <p name="weight" value=<%=urvo.getUweight() %>><%=urvo.getUweight() %>kg</p>
          </li>
        </ul>
        <div class="button_area">
          <button class="gray_button" type="button" onclick="location.href='RECORD_LIST.jsp'">이전 페이지</button>
          <button class="blue_button" type="button" onclick="erinsertFormCheck()">등록하기</button>
        </div>
      </form>
  </main>
</body>
</html>