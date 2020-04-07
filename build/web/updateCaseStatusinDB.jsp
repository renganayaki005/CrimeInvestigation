<%-- 
    Document   : updateCaseStatusinDB
    Created on : Mar 29, 2020, 9:21:13 PM
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
         <%@page import="java.sql.*"%>
         <%
           String caseId=request.getParameter("caseId");
           String status=request.getParameter("status");
           String Id=(String)session.getAttribute("Id");
           String History="Updated case status as"+status;
           Class.forName("oracle.jdbc.driver.OracleDriver");  
           Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","renga"); 
           PreparedStatement pstmt=con.prepareCall("select * from case where caseId= ?");
            pstmt.setString(1, caseId );
            ResultSet rs=pstmt.executeQuery();
            if(rs.next()){
           
                    pstmt=con.prepareStatement("update case set status=? where caseId=? ");  
                    pstmt.setString(1,status);
                    pstmt.setString(2,caseId);
                    pstmt.executeUpdate();
           }
           pstmt= con.prepareStatement("insert into caseHistory(caseId, History, updatedDate, Id)values(?,?,SYSDATE,?)");
           pstmt.setString(1,caseId);
           pstmt.setString(2, History);
           pstmt.setString(3, Id);
           pstmt.executeUpdate();
            con.close();
           %><script>alert("<%out.print("Updated case status!");%>");</script><%  
             RequestDispatcher rd=request.getRequestDispatcher("updateCaseStatus.jsp");  
             rd.include(request, response);
            %>   
    </body>
</html>
