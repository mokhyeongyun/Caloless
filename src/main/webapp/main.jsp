<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>메인 화면</title>
    <link rel="stylesheet" href="style.css" />
    <link rel="shortcut icon" href="favicon.ico" />
  </head>

  <body>
    <!-- header area -->
    <header>
      <iframe src="header_login.jsp" scrolling="no" class="iframe"></iframe>
    </header>
    <!-- main area -->
    <main class="main_panel">
      <button class="blur_button" type="button" onclick="location.href='logIn.jsp'">
        <div class="white_box">
          <h3 class="main_title">WELCOME TO</h3>
          <h1 class="main_title">CALOLESS</h1>
        </div>
      </button>
    </main>
  </body>
</html>
