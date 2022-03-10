<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="caloless.vo.UserVO, caloless.dao.UserDao"%>
    <% request.setCharacterEncoding("utf-8"); %>
    <jsp:useBean id="vo" class="caloless.vo.UserVO"></jsp:useBean>
    <jsp:setProperty name="vo" property="*"/>
    <%
    String userid = (String)session.getAttribute("userid");
    %>
    
    <%
    UserDao dao = new UserDao();
    int result = dao.update(vo, userid);
    if(result == 1) {
    response.sendRedirect("RECORD_LIST.jsp");
    }
    %>
