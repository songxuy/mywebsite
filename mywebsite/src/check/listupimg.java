package check;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jspsmart.upload.SmartFile;
import com.jspsmart.upload.SmartUpload;
import com.jspsmart.upload.SmartUploadException;

import check.conndbsong;


public class listupimg extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 request.setCharacterEncoding("utf-8");//设置字符
		         response.setContentType("text/html;charset=utf-8");
		         request.setCharacterEncoding("utf-8");
		       PrintWriter out =response.getWriter();//获取out输出对象
		       HttpSession session=request.getSession();
		       conndbsong song=new conndbsong();
		       ResultSet rst=null;
			   PreparedStatement prt=null;
			   SimpleDateFormat f=new SimpleDateFormat("yyyy/MM/dd HH:mm");
				 String str=f.format(new Date());
		          // 准备上传目录
		          String path = this.getServletContext().getRealPath("images");
		          File fpath = new File(path);
		          if(!fpath.exists()){
		             fpath.mkdir();
		         }
		         
		         // 实例化组件
		         SmartUpload su = new SmartUpload("utf-8");
		         // 初始化组件
		         su.initialize(this.getServletConfig(), request, response);
		         
		         try {
		             // 限定
		             su.setAllowedFilesList("jpg,png,gif,jpeg");
		             su.setMaxFileSize(1000*1024); // 不能超过1000K
		             
		             // 上传并提取文件
		             su.upload();
		             SmartFile file = su.getFiles().getFile(0);
		             // 生成文件名
		             String fname = new Date().getTime()+"."+file.getFileExt();
		             session.setAttribute("imgpath", path);
		             // 保存文件
		             file.saveAs(path+"/"+fname);
		             System.out.println(path+"/"+fname);
		             //file.saveAs(path+"/"+fname,1);
		             // 提示
		             out.println("<script>alert('文件上传成功！');location.href='imglist.jsp';</script>");
		             
		             // 提取字段信息
		             String username =(String) session.getAttribute("name");
		             System.out.println(">>> " + username);
		             // 进行数据库操作
		             Connection conn=song.connec();
		             prt=conn.prepareStatement("insert into newimg(username,imgname,ptime,uid) values(?,?,?,?)");
		 			prt.setString(1,username);
		 			prt.setString(2, fname);
		 			prt.setString(3, str);
		 			prt.setInt(4,  (Integer)session.getAttribute("uid"));
		 			prt.executeUpdate();
		             
		         } catch(SecurityException e){
		             out.println("<script>alert('只能上传jpg、png、gif、jpeg的文件并且不能超过1000K！');history.back();</script>");
		             e.printStackTrace();
		         }
		         catch (SmartUploadException e) {
		             // TODO Auto-generated catch block
		             out.println("<script>alert('文件上传失败！');history.back();</script>");
		             e.printStackTrace();
		         } catch (ClassNotFoundException e) {
					e.printStackTrace();
				} catch (SQLException e) {
					e.printStackTrace();
				}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}

}
