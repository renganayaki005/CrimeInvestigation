<%-- 
    Document   : IdCheck
    Created on : Mar 14, 2020, 9:47:14 PM
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
   Class.forName("oracle.jdbc.driver.OracleDriver"); 
   Connection con=(Connection)DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","renga");
   PreparedStatement pstmt=con.prepareCall("select * from signIn where Id= ?");
   pstmt.setString(1, request.getParameter("uId"));
   ResultSet rs=pstmt.executeQuery();
   if(rs.next()){
      out.println("");
      }
   else{
      out.println("Please provide a valid Id");
   }
   }catch(Exception e)
   {
       System.out.println(e);
   }
%>
