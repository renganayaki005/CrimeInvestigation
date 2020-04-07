<%-- 
    Document   : removing
    Created on : Mar 21, 2020, 2:14:05 PM
    Author     : RengaNayagi
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page import="utilities.generatePassword"%>
<%@page import="java.util.Random"%>
<%@page import="java.security.SecureRandom"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
  String officerId="";
  String name="";
  String email="";
  String phoneNo="";
  String agencyName="";
  String deptId="";
  String responsibility="";
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Remove Officer</title>
        <script type="text/javascript">
function view(){
var Id=document.getElementById("Id").value;
alert(Id);
window.location.replace("removeOfficer.jsp?Id="+Id);
}
</script>
<script type="text/javascript">
 function resetValues()
    {
        window.location.replace("removeOfficer.jsp");
    }
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
  width: 90px;
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
      <a href="trackCase.jsp">Track Case</a>
      <a href="mapCase.jsp">Map Case</a>
      <a href="viewCaseHistory.jsp">View Case History</a>
    </div>   
  </div> 
  <div class="dropdown">
  <button class="dropbtn">Manage Officer
    </button>
    <div class="dropdown-content">
      <a href="addOfficer.jsp">Add Officer</a>
      <a href="removeOfficer.jsp">Remove Officer</a>
    </div>
        </div>
  <div class="signout"><a href="signOut.jsp">Sign out</a></div>
</div> <br/>
<form id="rmOfficer" action="removeOfficerfromDB.jsp" method="post" name="removeOfficer">
  <div class="container">
     <h1>Remove Officer!</h1>
    <label for="officerIdLabel"><b>officer Id</b></label>
    <%
   try{
   officerId=request.getParameter("Id");
   Class.forName("oracle.jdbc.driver.OracleDriver");     
   Connection con=(Connection)DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","renga");
   PreparedStatement pstmt=con.prepareCall("select * from officer");
   ResultSet rs=pstmt.executeQuery();%>
   <select name="officerId" id="Id" onchange="view(this)">
       <%
          if(officerId!=null)
          {
              %>
              <option value="" disabled=disabled>select...</option>
              <option value="<%=officerId%>" selected><%=officerId%></option>
              <%  while(rs.next()){ 
                 if(!rs.getString(1).equals(officerId)){
              %>
              <option><%=rs.getString(1)%></option>
        <% }
            }
          }
          else
          {
       %>
        <option value="" disabled=disabled selected>select...</option>
        <%  while(rs.next()){ %>
            <option><%=rs.getString(1)%></option>
        <% }
          }
        %>
    </select><%
   }catch(Exception e)
   {
       System.out.println(e);
   }       
%>
   
    <label for="nameLabel"><b>Name</b></label>
    
     <%
   try{
    officerId=request.getParameter("Id");
    Class.forName("oracle.jdbc.driver.OracleDriver");     
    Connection con=(Connection)DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","renga");
    Statement st=con.createStatement();
    ResultSet rs=st.executeQuery("select * from officer where Id='"+officerId+"'");
    if(rs.next()){
       name=rs.getString("name");
       email=rs.getString("email");
       phoneNo=rs.getString("phoneNo");
       agencyName=rs.getString("agencyName");
       deptId=rs.getString("deptId");
    }
     }catch(Exception e)
   {
       System.out.println(e);
   }  
   %>
   <input type="text" value="<%=name%>" name="name"/>
     
    <label for="emailLabel"><b>Email</b></label>
    <input type="text" name="email" value="<%=email%>" readonly>
   
    
    <label for="phoneNoLabel"><b>Phone No</b></label>
    <input type="text" name="phoneNo" value="<%=phoneNo%>" readonly>
    
    <label for="agencyNameLabel"><b>Agency Name</b></label>
    <input type="text" name="agencyName" value="<%=agencyName%>" readonly>

    <label for="deptIdLabel"><b>Department Name</b></label>
    <input type="text" name="deptId" value="<%=deptId%>" readonly>
    
    <%
   try{
    officerId=request.getParameter("Id");
    Class.forName("oracle.jdbc.driver.OracleDriver");     
    Connection con=(Connection)DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","renga");
    Statement st=con.createStatement();
    ResultSet rs=st.executeQuery("select * from signIn where Id='"+officerId+"'");
    if(rs.next()){
       responsibility=rs.getString("userType");
    }
     }catch(Exception e)
   {
       System.out.println(e);
   }  
   %>
    <label for="responsibiltyLabel"><b>Responsibility</b></label>
    <input type="text" name="responsibility" value="<%=responsibility%>" readonly>
       
    <button type="submit" class="btn">Remove</button>
    <button type="reset" class="btn" onclick="return resetValues()">Clear</button><br/>
  </div>
</form>
    </body>
</html>
