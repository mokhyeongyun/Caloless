<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
 import="caloless.vo.UserVO, caloless.dao.UserDao"%>
 
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>ID / PW 찾기</title>
  <link rel="stylesheet" href="style.css">
  <script defer src="js/caloless.js"></script>
  <link rel="shortcut icon" href="favicon.ico">
</head>

<body>
  <!-- header area -->
  <header id="header">
    <iframe src="header_login.jsp" scrolling="no" class="iframe"></iframe>
  </header>
  <!-- 메인 부분 -->
  <main>
    <h2 class="page_label">Find your Info</h2>
    <form action="account_finder_proc.jsp" name="findform"autocomplete="off">
      <div class="find_info_panel">
        <ul class="find_info_panel_ul">
          <li>
            <button type="button" class="find_info_button_id" onclick="findIdCheck()">FIND ID</button>
          </li>
          <li>
            <h2 class="find_info_label_name">Enter the Name</h2>
            <input type="text" name="idfindname" id="idfindname" maxlength="30" size="40">
          </li>
          <li>
            <h2 class="find_info_label_name">Enter the E-mail</h2>
            <input type="text" name="idfindemail" id="idfindemail" maxlength="30" size="40">
          </li>
        </ul>
      </div>
      <div class="find_info_panel">
        <ul class="find_info_panel_ul">
          <li>
            <button type="button" class="find_info_button_pw"onclick="findPwCheck()">FNID Password</button>
          </li>
          <li>
            <h2 class="find_info_label_name">Enter the ID</h2>
            <input type="text" name="pwfindid" id="pwfindid" maxlength="30" size="40">
          </li>
          <li>
            <h2 class="find_info_label_name">Enter the E-mail</h2>
            <input type="text" name="pwfindemail" id="pwfindemail" maxlength="30" size="40">
          </li>
        </ul>
      </div>
    </form>
  </main>
</body>

</html>