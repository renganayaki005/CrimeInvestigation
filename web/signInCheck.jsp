<%-- 
    Document   : signInCheck
    Created on : Mar 14, 2020, 11:29:20 PM
    Author     : RengaNayagi
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
   try{
   String Id=request.getParameter("uId");
   String pwd=request.getParameter("password");
   Class.forName("oracle.jdbc.driver.OracleDriver");     
   Connection con=(Connection)DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","renga");
   PreparedStatement pstmt=con.prepareCall("select * from signIn where Id= ?");
   pstmt.setString(1,Id );
   ResultSet rs=pstmt.executeQuery();
   if(rs.next()){
       if((rs.getString("usertype").equals("Admin"))){
           pstmt=con.prepareCall("select * from portalAdmin where Id= ?");
           pstmt.setString(1,Id );
           rs=pstmt.executeQuery();
           if(rs.next()){
      if(pwd.equals(rs.getString("password")))
      {
          //out.println("working");
          session.setAttribute("Id",Id);
          session.setAttribute("type", "Admin");
          response.sendRedirect("adminHome.jsp");
        }
      else{
           //invalid password
          response.sendRedirect("signIn.jsp");
       }
      }
          
       }
       else if(rs.getString("usertype").equals("InvestigationOfficer")){
           pstmt=con.prepareCall("select * from Officer where Id= ? ");
           pstmt.setString(1, Id);
           rs=pstmt.executeQuery();
           if(rs.next()){
           if(pwd.equals(rs.getString("password")))
      {
          session.setAttribute( "Id",Id);
          session.setAttribute("type", "InvestigationOfficer");
          response.sendRedirect("InvestigationOfficerHome.jsp");
        }
      else{
           //invalid password
            response.sendRedirect("signIn.jsp");
       }
           }   
       }
       else if(rs.getString("usertype").equals("ForensicOfficer")){
           pstmt=con.prepareCall("select * from Officer where Id= ? ");
           pstmt.setString(1, Id);      
           rs=pstmt.executeQuery();
           if(rs.next())
           {
           if(pwd.equals(rs.getString("password")))
      {
          session.setAttribute("Id",Id);
          session.setAttribute("type","ForensicOfficer" );
          response.sendRedirect("ForensicOfficerHome.jsp");
        }
      else{
           //invalid password
            response.sendRedirect("signIn.jsp");
       }
           }
           
       }
   }
   else
   {
       //no such Id exists in userlogin
       response.sendRedirect("signIn.jsp");
   }
   }catch(Exception e)
   {
       System.out.println(e);
   }       
%>