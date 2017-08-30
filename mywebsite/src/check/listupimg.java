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
		 request.setCharacterEncoding("utf-8");//�����ַ�
		         response.setContentType("text/html;charset=utf-8");
		         request.setCharacterEncoding("utf-8");
		       PrintWriter out =response.getWriter();//��ȡout�������
		       HttpSession session=request.getSession();
		       conndbsong song=new conndbsong();
		       ResultSet rst=null;
			   PreparedStatement prt=null;
			   SimpleDateFormat f=new SimpleDateFormat("yyyy/MM/dd HH:mm");
				 String str=f.format(new Date());
		          // ׼���ϴ�Ŀ¼
		          String path = this.getServletContext().getRealPath("images");
		          File fpath = new File(path);
		          if(!fpath.exists()){
		             fpath.mkdir();
		         }
		         
		         // ʵ�������
		         SmartUpload su = new SmartUpload("utf-8");
		         // ��ʼ�����
		         su.initialize(this.getServletConfig(), request, response);
		         
		         try {
		             // �޶�
		             su.setAllowedFilesList("jpg,png,gif,jpeg");
		             su.setMaxFileSize(1000*1024); // ���ܳ���1000K
		             
		             // �ϴ�����ȡ�ļ�
		             su.upload();
		             SmartFile file = su.getFiles().getFile(0);
		             // �����ļ���
		             String fname = new Date().getTime()+"."+file.getFileExt();
		             session.setAttribute("imgpath", path);
		             // �����ļ�
		             file.saveAs(path+"/"+fname);
		             System.out.println(path+"/"+fname);
		             //file.saveAs(path+"/"+fname,1);
		             // ��ʾ
		             out.println("<script>alert('�ļ��ϴ��ɹ���');location.href='imglist.jsp';</script>");
		             
		             // ��ȡ�ֶ���Ϣ
		             String username =(String) session.getAttribute("name");
		             System.out.println(">>> " + username);
		             // �������ݿ����
		             Connection conn=song.connec();
		             prt=conn.prepareStatement("insert into newimg(username,imgname,ptime,uid) values(?,?,?,?)");
		 			prt.setString(1,username);
		 			prt.setString(2, fname);
		 			prt.setString(3, str);
		 			prt.setInt(4,  (Integer)session.getAttribute("uid"));
		 			prt.executeUpdate();
		             
		         } catch(SecurityException e){
		             out.println("<script>alert('ֻ���ϴ�jpg��png��gif��jpeg���ļ����Ҳ��ܳ���1000K��');history.back();</script>");
		             e.printStackTrace();
		         }
		         catch (SmartUploadException e) {
		             // TODO Auto-generated catch block
		             out.println("<script>alert('�ļ��ϴ�ʧ�ܣ�');history.back();</script>");
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
