<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<html>
  <head>
   
    <title>My JSP 'load.jsp' starting page</title>
    <script src="js/jquery-3.1.1.min.js"></script>
    <script src="js/checkload.js"></script>
    <link href="font-awesome-4.7.0/css1/font-awesome.min.css" rel="stylesheet" />
  <link rel="stylesheet" href="font-awesome-4.7.0/css1/font-awesome.min.css" ></link>
    <link href="css/load.css" rel="stylesheet" />
  </head>
  
  <body>
    <div class="load">
    <div class="top">
    <h4>账号密码登录<br></h4>
    <p>推荐使用<a href="#">二维码登录</a></p>
    </div>
    <form action="ckload" method="post" onsubmit="return checkUser()" > 
    <input type="text" name="name" id="name" placeholder="用户名/手机号"/><br>
    <input type="password" name="pwd" id="pwd" placeholder="密码"/><br>
    <input type="submit" value="登  录" id="load" >
    </form>
    <div class="end">
    <a href="#">忘了密码?</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;<a href="reg.html">注册新账号</a>
    </div>
    </div>
    <div class="logo"></div>
    <div class="rights">
    Copyright@   2017-2020  sxy  Rights Reserved.
    </div>
  </body>
</html>
