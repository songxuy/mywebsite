package check;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ckload extends HttpServlet {
	
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=gb2312");
		PrintWriter out=response.getWriter();
		String username=new String(request.getParameter("name").getBytes("ISO-8859-1"),"gb2312");
		String pwd=request.getParameter("pwd");
		HttpSession session=request.getSession();
		java.sql.Connection conn=null;
  	   ResultSet rst=null;
  	   PreparedStatement prt=null;
  	 ResultSet flag=null;
    	try{
        	Class.forName("com.mysql.jdbc.Driver");
        	String url="jdbc:mysql://localhost:3306/song";
        	String user="root";
        	String password="song";
        	conn=DriverManager.getConnection(url, user, password);
        	System.out.println("成功连接数据库");
        	prt=conn.prepareStatement("select * from newuser where username=? and pwd=?");
 			prt.setString(1, username);
 			prt.setString(2, pwd);
 			flag=prt.executeQuery();
 			if(flag.next()){
         			int id=flag.getInt("id");
         			session.setAttribute("uid", id);
         			session.setAttribute("name", username);
         			out.println("<script>alert('登陆成功！');location.href='main.jsp';</script>");
         			
 			}else{
         			
 				out.println("<script>alert('验证失败！');location.href='load.jsp';</script>");
         		}
         			
         		
    	}catch(Exception e){
    		e.printStackTrace();
    	}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}

}
