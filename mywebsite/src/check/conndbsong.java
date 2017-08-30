package check;

import java.sql.*;

public class conndbsong {
	java.sql.Connection conn=null;
	Statement stmt=null;
	ResultSet rst=null;
	PreparedStatement prt=null;
	public Connection connec() throws ClassNotFoundException, SQLException{
		try{
		Class.forName("com.mysql.jdbc.Driver");
		}catch(Exception e){
    		e.printStackTrace();
    	}
    	String url="jdbc:mysql://localhost:3306/song";
    	String user="root";
    	String password="song";
    	conn=DriverManager.getConnection(url, user, password);
    	System.out.println("成功连接数据库");
    	return conn;
    	
	}
	public void close() throws SQLException{
		if(prt!=null){
			prt.close();
		}
		if(rst!=null){
			rst.close();
		}
		if(stmt!=null){
			stmt.close();
		}
		if(conn!=null){
			conn.close();
		}
	}
}
