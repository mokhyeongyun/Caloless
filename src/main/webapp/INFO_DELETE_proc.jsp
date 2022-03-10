<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="caloless.vo.InfoVO, caloless.dao.InfoDao"%>

<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="vo" class="caloless.vo.InfoVO"></jsp:useBean>
<jsp:setProperty property="*" name="vo"/>

<%
    int einum = Integer.parseInt(request.getParameter("einum"));
    InfoDao dao = new InfoDao();
    int result = dao.delete(einum);

    if(result ==1){%>
        <!DOCTYPE html>
        <html>
        <head>
        <meta charset="UTF-8">
        <title>Insert title here</title>
        </head>
        <body>
            <script>
                alert("기록이 삭제되었습니다. 리스트로 이동합니다.");
                location.href="INFO_LIST.jsp";
            </script>
        </body>
        </html>
    <%
        //response.sendRedirect("INFO_LIST.jsp");
    }else {
        System.out.println("실패");
    }
    %>
