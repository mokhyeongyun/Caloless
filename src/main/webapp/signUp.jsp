<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>회원가입</title>
    <link rel="stylesheet" href="style.css" />
  <script defer src="js/caloless.js"></script>
    <link rel="shortcut icon" href="favicon.ico" />
  </head>

  <body>
    <!-- header area -->
    <header id="header">
      <iframe src="header_login.jsp" scrolling="no" class="iframe"></iframe>
    </header>
    <!-- main area -->
    <main>
      <h2 class="page_label">Sign Up</h2>
      <form method="get" action="SIGN_UP_proc.jsp" name="userInfo" autocomplete="off">
        <ul class="sign_panel_ul">
          <li>
            <h2 class="sign_label_name">Name</h2>
            <input type="text" name="uname" id="name" maxlength="20" size="40" onblur="nameCheck()"/>
            <p class="sign_p" id="nameMsg"></p>
          </li>
          <li>
            <h2 class="sign_label_name">Age</h2>
            <input type="number" name="uage" id="age" maxlength="30" size="40" onblur="ageCheck()"/>
            <p class="sign_p" id="ageMsg"></p>
          </li>
          <li>
            <h2 class="sign_label_name">E-mail</h2>
            <input type="text" name="uemail" id="email" maxlength="30" size="40" onblur="emailCheck()"/>
            <p class="sign_p" id="emailMsg"></p>
          </li>
          <li>
            <h2 class="sign_label_name">ID</h2>
            <input type="text" name="userid" id="id" maxlength="30" size="40" onblur="idCheck()"/>
            <p class="sign_p" id="idMsg"></p>
          </li>
          <li>
            <h2 class="sign_label_name">Password</h2>
            <input type="password" name="upw" id="password" maxlength="30" size="40" onblur="pwCheck()"/>
            <p class="sign_p" id="pwMsg"></p>
          </li>
          <li>
            <h2 class="sign_label_name">Gender</h2>
            <input
              type="text"
              list="choice_gender"
              name="ugender"
              id="gender"
              maxlength="30"
              size="40"
              onblur="genderCheck()"
            />
            <datalist id="choice_gender">
              <option value="F">Woman (여자)</option>
              <option value="M">Man (남자)</option>
            </datalist>
            <p class="sign_p" id="genderMsg"></p>
          </li>
          <li>
            <h2 class="sign_label_name">Height</h2>
            <input type="number" name="uheight" id="height" maxlength="30" size="40" onblur="heightCheck()"/>
            <p class="sign_p" id="heightMsg"></p>
          </li>
          <li>
            <h2 class="sign_label_name">Weight</h2>
            <input type="number" name="uweight" id="weight" maxlength="30" size="40" onblur="weightCheck()"/>
            <p class="sign_p" id="weightMsg"></p>
          </li>
        </ul>
        <div class="button_area">
          <button class="blue_button" type="button" onclick="infoNullCheck()">회원가입</button>
        </div>
      </form>
    </main>
  </body>
</html>
