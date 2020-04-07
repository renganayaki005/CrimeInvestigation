<%-- 
    Document   : viewAssignedCase
    Created on : Mar 29, 2020, 8:37:40 PM
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
  String caseType="";
  String caseDesc="";
  String officerId=(String)session.getAttribute("Id");
  String officerType=(String)session.getAttribute("type");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Assigned Case</title>
        <link rel="stylesheet" type="text/css" href="NavigationBar.css">
 <link rel="stylesheet" type="text/css" href="Form.css">
        <script type="text/javascript">
function view(){
var Id=document.getElementById("Id").value;
alert(Id);
window.location.replace("viewAssignedCase.jsp?Id="+Id);
}
</script>
<script type="text/javascript">
function resetValues()
    {
        window.location.replace("viewAssignedCase.jsp");
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
        <%
        if(officerType.equals("Investigation")){
        %>
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
        <%
        }
        else
        {
            %>
          <div class="navbar">
  <a href="ForensicOfficerHome.jsp">Home</a>
  <div class="dropdown">
    <button class="dropbtn">Case
    </button>
    <div class="dropdown-content">
      <a href="viewAssignedCase.jsp">View Assigned Case</a>
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
      <a href="updateReport.jsp">Update Report</a>
      <a href="viewReport.jsp">View Report</a>
    </div>
        </div>
  <div class="signout"><a href="signOut.jsp">Sign out</a></div>
</div>

        <%
        }
        %>
<form method="post" name="viewAssignedCase">
  <div class="container">
     <h1>Assigned Case!</h1>
    <label for="caseIdLabel"><b>Case Id</b></label>
    <%
   try{
   caseId=request.getParameter("Id");
   Class.forName("oracle.jdbc.driver.OracleDriver");     
   Connection con=(Connection)DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","renga");
   PreparedStatement pstmt=con.prepareCall("select * from case where caseId IN (select caseId from caseMapping where officerId='"+officerId+"')");
   ResultSet rs=pstmt.executeQuery();%>
   <select name="caseId" id="Id">
       <%
          if(caseId!=null&&caseId!="")
          {
              %>
              <option value="" disabled=disabled>select...</option>
              <option value="<%=caseId%>" selected><%=caseId%></option>
              <%  while(rs.next()){ 
                 if(!rs.getString(1).equals(caseId)){
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

    <label for="caseTypeLabel"><b>Case type</b></label>
    
 <%
   try{
    Class.forName("oracle.jdbc.driver.OracleDriver");     
    Connection con=(Connection)DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","renga");
    Statement st=con.createStatement();
    ResultSet rs=st.executeQuery("select * from case where caseId='"+caseId+"'");
    if(rs.next()){
       caseType=rs.getString("caseType");
       caseDesc=rs.getString("caseDesc");
    }
     }catch(Exception e)
   {
       System.out.println(e);
   }  
   %>
   <input type="text" value="<%=caseType%>" name="caseType" readonly/>
   
    <label for="caseDescLabel"><b>Case description</b></label>
    <textarea name="caseDesc" rows="10" cols="50" readonly><%=caseDesc%></textarea><br/>
    
    
    <button type="button" class="btn" onclick="view(this)">View</button>
    <button type="reset" class="btn" onclick="return resetValues()">Clear</button><br/>
  </div>
</form>
    </body>
</html>

        
    </body>
</html>
