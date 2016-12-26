package com.util;

import java.sql.Connection;
import java.sql.DriverManager;

// Singleton pattern
public class DBConn {
	private static Connection conn=null;
	
	private DBConn() {
	}
	// prepared statement는 반복작업할때의 경우 속도가 더 빠르다
	public static Connection getConnection() {
		String url = "jdbc:oracle:thin:@127.0.0.1:1521:XE"; 
		// 오라클 주소 및 버전 /  1521:오라클의 기본포트번호
		String user = "blue";
		String pwd="java$!";
		if(conn==null) {
			try {
				Class.forName("oracle.jdbc.driver.OracleDriver"); // 드라이버 로딩
				conn = DriverManager.getConnection(url, user,pwd);
				
			} catch (Exception e) {
				// TODO: handle exception
				System.out.println(e.toString());
			}
		}
		return conn;
	}
	public static void close() { // 접속 종료
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
