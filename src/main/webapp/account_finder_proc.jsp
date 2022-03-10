<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
 import="caloless.vo.UserVO, caloless.dao.UserDao"%>
 <% request.setCharacterEncoding("utf-8"); %>
 
 <%
 String idfindname = request.getParameter("idfindname");
 String idfindemail = request.getParameter("idfindemail");
 String pwfindid = request.getParameter("pwfindid");
 String pwfindemail = request.getParameter("pwfindemail");
 
 if(idfindname.equals("") && idfindemail.equals("")){
     UserDao dao = new UserDao();
     int count = dao.pwfindcount(pwfindid, pwfindemail);
     System.out.println(count);
     if(count==0){
         %>
         <!DOCTYPE html>
	    <html>
	    <head>
	    <meta charset="UTF-8">
	    <title>Insert title here</title>
	    </head>
	    <body>
        <script>
            alert("입력하신 아이디 및 이메일과 연결된 개인정보가 없습니다.");
            location.href="ACCOUNT_FINDER.jsp";
        </script>
        
	    <%
	    }else{
	        UserVO vo = dao.pwfind(pwfindid, pwfindemail);
	        String upw = vo.getUpw();
	     %>
		    <script>
		        alert("비밀번호 : <%=upw%>");
		        location.href="ACCOUNT_FINDER.jsp";
		    </script>
		<%}
 }else if(pwfindid.equals("") && pwfindemail.equals("")){
	     UserDao dao = new UserDao();
	     int count = dao.idfindcount(idfindname, idfindemail);
	     if(count==0){
	         %>
	        <script>
	            alert("입력하신 이름 및 이메일과 연결된 개인정보가 없습니다.");
	            location.href="ACCOUNT_FINDER.jsp";
	        </script>
	        
	    <%
	    }else{
	        UserVO vo = dao.idfind(idfindname, idfindemail);
	        String userid = vo.getUserid();
	        System.out.println(userid);
	     %>
	        <script>
	            alert("아이디 : <%=userid %>");
	            location.href="ACCOUNT_FINDER.jsp";
	        </script>
	         </body>
	  </html>
	    <%}
     
 }

%>
 
 
 