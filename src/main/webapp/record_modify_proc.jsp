<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="caloless.vo.ExerRecVO, caloless.dao.ExerRecDao"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="vo" class="caloless.vo.ExerRecVO"></jsp:useBean>
<jsp:setProperty name="vo" property="*"/>

<%
ExerRecDao dao = new ExerRecDao();
int result = dao.update(vo);
if(result == 1) {
System.out.println("수정완료");
response.sendRedirect("RECORD_LIST.jsp");
}
%>