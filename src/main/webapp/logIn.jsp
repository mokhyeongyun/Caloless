<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
    String login_result = request.getParameter("login_result");
    String join_result = request.getParameter("join_result");
%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>로그인 화면</title>
    <link rel="stylesheet" href="style.css" />
   <script src="js/caloless.js"></script>
    <link rel="shortcut icon" href="favicon.ico" />
    <script>
    if('<%=login_result%>' == 'fail'){
        alert("아이디 또는 패스워드가 다릅니다. 확인 후 다시 진행해주세요");
    }
    
    /* 회원가입 성공 메시지 출력 */
    if('<%=join_result%>' == 'succ'){
        alert("회원가입에 성공하셨습니다. 로그인 페이지로 이동합니다.");
    }
</script>
  </head>
  <body>
    <!-- header area -->
    <header id="header">
      <iframe src="header_login.jsp" scrolling="no" class="iframe"></iframe>
    </header>
    <!-- main area -->
    <main class="login_main_panel">
      <div class="login_panel">
        <h2 class="page_label">Log in</h2>
        <form action="login_proc.jsp" method="get" name="loginform" autocomplete="off">
          <ul class="login_panel_ul">
            <li>
              <h2 class="login_label_name">Input your ID</h2>
              <input type="text" name="userid" id="id" maxlength="30" size="40" onblur="idCheck()"/>
              <p class="sign_p" id="idMsg"></p>
            </li>
            <li>
              <h2 class="login_label_name">Input your Password</h2>
              <input type="password" name="upw" id="password" maxlength="30" size="40" onblur="pwCheck()"/>
            </li>
            <li>
              <button class="blue_button" type="button" onclick="loginNullCheck()" >로그인</button>
            </li>
          </ul>
        </form>
      </div>
    </main>
  </body>
</html>
    