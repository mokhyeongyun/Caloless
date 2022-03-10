<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="caloless.dao.NoticeDao, caloless.vo.NoticeVO"%>
    <% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="vo" class="caloless.vo.NoticeVO"></jsp:useBean>
<jsp:setProperty name="vo" property="*"/>

<%
int nnum = Integer.parseInt(request.getParameter("nnum"));

NoticeDao dao = new NoticeDao();
int result=dao.update(vo, nnum);
if(result==1){
    response.sendRedirect("NOTICE_LIST.jsp");
}else{
    response.sendRedirect("NOTICE_LIST.jsp");
}
%>
