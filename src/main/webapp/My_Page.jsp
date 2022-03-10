<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="caloless.vo.UserVO, caloless.dao.UserDao"%>
<%
String userid = (String)session.getAttribute("userid");
UserDao dao = new UserDao();
UserVO vo = dao.select(userid);
if(userid != null){
%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>마이 페이지</title>
  <script defer src="js/caloless.js"></script>
    <link rel="stylesheet" href="style.css" />
    <link rel="shortcut icon" href="favicon.ico" />
  </head>

  <body>
    <!-- header area -->
    <header id="header">
      <iframe src="header_logout.jsp" scrolling="no" class="iframe"></iframe>
    </header>
    <!-- main area -->
    <main class="main_sign_panel">
      <h2 class="page_label">My Page</h2>
      <form class="sign_form" name="mypageform"action="mypage_update_proc.jsp" autocomplete="off">
        <ul class="sign_panel_ul">
          <li>
            <h2 class="sign_label_name">Name</h2>
            <input
              style="border: none"
              type="text"
              name="uname"
              id="uname"
              maxlength="30"
              size="40"
              value=<%=vo.getUname() %>
              readonly
            />
          </li>
          <li>
            <h2 class="sign_label_name">Age</h2>
            <input type="text" name="uage" id="uage" maxlength="30" size="40" value=<%=vo.getUage() %> />
            <p class="sign_p"></p>
          </li>
          <li>
            <h2 class="sign_label_name">E-mail</h2>
            <input type="text" name="uemail" id="uemail" maxlength="30" size="40" value=<%=vo.getUemail()%>  />
            <p class="sign_p"></p>
          </li>
          <li>
            <h2 class="sign_label_name">ID</h2>
            <input
              style="border: none"
              type="text"
              name="userid"
              id="userid"
              maxlength="30"
              size="40"
              value=<%=vo.getUserid()%>
              readonly
            />
            <p class="sign_p"></p>
          </li>
          <li>
            <h2 class="sign_label_name">Password</h2>
            <input type="text" name="upw" id="upw" maxlength="30" size="40" value=<%=vo.getUpw()%> />
            <p class="sign_p"></p>
          </li>
          <li>
            <h2 class="sign_label_name">Gender</h2>
            <input
              type="text"
              list="gender"
              name="ugender"
              id="ugender"
              maxlength="30"
              size="40"
              value=<%=vo.getUgender()%>
            />
            <datalist id="gender">
              <option value="F">Woman (여자)</option>
              <option value="M">Man (남자)</option>
            </datalist>
            <p class="sign_p"></p>
          </li>
          <li>
            <h2 class="sign_label_name">Height</h2>
            <input type="text" name="uheight" id="uheight" maxlength="30" size="40" value=<%=vo.getUheight()%> />
            <p class="sign_p"></p>
          </li>
          <li>
            <h2 class="sign_label_name">Weight</h2>
            <input type="text" name="uweight" id="uweight" maxlength="30" size="40" value=<%=vo.getUweight()%> />
            <p class="sign_p"></p>
          </li>
        </ul>
        <div class="button_area">
          <button class="gray_button" type="button">이전 페이지</button>
          <button class="blue_button" type="button" onclick="mypageUdateCheck()">수정 완료</button>
        </div>
        <div class="button_area">
          <a href="user_delete_proc.jsp"><button class="red_button" type="button" onclick="">회원 탈퇴</button></a>
        </div>
      </form>
    </main>
  </body>
</html>
<%}else{ %>
    <script>
        alert("로그인이 필요한 페이지 입니다. 확인 후 진행해 주세요.");
        location.href="logIn.jsp"
    </script>
<%} %>
