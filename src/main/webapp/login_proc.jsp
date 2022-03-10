<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="caloless.vo.UserVO, caloless.dao.UserDao"%>
<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="vo" class="caloless.vo.UserVO"></jsp:useBean>
<jsp:setProperty property="*" name="vo"/>

<%
    UserDao dao = new UserDao();
    int result = dao.getLoginResult(vo);
    
    
    if(result == 1){
        session.setAttribute("userid", vo.getUserid());        
        response.sendRedirect("RECORD_LIST.jsp");
    }else{
        response.sendRedirect("logIn.jsp?login_result=fail");
    }
    
%>