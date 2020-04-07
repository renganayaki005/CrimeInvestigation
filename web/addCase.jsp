<%-- 
    Document   : addCase
    Created on : Mar 15, 2020, 12:48:53 AM
    Author     : RengaNayagi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Case</title>
        <script>
            window.onload = function(){
            document.getElementById("caseIdValue").value = "CASE"+Math.floor((Math.random() * 10000) + 100);
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
<form action="addCasetoDB.jsp" method="post" name="addCase">
  <div class="container">
     <h1>Add Case!</h1>
    <label for="caseIdLabel"><b>Case Id</b></label>
    <input type="text" placeholder="" name="caseId" id="caseIdValue" readonly required>

    <label for="caseTypeLabel"><b>Case type</b></label>
    <select name="caseType" required>
             <option value="" disabled=disabled selected>select...</option>
             <option value="Violent">Violent crime</option>
             <option value="Property">Property crime</option>
             <option value="Public order">Public order crime</option>
             <option value="White collar">White collar crime</option>
             <option value="Organized">Organized crime</option>
             <option value="High tech">High tech crime</option>             
     </select>
    <label for="caseDescLabel"><b>Case description</b></label>
    <textarea name="caseDesc" rows="10" cols="50" required></textarea><br/>
        
    <button type="submit" class="btn">Add</button>
    <button type="reset" class="btn">Clear</button><br/>
  </div>
</form>
    </body>
</html>
