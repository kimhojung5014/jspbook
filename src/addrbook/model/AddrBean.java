package addrbook.model;

import java.sql.*;
import java.util.ArrayList;


public class AddrBean {
	Connection conn = null;
	PreparedStatement pstmt = null;
	String jdbc_driver = "oracle.jdbc.driver.OracleDriver";
	String jdbc_url = "jdbc:oracle:thin:@localhost:1521:xe";
	
	public void connect() {
		try {
			//드라이버 로드
			Class.forName(jdbc_driver);
			//데이터베이스 연결 정보를 이용해 Connection 인스턴스 확보
			conn = DriverManager.getConnection(jdbc_url,"scott","tiger");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void disconnect() {
		if (pstmt != null) {
			try {
				pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		if (conn != null) {
			try {
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
	}
	
	public boolean insertDB(AddrBook addrBook) {
		connect();
		
		String sql = "INSERT into addrbook(ab_id,ab_name,ab_email,ab_tel,ab_birth,ab_comdept,ab_memo) values(ADDR_SEQ.nextval,?,?,?,?,?,?)";
		try {
				pstmt = conn.prepareStatement(sql);				
				pstmt.setString(1, addrBook.getAb_name());
				pstmt.setString(2, addrBook.getAb_email());
				pstmt.setString(3, addrBook.getAb_tel());
				pstmt.setString(4, addrBook.getAb_birth());
				pstmt.setString(5, addrBook.getAb_comdept());
				pstmt.setString(6, addrBook.getAb_memo());
				pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
				return false;
			}
			finally {
				disconnect();
			}
			return true;
	}
	
	public boolean updateDB(AddrBook addrBook) {
		connect();
		
		String sql = "update addrbook set ab_name=?,ab_email=?,ab_tel=?,ab_birth=?,ab_comdept=?,ab_memo=? where ab_id=?";
					
		try {
			pstmt = conn.prepareStatement(sql);				
			pstmt.setString(1, addrBook.getAb_name());
			pstmt.setString(2, addrBook.getAb_email());
			pstmt.setString(3, addrBook.getAb_tel());
			pstmt.setString(4, addrBook.getAb_birth());
			pstmt.setString(5, addrBook.getAb_comdept());
			pstmt.setString(6, addrBook.getAb_memo());
			pstmt.setInt(7, addrBook.getAb_id());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			disconnect();
		}
		return true;
	}
	
	public boolean deleteDB(int gb_id) {
		connect();
		String sql = "delete from addrbook where ab_id=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, gb_id);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			disconnect();
		}
		return true;
	}
	
	public AddrBook getDb(int gb_id) {
		connect();
		String sql = "select * from addrbook where ab_id=?";
		AddrBook addrbook = new AddrBook();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, gb_id);
			ResultSet rs = pstmt.executeQuery();
			
			rs.next();
			addrbook.setAb_id(rs.getInt("ab_id"));
			addrbook.setAb_name(rs.getString("ab_name"));
			addrbook.setAb_email(rs.getString("ab_email"));
			addrbook.setAb_tel(rs.getString("ab_tel"));
			addrbook.setAb_birth(rs.getString("ab_birth"));
			addrbook.setAb_comdept(rs.getString("ab_comdept"));
			addrbook.setAb_memo(rs.getString("ab_memo"));
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			disconnect();
		}
		return addrbook;
	}
	
	public ArrayList<AddrBook> getDBList() {
		connect();
		ArrayList<AddrBook> datas = new ArrayList<AddrBook>();
		
		String sql = "select * from addrbook order by ab_id desc";
		
		try {
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				AddrBook addrbook = new AddrBook();
				
				addrbook.setAb_id(rs.getInt("ab_id"));
				addrbook.setAb_name(rs.getString("ab_name"));
				addrbook.setAb_email(rs.getString("ab_email"));
				addrbook.setAb_tel(rs.getString("ab_tel"));
				addrbook.setAb_birth(rs.getString("ab_birth"));
				addrbook.setAb_comdept(rs.getString("ab_comdept"));
				addrbook.setAb_memo(rs.getString("ab_memo"));
				datas.add(addrbook);				
			}
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			disconnect();
		}
		return datas;
	}
}
