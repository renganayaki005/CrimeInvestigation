<%-- 
    Document   : addSuspect
    Created on : Mar 29, 2020, 10:34:16 PM
    Author     : RengaNayagi
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
  String caseId="";
  String officerId=(String)session.getAttribute("Id");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Suspect</title>
        <link rel="stylesheet" type="text/css" href="NavigationBar.css">
 <link rel="stylesheet" type="text/css" href="Form.css">
        <script>
         window.onload = function(){
             //if(document.getElementById("suspectIdvalue").value!=null)
                document.getElementById("suspectIdValue").value = "SUS"+Math.floor((Math.random() * 10000) + 100);
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
    </head>
    <body>
        <div class="navbar">
  <a href="InvestigationOfficerHome.jsp">Home</a>
  <div class="dropdown">
    <button class="dropbtn">Case
    </button>
    <div class="dropdown-content">
      <a href="viewAssignedCase.jsp">View Assigned Case</a>
      <a href="updateCaseStatus.jsp">Update Case Status</a>
      <a href="viewCaseHistory.jsp">View Case History</a>
    </div>   
  </div> 
  <div class="dropdown">
  <button class="dropbtn">Suspect
    </button>
    <div class="dropdown-content">
      <a href="addSuspect.jsp">Add Suspect</a>
      <a href="viewSuspect.jsp">View Suspect</a>
    </div>
        </div>
  <div class="dropdown">
  <button class="dropbtn">Evidence
    </button>
    <div class="dropdown-content">
      <a href="addEvidence.jsp">Add Evidence</a>
      <a href="viewEvidence.jsp">View Evidence</a>
    </div>
        </div>
  <div class="dropdown">
  <button class="dropbtn">Report
    </button>
    <div class="dropdown-content">
      <a href="viewReport.jsp">View Report</a>
    </div>
        </div>
  <div class="signout"><a href="signOut.jsp">Sign out</a></div>
        </div><br/>
<form method="post" action="addSuspectinDB.jsp" name="addSuspect">
  <div class="container">
     <h1>Add Suspect!</h1>
    <label for="suspectIdLabel"><b>Suspect Id</b></label>
    <input type="text" placeholder="" name="suspectId" id="suspectIdValue" readonly required>

     <label for="caseIdLabel"><b>Case Id</b></label>
    <%
   try{
   caseId=request.getParameter("Id");
   Class.forName("oracle.jdbc.driver.OracleDriver");     
   Connection con=(Connection)DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","renga");
   PreparedStatement pstmt=con.prepareCall("select * from case where caseId=(select caseId from caseMapping where officerId='"+officerId+"')");
   ResultSet rs=pstmt.executeQuery();%>
   <select name="caseId" id="Id">
              <option value="" disabled=disabled selected>select...</option>
              <%  while(rs.next()){ %>
              <option><%=rs.getString(1)%></option>
        <% 
              }             
         %>
    </select><%
   }catch(Exception e)
   {
       System.out.println(e);
   }       
%>
    <label for="nameLabel"><b>Name</b></label>
    <input type="text" name="name" placeholder="Enter suspect name" required>
     
    <label for="addressLabel"><b>Address</b></label>
    <textarea name="address" rows="10" cols="50" placeholder="Enter suspect address" required></textarea><br/>
    
    <label for="cityLabel"><b>City</b></label>
    <input type="text" name="city" placeholder="Enter suspect city" required>
    
    <label for="stateLabel"><b>State</b></label>
    <input type="text" name="state" placeholder="Enter suspect state" required>
    
    <label for="countryLabel"><b>Country</b></label>
    <select name="country" required>
        <option value="" disabled=disabled selected>select...</option>
        <option value="India">India</option>
        <option value="USA">USA</option>
        <option value="Japan">Japan</option>
        <option value="South Korea">South Korea</option>
        <option value="UK">UK</option>
        <option value="China">China</option>
        <option value="Russia">Russia</option>
        <option value="France">France</option>
    </select>
    
    <label for="phoneNoLabel"><b>Phone No</b></label>
    <input type="number" name="phoneNo" placeholder="Enter suspect phone no" required>
    
    <label for="associationLabel"><b>Association</b></label>
    <input type="text" name="association" placeholder="Enter association" required>
     
    
    
    <button type="submit" class="btn">Add</button>
    <button type="reset" class="btn">Clear</button><br/>
  </div>
</form>
    </body>
</html>