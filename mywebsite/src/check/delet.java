package check;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class delet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=gb2312");
		PrintWriter out =response.getWriter();
		HttpSession session=request.getSession();
		String i= new String(request.getParameter("main").getBytes("ISO-8859-1"),"gb2312");
		String ur="http://localhost:8080/project/lmsg.jsp";
		java.sql.Connection conn=null;
    	PreparedStatement stmt=null;
    	try{
        	Class.forName("com.mysql.jdbc.Driver");
        	String url="jdbc:mysql://localhost:3306/song";
        	String user="root";
        	String password="song";
        	conn=DriverManager.getConnection(url, user, password);
        	System.out.println("成功连接数据库");
        	stmt=conn.prepareStatement("delete from newmes where main=? ");
        	stmt.setString(1, i);
        	stmt.executeUpdate();
        	out.println("<script>alert('日志删除成功！');location.href='lmsg.jsp';</script>");

        	
    	}catch(Exception e){
    		e.printStackTrace();
    	}
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}

}
