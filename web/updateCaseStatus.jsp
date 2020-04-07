<%-- 
    Document   : update
    Created on : Mar 29, 2020, 9:51:16 PM
    Author     : RengaNayagi
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
  String officerId=(String)session.getAttribute("Id");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update case status</title>
        <link rel="stylesheet" type="text/css" href="NavigationBar.css">
 <link rel="stylesheet" type="text/css" href="Form.css">
        <script type="text/javascript">
function view(){
var Id=document.getElementById("Id").value;
alert(Id);
window.location.replace("updateCaseStatus.jsp?Id="+Id);
}
</script>
<script type="text/javascript">
function resetValues()
    {
        window.location.replace("updateCaseStatus.jsp");
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
  width: 80px;
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

table, thead, tbody, tr { width: 100%; }
    table { table-layout: fixed }
    table > thead > tr > th { width: auto; }
table tr:not(:first-child){
                cursor: pointer;transition: all .25s ease-in-out;
            }
            table tr:not(:first-child):hover{background-color: white;}
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
      <a href="addEvidence.jsp">Add Suspect</a>
      <a href="viewEvidence.jsp">View Suspect</a>
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
<form method="post" action="updateCaseStatusinDB.jsp" name="update">
  <div class="container">
     <h1>Update Case Status!</h1>     
        <table id="table" border="1">
            <tr>
                <th>Case Id</th>
                <th>Case Type</th>
                <th>Case Description</th>
                <th>Case Status</th>
            </tr>   
            <%
      Class.forName("oracle.jdbc.driver.OracleDriver");     
   Connection con=(Connection)DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","renga");
   PreparedStatement pstmt=con.prepareCall("select * from case where caseId=(select caseId from caseMapping where officerId='"+officerId+"')");
   ResultSet rs=pstmt.executeQuery();
   if(rs.next()){
   %>
            <tr>
                <td><%out.print(rs.getString("caseId"));%></td>
                <td><%out.print(rs.getString("caseType"));%></td>
                <td><%out.print(rs.getString("caseDesc"));%></td>
                <td><%out.print(rs.getString("status"));%></td>
            </tr>
            <%
   }%>
        </table><br/><br/>
        <label for="caseIdLabel"><b>Case Id</b></label>
        <input type="text" name="caseId" id="caseId" readonly>

        <label for="caseStatusLabel"><b>Case status</b></label>
        <select name="status" required>
        <option value="" disabled=disabled selected>select...</option>
        <%
            if((rs.getString("status")).equals("Assigned"))
                    {
        %>
        <option value="Investigation initiated">Investigation initiated</option>
        <option value="Investigation in-progress">Investigation in-progress</option>
        <option value="Closed">Closed</option>
        <%
            }
            else if(rs.getString("status").equals("Investigation initiated"))
            {
        %>
        <option value="Investigation in-progress">Investigation in-progress</option>
        <option value="Closed">Closed</option>
        <%
         }else if(rs.getString("status").equals("Investigation in-progress")){
            
            %>
            <option value="Closed">Closed</option>
            <%
         }
             else
             {
                     }%>
        </select>
        
        <script>
                var table = document.getElementById('table');
                
                for(var i = 1; i < table.rows.length; i++)
                {
                    table.rows[i].onclick = function()
                    {
                         //rIndex = this.rowIndex;
                         document.getElementById("caseId").value = this.cells[0].innerHTML;
                       
                    };
                }
    
         </script>
         <button type="submit" class="btn">Update</button>
       
   </div>
</form>
    </body>
</html>
