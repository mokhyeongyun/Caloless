<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="caloless.dao.NoticeDao"
%>

<%
int nnum = Integer.parseInt(request.getParameter("nnum"));
System.out.println("nnum--> "+nnum);
NoticeDao dao = new NoticeDao();
int result=dao.delete(nnum);

if(result==1){ %>
    <!DOCTYPE html>
    <html>
    <head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    </head>
    <body>
        <script>
            alert("삭제되었습니다. 리스트로 이동합니다.");
            location.href="NOTICE_LIST.jsp";
        </script>
    </body>
    </html>
    <%
}else{
    response.sendRedirect("NOTICE_LIST.jsp");
}
%>