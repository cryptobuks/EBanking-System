/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


function validateForm()
{
var x=document.forms["myForm"]["email"].value;
var atpos=x.indexOf("@");
var dotpos=x.lastIndexOf(".");
if (atpos<1 || dotpos<atpos+2 || dotpos+2>=x.length)
  {
  alert("Not a valid e-mail address");
  return false;
  }
  return true;
}

function validateInput(x, fieldName,labelName)
{
if (x==null || x=="")
  {
  document.getElementsByName(labelName)
  
  }
  
}

function loginValidation(){
    var username=document.getElementById("userName").value;
    var found=false;
    if(username == null || username == ""){
        document.getElementById("userNameDiv").innerHTML = "* Please enter the CustomerId";
        found=true;
    }
    var password=document.getElementById("password").value;
    if(password == null || password == ""){
        document.getElementById("passwordDiv").innerHTML = "* Please enter the password";
        found=true;
    }
    if(found){
        return found;
    }
}