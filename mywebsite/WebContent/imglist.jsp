<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page import="java.sql.*" %>
<%@ page import="check.conndbsong" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>My JSP 'imglist.jsp' starting page</title>
  </head>
  <script src="js/jquery-3.1.1.min.js"></script>
  <script type="text/javascript" src="js/baguetteBox.min.js"></script>
   <script src="layer/layer.js"></script>
    <script src="js/img.js"></script>
   <link href="font-awesome-4.7.0/css1/font-awesome.min.css" rel="stylesheet" />
  <link rel="stylesheet" href="font-awesome-4.7.0/css1/font-awesome.min.css" ></link>
  <link rel="stylesheet" href="css/baguetteBox.min.css">
	<link rel="stylesheet" href="css/gallery-grid.css">
   <link rel="stylesheet" href="css/img.css" type="text/css"></link>
  <body>
  <div class="from">
            <form action="listupimg" method="post" enctype="multipart/form-data">
                <h2><i>��ѡ���ϴ���ͼƬ:</i></h2>
                <input type="file" name="file" class="file" />
                <div class="hao">
                    <input type="submit" name="submit" value="�ϴ�" class="sub" />
                    <input type="reset" name="nosubmit" value="ȡ��" class="sss1" />
                </div>
            </form>
        </div>
    <div class="top">
    <img src="image/qzone3.png">
  <span>SHOW  IMAGE</span>
  </div>
  <div class="back">
   <div class="name">
   <span>http://showimage.qzone.qq.com</span>
   </div>
   <div class="head">
   
   <%
            conndbsong song=new conndbsong();
		       ResultSet rst3=null;
			   PreparedStatement prt3=null;
			    Connection conn2=song.connec();
		            prt3=conn2.prepareStatement("select imgname from headimg where username=?");
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
             <span><a href="lmsg.jsp">��־</a></span>
       </li>
       <li>
             <span>���</span>
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
   <div class="menu">
   <div class="menu1">
   <ul>
   <li>���</li>
   <li>��Ƭ</li>
   <li>��Ƶ</li>
   </ul>
   </div>
   <div class="menu2">
   <ul>
   <li><span><i class="fa fa-th-large fa-lg"></i></span>&nbsp;Ӧ��</li>
   <li><span><i class="fa fa-trash-o fa-lg"></i></span>&nbsp;����վ</li>
   <li><span><i class="fa fa-paper-plane fa-lg"></i></span>&nbsp;����</li>
   </ul>
   </div>
   </div>
    <hr>
     <div class="name1">
     <%
            
		       ResultSet rst=null;
			   PreparedStatement prt=null;
			   ResultSet rst2=null;
			   PreparedStatement prt2=null;
			   int i=0;
			    Connection conn=song.connec();
		            prt=conn.prepareStatement("select imgname from newimg where username=? order by pid desc");
		            prt.setString(1,(String)session.getAttribute("name"));
		            prt2=conn.prepareStatement("select * from newimg where username=? order by pid desc");
		 			prt2.setString(1,(String)session.getAttribute("name"));
		 			rst=prt.executeQuery();
		 			rst2=prt2.executeQuery();
		 			if(rst.next()){
        %>
       <img class="border" src="<%=basePath %>/images/<%=rst.getString("imgname") %>" /><%}%>
       <%while(rst2.next()){ i++;}%>
       <div class="sum"><span>������<%=i %></span></div>
       <div class="btn1"><button><i class="fa fa-picture-o fa-lg"></i>&nbsp;�ϴ�ͼƬ</button></div>
       <div class="btn3"><button><i class="fa fa-window-close-o fa-lg"></i>&nbsp;ɾ��</button></div>
       <div class="btn2"><button><i class="fa fa-bars fa-lg"></i>&nbsp;����</button></div>
   </div>
   <div class="showimg">
   <%
    ResultSet rst1=null;
	PreparedStatement prt1=null;
	prt1=conn.prepareStatement("select imgname, ptime from newimg where username=? order by pid desc");
	prt1.setString(1, (String)session.getAttribute("name"));
	rst1=prt1.executeQuery();
	int j=0;
    %>
    <div class="tz-gallery">
     <div class="row">
   <ul>
   <%while(rst1.next()){ j++;%>
 <%if(j==1){ %><li><div class="col-sm-12 col-md-4"><a class="lightbox" href="<%=basePath %>/images/<%=rst1.getString("imgname") %>"><img src="<%=basePath %>/images/<%=rst1.getString("imgname") %>" /></a></div><%}else{
    %><li><div class="col-sm-6 col-md-4"><a class="lightbox" href="<%=basePath %>/images/<%=rst1.getString("imgname") %>"><img src="<%=basePath %>/images/<%=rst1.getString("imgname") %>" /></a></div><%}  %><div class="time"><%=rst1.getString("ptime") %></div></li>
   <%} %>
   </ul>
   </div>
   </div>
   </div>
   </div>
   <div class="dele">
   <form action="deleimg" method="post">
   <div class="demenu">
   <div class="alls">
   </div>
   <span>��ҳȫѡ</span>
   <input type="submit" value="ɾ��" id="del"/>
   <button>����</button>
   </div>
   <div class="showimg">
   <%
    ResultSet rst4=null;
	PreparedStatement prt4=null;
	prt4=conn.prepareStatement("select * from newimg where username=? order by pid desc");
	prt4.setString(1, (String)session.getAttribute("name"));
	rst4=prt1.executeQuery();
    %>
   <ul>
   <%while(rst4.next()){ %>
 <li><input type="checkbox" name="check" value="<%=rst4.getString("imgname") %>" /> <img src="<%=basePath %>/images/<%=rst4.getString("imgname") %>" /></li>
   <%} %>
   </ul>
   </div>
   </form>
   </div>
   </div>
  </body>
</html>
