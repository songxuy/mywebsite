/// <reference path="jquery-3.1.1.min.js" />
 function checkUser(){
   var result = document.getElementById("name").value;
   var password = document.getElementById("pwd").value;
   if(result == ""  ){
     alert("�û�������Ϊ��");
     return false;
   }
   if(password == ""  ){
    alert("���벻��Ϊ��");
     return false;
   }
}