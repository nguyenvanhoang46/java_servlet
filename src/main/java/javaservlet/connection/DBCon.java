package javaservlet.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import javax.swing.JOptionPane; 

public class DBCon {
//	private static Connection connection =null;
//	
//	public static Connection getConnection() throws ClassNotFoundException, SQLException {
//		if (connection==null) {
//			Class.forName("com.mysql.jdbc.Driver");
//			connection= DriverManager.getConnection("jdbc:mysql://localhost:3306/javaweb","root","");
//			System.out.print("connected");
//		}
//		return connection;
//	}
//	
private static Connection connection = null;
	public static Connection getConnection() throws ClassNotFoundException, SQLException{
		if(connection == null){
			Class.forName("com.mysql.jdbc.Driver");
			connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/javaweb","root","");
			System.out.print("connected");
		}
		return connection;
	}
	


}
