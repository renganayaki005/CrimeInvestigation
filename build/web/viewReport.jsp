<%-- 
    Document   : viewEvidenceReport
    Created on : Apr 6, 2020, 8:28:56 PM
    Author     : RengaNayagi
--%>

<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
  String caseId="";
  String evidenceId="";
  String officerId=(String)session.getAttribute("Id");
  String officerType=(String)session.getAttribute("type");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Evidence Report</title>
        <link rel="stylesheet" type="text/css" href="NavigationBar.css">
 <link rel="stylesheet" type="text/css" href="Form.css">
        <script type="text/javascript">
function view(){
var Id=document.getElementById("Id").value;
var eId=document.getElementById("eId").value;
window.location.replace("viewReport.jsp?Id="+Id+"&eId="+eId);
}
</script>
<script type="text/javascript">
function resetValues()
    {
        window.location.replace("viewReport.jsp");
    }
</script>
       <style>
   .container1 {
  padding: 16px;
  width: 700px;
  background-color: #DCDCDC;
  position: relative;
  transform: translate(43%,0%);
}
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

            table tr:not(:first-child):hover{background-color: white;}
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
<form method="post"  name="viewReport">
  <div class="container1">
     <h1>View Evidence Report!</h1>     
         <label for="caseIdLabel"><b>Case Id</b></label>
    <%
   try{
   caseId=request.getParameter("Id");
   Class.forName("oracle.jdbc.driver.OracleDriver");     
   Connection con=(Connection)DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","renga");
   PreparedStatement pstmt=con.prepareCall("select * from case where caseId IN (select caseId from caseMapping where officerId='"+officerId+"')");
   ResultSet rs=pstmt.executeQuery();%>
   <select name="caseId" id="Id" onchange="view(this)">
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
   <label for="evidenceIdLabel"><b>Evidence Id</b></label>
   <%
   try{
   evidenceId=request.getParameter("eId");
   Class.forName("oracle.jdbc.driver.OracleDriver");     
   Connection con=(Connection)DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","renga");
   PreparedStatement pstmt=con.prepareCall("select * from evidence where caseId IN (select caseId from caseMapping where officerId='"+officerId+"')");
   ResultSet rs=pstmt.executeQuery();%>
   <select name="evidenceId" id="eId" onchange="view(this)">
       <%
      if(caseId!=null&&caseId!="")
    {
          if(evidenceId!=null&&evidenceId!="")
          {
              %>
              <option value="" disabled=disabled>select...</option>
              <option value="<%=evidenceId%>" selected><%=evidenceId%></option>
              <%  while(rs.next()){ 
                 if(!rs.getString(1).equals(evidenceId)){
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
    }
      else
      {
          %><option value="" disabled=disabled selected>select...</option><%
      }
        %>
    </select><%
   }catch(Exception e)
   {
       System.out.println(e);
   }         
   %>
   
   
   
   <%
    if(evidenceId!=null&&evidenceId!="")
    {
   try{
   evidenceId=request.getParameter("eId");
   Class.forName("oracle.jdbc.driver.OracleDriver");     
   Connection con=(Connection)DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","renga");
   PreparedStatement pstmt=con.prepareCall("select * from report where evidenceId='"+evidenceId+"'");
   ResultSet rs=pstmt.executeQuery();
   if(!rs.isBeforeFirst())
   {
       %><center><h3>No Report added</h3></center><%
   }
   else{
       %>
       <table id="table" border="1">
           <tr>
                <th>Report Id</th>
                <th>Report Description</th>
                <th>Report</th>
         
            </tr> 
            <%
             while(rs.next())
             {
                 %>
                 <tr>
                     <td><%out.print(rs.getString("reportId"));%></td>
                     <td><%out.print(rs.getString("reportDesc"));%></td>

                     <td><a href="viewEvidenceReport.jsp?reportId=<%out.print(rs.getString("reportId"));%>"><center><img src="view-file.png" width="70" height="50"></center></a></td>
       
              
                      
                    </tr>
                 <%
             }
            %>
       </table>
   <%
   }
   }catch(Exception e)
   {
       System.out.println(e);
   }        
    }
   %>      
   </div>
</form>
    </body>
</html>
