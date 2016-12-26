package com.util;

import java.sql.Connection;
import java.sql.DriverManager;

// Singleton pattern
public class DBConn {
	private static Connection conn=null;
	
	private DBConn() {
	}
	// prepared statement�� �ݺ��۾��Ҷ��� ��� �ӵ��� �� ������
	public static Connection getConnection() {
		String url = "jdbc:oracle:thin:@127.0.0.1:1521:XE"; 
		// ����Ŭ �ּ� �� ���� /  1521:����Ŭ�� �⺻��Ʈ��ȣ
		String user = "blue";
		String pwd="java$!";
		if(conn==null) {
			try {
				Class.forName("oracle.jdbc.driver.OracleDriver"); // ����̹� �ε�
				conn = DriverManager.getConnection(url, user,pwd);
				
			} catch (Exception e) {
				// TODO: handle exception
				System.out.println(e.toString());
			}
		}
		return conn;
	}
	public static void close() { // ���� ����
		if(conn!=null) {
			try {
				if(!conn.isClosed())
					conn.close();
			} catch (Exception e) {
				// TODO: handle exception
			}
		}
		conn=null;
	}
}
