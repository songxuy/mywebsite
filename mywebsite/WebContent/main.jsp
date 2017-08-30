<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page import="java.sql.*" %>
<%@ page import="check.conndbsong"%>
<!DOCTYPE HTML>
<html>
  <head>
   
    <%
    String path = request.getContextPath();
String basePath=
request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
    <title>My JSP 'main.jsp' starting page</title>
    <script src="js/jquery-3.1.1.min.js"></script>
    <script src="layer/layer.js"></script>
     <script src="js/more.js"></script>
    <script src="js/3.js"></script>
    <script src="js/uploadPreview.js" ></script>
    <link href="css/1.css" rel="stylesheet" />
    <link href="css/3.css" rel="stylesheet" />
    <script>
       window.onload = function () { 
            new uploadPreview({ UpBtn: "up_img", DivShow: "imgdiv", ImgShow: "imgShow" });
        }
    </script>
  </head>
  
  <body>
   <div class="from">
            <form action="upimg" method="post" enctype="multipart/form-data">
                <h2><i>请选择上传的图片:</i></h2>
                <input type="file" name="file" class="file" />
                <div class="hao">
                    <input type="submit" name="submit" value="上传" class="sub" />
                    <input type="reset" name="nosubmit" value="取消" class="sss1" />
                </div>
            </form>
        </div>
        <div class="headimg">
        <form action="uphead" method="post" enctype="multipart/form-data">
        <div class="iup"><div id="imgdiv"><img id="imgShow" width="152" height="152" /></div>
         <input type="file" id="up_img" name="file" class="file"/></div>
         <input type="submit" value="上传" id="uph">
        </form>
        </div>
        <div id="header">
            <div id="head">
                <div id="hf">&nbsp;你好, 欢迎来到<div class="name"><%=session.getAttribute("name") %></div>空间!</div>
                <div id="login">留下点点滴滴的回忆</div>
                <div class="logout"><a href="load.jsp">退出</a>当前登录</div>
            </div>
        </div>

        <div class="top">
           <span><i>Your Homepage</i></span>
        </div>
        <div class="ser">
            <div class="log">
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
             <%session.setAttribute("hname", rst3.getString("imgname")); %>
             <img class="border" src="<%=basePath %>/himages/<%=rst3.getString("imgname") %>" /><button>设置头像</button>
             <%}else{ %>
                <img class="border" src="image/top.jpg" /><button>设置头像</button>
            </div>
            <%} %>
            <% 
       java.sql.Connection conn=null;
       java.sql.PreparedStatement stmt=null;
  	   java.sql.ResultSet rst=null;
  	   java.sql.PreparedStatement prt=null;
  	   ResultSet rst1=null;
  	   try{
	        	Class.forName("com.mysql.jdbc.Driver");
	        	String url="jdbc:mysql://localhost:3306/song";
	        	String user="root";
	        	String password="song";
	        	conn=DriverManager.getConnection(url, user, password);
	        	System.out.println("成功连接数据库");
	        	stmt=conn.prepareStatement("select * from newmes where username=?");
	        	stmt.setString(1, String.valueOf(session.getAttribute("name")));
	        	rst1=stmt.executeQuery();
	        	prt=conn.prepareStatement("select * from newimg where username=? ");
	        	prt.setString(1, (String)session.getAttribute("name"));
	        	rst=prt.executeQuery();
	        	int i=0;
	        	int j=0;
	        	while(rst1.next()){
	        	i++;
	        	}
	        	while(rst.next()){
	        	j++;
	        	}
	        	%>
            <div class="nav">
                <div class="word"><ul>
                       <li>说说</li>
                       <li>|</li>
                       <li>日志</li>
                       <li>|</li>
                       <li>图片</li>
                </ul></div><br>
                <div class="word1">
                <ul>
                       <li>0</li>
                       <li> </li>
                       <li><%=i %></li>
                       <li> </li>
                       <li><%=j %></li>
                </ul>
                </div>
                <%
	    	}catch(Exception e){
	    		e.printStackTrace();
	    	}
    %>
            </div>
        </div>
        <div class="div1">

            <ul>
                <li class="odd">个人中心</li>
                <li>主页</li>
                <li><a href="lmsg.jsp">日志</a></li>
                <li><a href="#" onclick="showlog()">图片上传</a></li>
                <li><a href="imglist.jsp">相册</a></li>
                <li class="se">更多>></li>
            </ul>
        </div>
 
        <div class="menu">
            <div class="igs">
                <div class="imgs"><img src="image/1.jpg"></div>
                <div class="imgs"><img src="image/3.jpg"></div>
                <div class="imgs"><img src="image/4.jpg"></div>
                <div class="imgs"><img src="image/5.jpg"></div>
                <div class="imgs"><img src="image/6.jpg"></div>
                <div class="imgs"><img src="image/7.jpg"></div>
                <div class="imgs"><img src="image/8.jpg"></div>
            </div>

            <div class="div2">
                <div class="div3">
                    <ul>
                        <li>
                            <span>我的主页</span>
                        </li>
                        <li>
                            <span>好友</span>
                        </li>
                        <li>
                            <span>游戏</span>
                        </li>
                        <li>
                            <span>宠物</span>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="tabs">
                <div class="tab bg">1</div>
                <div class="tab">2</div>
                <div class="tab">3</div>
                <div class="tab">4</div>
                <div class="tab">5</div>
                <div class="tab">6</div>
                <div class="tab">7</div>
            </div>
            <div class="more1">
        <ul>
            <li>
                <span>音乐</span>
            </li>
            <li>
                <span>个人档</span>
           </li>
           <li>
              <span>装扮</span>
           </li>
        </ul>
        </div>
        </div>
   
  </body>
</html>
