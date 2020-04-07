<%-- 
    Document   : InvestigationOfficerHome
    Created on : Mar 22, 2020, 5:41:21 PM
    Author     : RengaNayagi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
        <link rel="stylesheet" type="text/css" href="NavigationBar.css">
        <style>
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
</div>

        <br/>
        <font color="white"><strong>Welcome</strong> ${sessionScope.Id}!</font>
    </body>
</html>
