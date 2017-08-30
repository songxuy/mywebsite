package check;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class check extends HttpServlet {
	
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=gb2312");
		PrintWriter out =response.getWriter();
		String username=new String(request.getParameter("name").getBytes("ISO-8859-1"),"gb2312");
		String pwd=request.getParameter("password");
		String phone=request.getParameter("phone");
		String mail=request.getParameter("mail");
		java.sql.Connection conn=null;
    	PreparedStatement stmt=null;
    	try{
        	Class.forName("com.mysql.jdbc.Driver");
        	String url="jdbc:mysql://localhost:3306/song";
        	String user="root";
        	String password="song";
        	conn=DriverManager.getConnection(url, user, password);
        	System.out.println("成功连接数据库");
        	stmt=conn.prepareStatement("insert into newuser(username,pwd,phone,mail) values(?,?,?,?)");
        	stmt.setString(1, username);
        	stmt.setString(2, pwd);
        	stmt.setString(3, phone);
        	stmt.setString(4, mail);
        	stmt.executeUpdate();
        	out.println("<script>alert('注册成功！');location.href='load.jsp';</script>");
    	}catch(Exception e){
    		e.printStackTrace();
    	}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}

}
