<%-- 
    Document   : signIn
    Created on : Mar 14, 2020, 4:22:44 PM
    Author     : RengaNayagi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign in</title>
        <style>
            .btn {
  width: auto;
  padding: 10px 18px;
  background-color: #f44336;
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
button:hover {
  width: 70px;
  height: 50px;

}
</style>
        <link rel="stylesheet" type="text/css" href="NavigationBar.css">
        <link rel="stylesheet" type="text/css" href="Form.css">
<script type="text/javascript">
       function check()
        {
        var xmlhttp = new XMLHttpRequest();
         
        var uId= document.signIn.uId.value;
        var url= "IdCheck.jsp?uId=" + uId;
       if(document.signIn.uId.value!=""){
        xmlhttp.onreadystatechange = function(){
               
          if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
              
                document.getElementById("Idfield").innerHTML=xmlhttp.responseText;
                
        }
      };
      try{
      xmlhttp.open("GET",url,true);
      xmlhttp.send();
         }catch(e){
                alert("Server failed to connect");
            }
    }
        }
</script>
    </head>
    <body>
        <ul>
            <li><a class="active" href="Home.jsp">Home</a></li>
            <li><a href="#news">News</a></li>
            <li><a href="#contact">Contact</a></li>
            <li><a href="#about">About</a></li>
            <li><a href="signIn.jsp">Sign in</a></li>
        </ul>
        <form action="signInCheck.jsp" method="post" name="signIn" onsubmit="return validate()">
  <div class="imgcontainer">
       <img src="avatar.png" alt="Avatar" class="avatar">
  </div>

  <div class="container">
    <label for="uname"><b>User Id</b></label>
    <input type="text" placeholder="Enter User Id" name="uId" onblur="check()">
    <span id="Idfield" style="color:red"></span><br/>

    <label for="psw"><b>Password</b></label>
    <input type="password" placeholder="Enter Password" name="password" required>
        
    <button type="submit">Login</button>
    <button type="reset" class="btn">Clear</button><br/>
    <label>
      <input type="checkbox" checked="checked" name="remember"> Remember me
    </label>
  </div>
  <div class="container" style="background-color:#f1f1f1">
    <span class="psw">Forgot <a href="#">password?</a></span>
    <br/>
  </div>
</form>
    </body>
</html>
