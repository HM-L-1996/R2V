package com.enc.project1;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConn {
	
	public static Connection getConnection() throws ClassNotFoundException,SQLException {
		
	
		String jdbcDriver = "com.mysql.jdbc.Driver";
		String jdbcUrl = "jdbc:mysql://localhost:3306/project1?serverTimezone=UTC";
		String dbUser = "root";
		String dbPwd = "1234";
		Class.forName("com.mysql.cj.jdbc.Driver");
		return DriverManager.getConnection(jdbcUrl,dbUser,dbPwd);

	}
	
	
	
}
