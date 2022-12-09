package jspbook.ch12;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class Bank2Bean {

	private int aid;
	private String aname;
	private int balance;
	
	Connection conn = null;
	java.sql.Statement stmt = null;
	PreparedStatement pstmt = null;
	
	public void connect() {
		
		try {
			Context initContext = new InitialContext();
			Context envContext = (Context)initContext.lookup("java:/comp/env");
			DataSource ds = (DataSource)envContext.lookup("jdbc/oracle");
			conn = ds.getConnection();
		} catch (Exception e) {
			System.out.println(e);
			e.printStackTrace();
		}
	}
	
	public void disconnect() {
		try {
			if (conn != null) {
				conn.close();
			}
		} catch (SQLException e) {
				System.out.println(e);
		}
		System.out.println("close");
	}
	
	public void getData() {
		connect();
		try {
			
			stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select * from bank2");
			rs.next();
			aid = rs.getInt("aid");
			aname = rs.getString("aname");
			balance = rs.getInt("balance");
			
		} catch (Exception e) {
			System.out.println(e);
			e.printStackTrace();
		} finally {
			disconnect();
		}
	}
	
	
	public int getAid() {
		return aid;
	}

	public String getAname() {
		return aname;
	}

	public int getBalance() {
		return balance;
	}
}
