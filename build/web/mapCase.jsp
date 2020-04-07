<%-- 
    Document   : mapCase
    Created on : Mar 22, 2020, 1:35:59 PM
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
        <title>Map Case</title>
        <script type="text/javascript">
function view(){
var Id=document.getElementById("Id").value;
var assignId=document.getElementById("assignId").value;
window.location.replace("mapCase.jsp?Id="+Id+"&assignId="+assignId);
}
</script>
<script type="text/javascript">
function resetValues()
    {
        window.location.replace("mapCase.jsp");
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
<form method="post" action="mapCaseinDB.jsp" name="mapCase">
  <div class="container">
     <h1>Map Case!</h1>
    <label for="caseIdLabel"><b>Case Id</b></label>
    <%
   try{
   caseId=request.getParameter("Id");
   Class.forName("oracle.jdbc.driver.OracleDriver");     
   Connection con=(Connection)DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","renga");
   PreparedStatement pstmt=con.prepareCall("select * from case");
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
   <input type="text" value="<%=caseType%>" name="caseType"/>
   
    <label for="caseDescLabel"><b>Case description</b></label>
    <textarea name="caseDesc" rows="10" cols="50"><%=caseDesc%></textarea><br/>
    
    <label for="officerIdLabel"><b>officer Id</b></label>
    <%
   try{
   officerId=request.getParameter("assignId");
   Class.forName("oracle.jdbc.driver.OracleDriver");     
   Connection con=(Connection)DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","renga");
   PreparedStatement pstmt=con.prepareCall("select * from officer");
   ResultSet rs=pstmt.executeQuery();%>
   <select name="officerId" Id="assignId" onchange="view(this)">
       <%
          if(officerId!=""&&officerId!=null)
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
    officerId=request.getParameter("assignId");
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
    
    <button type="submit" class="btn">Assign</button>
    <button type="reset" class="btn" onclick="return resetValues()">Clear</button><br/>
  </div>
</form>
    </body>
</html>
