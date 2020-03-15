/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function validate()
       {
      var phoneno = /^\d{10}$/;
      var status=true;
      var atposition=document.addOfficer.email.value.indexOf("@");  
      var dotposition=document.addOfficer.email.value.lastIndexOf("."); 
      if(!document.addOfficer.phoneNo.value.match(phoneno))
        {
           document.getElementById("phonefield").innerHTML="Enter a valid phone no"; 
           addOfficer.phoneNo.focus()
           status=false;           
        }
        else
        {
          document.getElementById("phonefield").innerHTML=""; 
        }
       if(atposition<1 || dotposition<atposition+2 || dotposition+2>=document.register.emailfield.value.length)
           {  
             document.getElementById("emailfield").innerHTML="Enter a valid email(abc@mail.com)";
             addOfficer.email.focus();
             status=false;  
           }
      else
        {
             document.getElementById("emailfield").innerHTML="";
        }       
        return status;
    }
