package check;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class deleimg extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");//ÉèÖÃ×Ö·û
        response.setContentType("text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");
        String path = this.getServletContext().getRealPath("images");
      PrintWriter out =response.getWriter();
      conndbsong song=new conndbsong();
	   PreparedStatement prt=null;
      String[] imgname=request.getParameterValues("check");
      for(int i=0 ;i<imgname.length;i++){
    	  File limg=new File(path+'/'+imgname[i]);
    	  if(limg.exists()){
	        	 limg.delete();
	         } 
		try {
			Connection	conn = song.connec();
			prt=conn.prepareStatement("delete from newimg where imgname=?");
			prt.setString(1,imgname[i]);
			prt.executeUpdate();
			out.println("<script>alert('É¾³ý³É¹¦£¡');location.href='imglist.jsp';</script>");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
      }
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}

}
