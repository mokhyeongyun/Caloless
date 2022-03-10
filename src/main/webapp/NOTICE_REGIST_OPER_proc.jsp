<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="caloless.dao.NoticeDao, caloless.vo.NoticeVO"
    %>
    
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="vo" class="caloless.vo.NoticeVO"></jsp:useBean>
<jsp:setProperty name="vo" property="*"/>


<%
    //System.out.println("ntitle--> "+vo.getNtitle());
    //System.out.println("ncontent--> "+vo.getNcontent());
    //폼에서 넘어오는 데이터를 액션태그를 이용해서 vo객체에 저장시키고, 그 vo 객체를 서버 콘솔에서 출력한 코드
    
    
    NoticeDao dao = new NoticeDao();
    int result = dao.insert(vo);
    if(result==1){
        response.sendRedirect("NOTICE_LIST.jsp");
    }
    
%>  