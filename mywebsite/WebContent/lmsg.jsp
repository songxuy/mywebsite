<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page import="java.sql.*" %>
<%@ page import="check.conndbsong" %>


<html>
<meta name="renderer" content="webkit">
 <%
    String path = request.getContextPath();
String basePath=
request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
  <head>
    <title>My JSP 'lmsg.jsp' starting page</title>
  </head>
  <script src="js/jquery-3.1.1.min.js"></script>
   <script src="layer/layer.js"></script>
  <script src="js/lmsg.js"></script>
  <link href="font-awesome-4.7.0/css1/font-awesome.min.css" rel="stylesheet" />
  <link rel="stylesheet" href="font-awesome-4.7.0/css1/font-awesome.min.css" ></link>
  <link rel="stylesheet" href="css/lmsg.css" type="text/css"></link>
   <link rel="stylesheet" href="css/showing.css" type="text/css"></link>
  <body>
  <div class="top">
  <img src="image/qzone3.png">
  <span>LEAVE   MESSAGE</span>
  </div>
   <div class="name">
   <span>http://leavemessage.qzone.qq.com</span>
   </div>
   <div class="head">
   
   <%
            conndbsong song=new conndbsong();
		       ResultSet rst3=null;
			   PreparedStatement prt3=null;
			    Connection conn2=song.connec();
		            prt3=conn2.prepareStatement("select imgname from headimg where username=? ");
		 			prt3.setString(1,(String)session.getAttribute("name"));
		 			rst3=prt3.executeQuery();
		 			if(rst3.next()){
        %>
    
   <img class="border" src="<%=basePath %>/himages/<%=rst3.getString("imgname") %>" /><div class="ttop"><span><%=session.getAttribute("name") %></span></div>
   <%} %>
   <ul class="tm">
       <li>
             <span><a href="main.jsp">��ҳ</a></span>
       </li>
       <li>
             <span>��־</span>
       </li>
       <li>
             <span><a href="imglist.jsp">���</a></span>
       </li>
       <li>
             <span>  ���԰�</span>
      </li>
      <li>
             <span>    ˵˵</span>
      </li>
      <li>
             <span> ���˵�</span>
      </li>
      <li>
             <span>   ����</span>
      </li>
      <li>
             <span>����</span>
      </li>
   </ul>
   </div>
   <div class="main">
   <div class="me">
   <ul>
       <li><span>�ҵ���־</span></li>
       <li><span>������־</span></li>
       <li><span>���±�</span></li>
   </ul>
   </div>
   <div class="toor">
   <ul>
       <li><span style="color:#ccc"><i class="fa fa-server"></i></span>&nbsp;�ݸ���</li>
       <li><span style="color:#ccc"><i class="fa fa-trash-o"></i></span>&nbsp;����վ</li>
       <li><span style="color:#ccc"><i class="fa fa-gear"></i></span>&nbsp;����</li>
       <li><span style="color:#ccc"><i class="fa fa-send-o"></i></span>&nbsp;����</li>
   </ul>
   </div>
   <div class="line"><hr/></div>
   <div class="btn"><span style="color:#fff"><i class=" fa fa-file-o"></i>&nbsp;д��־</span></div>
   <div class="btn2"><span style="color:#fff"><i class="fa fa-indent"></i>&nbsp;ģ����־</span></div>
   <div class="left">
   <% 
       java.sql.Connection conn=null;
       java.sql.PreparedStatement stmt=null;
  	   java.sql.ResultSet rst=null;
  	   java.sql.PreparedStatement  prt=null;
  	   ResultSet rst1=null;
  	   String[] s=null;
  	   try{
	        	Class.forName("com.mysql.jdbc.Driver");
	        	String url="jdbc:mysql://localhost:3306/song";
	        	String user="root";
	        	String password="song";
	        	conn=DriverManager.getConnection(url, user, password);
	        	System.out.println("�ɹ��������ݿ�");
	        	stmt=conn.prepareStatement("select main from newmes where username=?");
	        	stmt.setString(1, String.valueOf(session.getAttribute("name")));
	        	rst1=stmt.executeQuery();
	        	prt=conn.prepareStatement("select title,ptime from newmes where username=? order by id desc");
	        	prt.setString(1, (String)session.getAttribute("name"));
	        	rst=prt.executeQuery();
	        	int i=0;
	        	int j=0;
	        	while(rst1.next()){
	        	i++;
	        	}
	        	%>
   <ul>
         <li><span>��־����</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#">����</a></li>
         <li><span>ȫ����־ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(<%=i %>)</span></li>
         <li><span>������־ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(<%=i %>)</span></li>
   </ul>
   </div>
   <div class="sql">
   <% 
   if(i==0){
    %>
    <span>����û����־����ȥд��־��</span>
    <%} %>
  <% while (rst.next()){
                  %>
	        	<span class="title"><%=rst.getString("title") %></span><br><span class="time"><%=rst.getString("ptime") %></span>&nbsp;<div class="showmsg" onclick="see(<%=j%>)">�鿴ȫ��</div>
	        	<hr>
	        	
	        	<%j++;}
	    	}catch(Exception e){
	    		e.printStackTrace();
	    	}
    %>
    </div>
   </div>
   <div class="write">
   <div class="wtop">
   <ul>
   <li class="odd">д��־</li>
        <li><span>�ݸ���</span></li>
        <li><span>�Ὠ��</span></li>
        <li><span>�¹���˵��</span></li>
        <li><span>������־�б�</span></li>
   </ul></div>
   <form action="write" method="post">
   <div class="wmain">
   <input type="text" name="name" id="name" placeholder="���������������"/>
   <textarea rows="15" cols="110" id="body" name="main"></textarea>
   </div>
   <div class="wbtn">
   <input type="submit" value="����" id="sub" name="sub" >
   <input type="reset"  value="ȡ��" id="reset">
   <button id="solve">����ݸ�</button>
   </div>
   </form>
   </div>
   <%
   java.sql.Connection conn1=null;
   java.sql.PreparedStatement prt1=null;
   ResultSet rst2=null;
   int n=0; 
   try{
	        	Class.forName("com.mysql.jdbc.Driver");
	        	String url="jdbc:mysql://localhost:3306/song";
	        	String user="root";
	        	String password="song";
	        	conn1=DriverManager.getConnection(url, user, password);
	        	System.out.println("�ɹ��������ݿ�");
	        	prt1=conn1.prepareStatement("select title,main from newmes where username=? order by id desc");
	        	prt1.setString(1, (String)session.getAttribute("name"));
	        	rst2=prt1.executeQuery();
	  
	        	while(rst2.next()){
	       
	        	%>
   <div class="showing">
   <div class="showmsg">
   <ul>
   <li class="showm">YOUR LOG</li>
        <li><span onclick="pre(<%=n %>)"><i class="fa fa-reply"></i>&nbsp;��һƪ</span></li>
        <li><span onclick="next(<%=n %>)">��һƪ&nbsp;<i class="fa fa-share"></i></span></li>
        <li><span onclick="back()">������־�б�</span></li>
        
   </ul></div>
   <form action="delet" method="post">
   <div class="smain">
   
   <input type="text" name="name" id="name" placeholder=<%=rst2.getString("title") %> readonly/>
   <textarea rows="15" cols="110" id="body" name="main" readonly><%=rst2.getString("main") %></textarea>
   </div>
   <div class="sbtn">
   <input type="submit" value="ɾ��" id="sub" name="sub" >
   </div>
   </form>
   </div>
   <% n++;}
   }catch(Exception e){
	    		e.printStackTrace();
	    	}
    %>
  </body>
</html>
