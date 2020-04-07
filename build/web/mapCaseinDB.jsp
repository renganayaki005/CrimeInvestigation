<%-- 
    Document   : mapcaseinDB
    Created on : Mar 22, 2020, 3:48:15 PM
    Author     : RengaNayagi
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <%
          String caseId=request.getParameter("caseId");
          String officerId=request.getParameter("officerId");
          Class.forName("oracle.jdbc.driver.OracleDriver");  
           Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","renga");  
           PreparedStatement pstmt=con.prepareStatement("insert into caseMapping(caseId, officerId)values(?,?)");  
           pstmt.setString(1,caseId);
           pstmt.setString(2,officerId);
           pstmt.executeUpdate();
           pstmt=con.prepareCall("select * from case where caseId= ?");
            pstmt.setString(1, caseId );
           ResultSet rs=pstmt.executeQuery();
            if(rs.next()){
           
                    pstmt=con.prepareStatement("update case set status=? where caseId=? ");  
                    pstmt.setString(1,"Assigned");
                    pstmt.setString(2,caseId);
                    pstmt.executeUpdate();
           }
            con.close();

          %><script>alert("<%out.print("Case Mapped!"+caseId);%>");</script><%  
           RequestDispatcher rd=request.getRequestDispatcher("adminHome.jsp");  
           rd.include(request, response);     
         %>
    </body>
</html>
