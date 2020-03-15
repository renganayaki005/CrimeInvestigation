<%-- 
    Document   : signOut
    Created on : Mar 14, 2020, 10:34:12 PM
    Author     : RengaNayagi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <%
            session.invalidate();
            response.sendRedirect("Home.jsp");
            
        %>
    </body>
</html>
