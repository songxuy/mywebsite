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
    <h4>�˺������¼<br></h4>
    <p>�Ƽ�ʹ��<a href="#">��ά���¼</a></p>
    </div>
    <form action="ckload" method="post" onsubmit="return checkUser()" > 
    <input type="text" name="name" id="name" placeholder="�û���/�ֻ���"/><br>
    <input type="password" name="pwd" id="pwd" placeholder="����"/><br>
    <input type="submit" value="��  ¼" id="load" >
    </form>
    <div class="end">
    <a href="#">��������?</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;<a href="reg.html">ע�����˺�</a>
    </div>
    </div>
    <div class="logo"></div>
    <div class="rights">
    Copyright@   2017-2020  sxy  Rights Reserved.
    </div>
  </body>
</html>
