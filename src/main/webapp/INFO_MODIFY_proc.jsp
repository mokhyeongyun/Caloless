<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="caloless.vo.InfoVO, caloless.dao.InfoDao"%>
    
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="vo" class="caloless.vo.InfoVO"></jsp:useBean>
<jsp:setProperty property="*" name="vo"/>

<%
    int einum = Integer.parseInt(request.getParameter("einum"));
InfoDao dao = new InfoDao();
    int result = dao.update(vo,einum);
    if(result==1) {
        response.sendRedirect("INFO_LIST.jsp");
    }else {
        System.out.println("실패");
    }

%>