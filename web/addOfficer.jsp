<%-- 
    Document   : addOfficer
    Created on : Mar 15, 2020, 9:10:16 PM
    Author     : RengaNayagi
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page import="utilities.generatePassword"%>
<%@page import="java.util.Random"%>
<%@page import="java.security.SecureRandom"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Officer</title>
        <script src="validation.js"></script>
        <script>
         window.onload = function(){
            document.getElementById("officerIdValue").value = "OFR"+Math.floor((Math.random() * 10000) + 100);
        };  
        </script>
        <style>
    .btn {
  width: auto;
  padding: 10px 18px;
  background-color: black;
  color: white;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  opacity: 0.9; 
  -webkit-transition: width 2s; 
  transition: width 2s;
}
button {
  background-color: #4CAF50;
  color: white;
  padding: 10px 18px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: auto;
  opacity: 0.9; 
  -webkit-transition: width 2s; 
  transition: width 2s;
}
.btn:hover {
  width: 70px;
  height: 50px;

}
  .navbar {
  overflow: hidden;
  background-color: #333;
}

.navbar a {
  float: left;
  font-size: 16px;
  color: white;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
}

.dropdown {
  float: left;
  overflow: hidden;
}
.signout{
    float: right;
}

.dropdown .dropbtn {
  font-size: 16px;  
  border: none;
  outline: none;
  color: white;
  padding: 14px 16px;
  background-color: inherit;
  font-family: inherit;
  margin: 0;
}

.navbar a:hover, .dropdown:hover .dropbtn {
  background-color: #111;
}

.dropdown-content {
  display: none;
  position: absolute;
  background-color: #f9f9f9;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}

.dropdown-content a {
  float: none;
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
  text-align: left;
}

.dropdown-content a:hover {
  background-color: #ddd;
}

.dropdown:hover .dropdown-content {
  display: block;
}
 </style>
 <link rel="stylesheet" type="text/css" href="NavigationBar.css">
 <link rel="stylesheet" type="text/css" href="Form.css">
    </head>
    <body>
        <div class="navbar">
  <a href="adminHome.jsp">Home</a>
  <div class="dropdown">
    <button class="dropbtn">Manage Case
    </button>
    <div class="dropdown-content">
      <a href="addCase.jsp">Add Case</a>
      <a href="#">Track Case</a>
      <a href="#">Map Case</a>
    </div>   
  </div> 
  <div class="dropdown">
  <button class="dropbtn">Manage Officer
    </button>
    <div class="dropdown-content">
      <a href="addOfficer.jsp">Add Officer</a>
      <a href="#">Remove Officer</a>
    </div>
        </div>
  <div class="signout"><a href="signOut.jsp">Sign out</a></div>
</div> <br/>
<form action="addOfficertoDB.jsp" method="post" name="addOfficer" onsubmit="return validate()">
  <div class="container">
     <h1>Add Officer!</h1>
    <label for="officerIdLabel"><b>officer Id</b></label>
    <input type="text" placeholder="" name="officerId" id="officerIdValue" readonly required>
    
    <label for="passwordLabel"><b>Password</b></label>
    <%
     generatePassword gen=new generatePassword();
     String psw=gen.generateRandomPassword();
    %>
    <input type="password" placeholder="" name="password" value=<%=psw%> readonly required>
    
    <label for="nameLabel"><b>Name</b></label>
    <input type="text" name="name" placeholder="Enter officer name" required>
    
    <label for="emailLabel"><b>Email</b></label>
    <input type="text" name="email" placeholder="Enter Officer email" required>
    <span id="emailfield" style="color:red"></span><br/>
    
    <label for="phoneNoLabel"><b>Phone No</b></label>
    <input type="number" name="phoneNo" placeholder="Enter officer phone no" required>
    <span id="phonefield" style="color:red"></span><br/>
    
    <label for="agencyNameLabel"><b>Agency Name</b></label>
    <%
   try{
   Class.forName("oracle.jdbc.driver.OracleDriver");     
   Connection con=(Connection)DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","renga");
   PreparedStatement pstmt=con.prepareCall("select * from investigation_agency");
   ResultSet rs=pstmt.executeQuery();%>
   <select name="agencyName" required>
        <option value="" disabled=disabled selected>select...</option>
        <%  while(rs.next()){ %>
            <option><%=rs.getString(1)%></option>
        <% } %>
    </select><%
   }catch(Exception e)
   {
       System.out.println(e);
   }       
%>

    <label for="deptIdLabel"><b>Department Name</b></label>
    <%
   try{
   Class.forName("oracle.jdbc.driver.OracleDriver");     
   Connection con=(Connection)DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","renga");
   PreparedStatement pstmt=con.prepareCall("select * from dept");
   ResultSet rs=pstmt.executeQuery();%>
   <select name="deptId" required>
        <option value="" disabled=disabled selected>select...</option>
        <%  while(rs.next()){ %>
            <option><%=rs.getString(1)%></option>
        <% } %>
    </select><%
   }catch(Exception e)
   {
       System.out.println(e);
   }       
%>
    <label for="responsibiltyLabel"><b>Responsibility</b></label>
    <select name="userType" required>
        <option value="" disabled=disabled selected>select...</option>
        <option value="Investigation">Investigation</option>
        <option value="Forensic">Forensic</option>
    </select>
    
    <button type="submit" class="btn">Add</button>
    <button type="reset" class="btn">Clear</button><br/>
  </div>
</form>
    </body>
</html>
