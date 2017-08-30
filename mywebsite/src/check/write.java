package check;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class write extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=gb2312");
		PrintWriter out = response.getWriter();
		String title=new String(request.getParameter("name").getBytes("ISO-8859-1"),"gb2312");
		String main=new String(request.getParameter("main").getBytes("ISO-8859-1"),"gb2312");
		HttpSession session=request.getSession();
		String uname=(String) session.getAttribute("name");
		SimpleDateFormat f=new SimpleDateFormat("yyyy/MM/dd HH:mm");
		 String str=f.format(new Date());
		 String ur="http://localhost:8080/project/lmsg.jsp";
		 java.sql.Connection conn=null;
	    	PreparedStatement stmt=null;
	    	Statement st=null;
	    	ResultSet rst=null;
	    	int i=1;
	    	try{
	        	Class.forName("com.mysql.jdbc.Driver");
	        	String url="jdbc:mysql://localhost:3306/song";
	        	String user="root";
	        	String password="song";
	        	conn=DriverManager.getConnection(url, user, password);
	        	System.out.println("成功连接数据库");
	        	st=conn.createStatement();
	        	rst=st.executeQuery("select * from newmes");
	        	while(rst.next()){
	        		i++;
	        	}
	        	st=conn.createStatement();
	        	stmt=conn.prepareStatement("insert into newmes(username,title,main,ptime,uid) values(?,?,?,?,?)");
	        	stmt.setString(1, uname);
	        	stmt.setString(2, title);
	        	stmt.setString(3, main);
	        	stmt.setString(4, str);
	        	stmt.setInt(5, (Integer) session.getAttribute("uid"));
	        	stmt.executeUpdate();
	        	
	    	}catch(Exception e){
	    		e.printStackTrace();
	    	}
	    	out.println("<script>alert('发表成功');history.back();</script>");
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}

}
