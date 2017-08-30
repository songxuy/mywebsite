/// <reference path="jquery-3.1.1.min.js" />
 function checkUser(){
   var result = document.getElementById("name").value;
   var password = document.getElementById("pwd").value;
   if(result == ""  ){
     alert("用户名不能为空");
     return false;
   }
   if(password == ""  ){
    alert("密码不能为空");
     return false;
   }
}