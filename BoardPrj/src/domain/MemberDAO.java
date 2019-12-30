package domain;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import domain.MemberVO;

public class MemberDAO {
	static {
		try {
			DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
			System.out.println("드라이버 로드 성공");
		}catch (SQLException e) {
			System.out.println(e.getMessage());
		}
	}
	
	private Connection getConnection() {
		DataSource ds = null;
		Connection con = null;
		try {
			Context ctx = new InitialContext();
			ds = (DataSource)ctx.lookup("java:comp/env/jdbc/Oracle");
			con = ds.getConnection();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return con;
	}
	
	private void closeConnection (Connection con) {
		if(con!=null) {
			try {
				con.close();
			}catch(Exception e) {}
		}
	}
	
	public void insert (MemberVO member) {
		Connection con = null;
		try {
			con = getConnection();
			String sql = "insert into member values(?,?,?,?,?)";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, member.getUserid());
			pstmt.setString(2, member.getName());
			pstmt.setString(3, member.getPassword());
			pstmt.setString(4, member.getEmail());
			pstmt.setString(5, member.getAddress());
			pstmt.executeQuery();
		}catch(Exception e) {
			throw new RuntimeException("MemberDAO.insert() :" + e.getMessage());
		}finally {
			closeConnection(con);
		}
	}
	
	public MemberVO selectMember(String userid) {
		Connection con = null;
		MemberVO member = new MemberVO();
		try {
			con = getConnection();
			String sql = "select * from member where userid=?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userid);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
			member.setUserid(userid);
			member.setPassword(rs.getString("password"));
			member.setName(rs.getString("name"));
			member.setEmail(rs.getString("email"));
			member.setAddress(rs.getString("address"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
			throw new RuntimeException("MemberDAO.selectMember() : "+e.getMessage());
		}finally {
			closeConnection(con);
		}
		return member;
	}
	
	public void updateMember(MemberVO member) {
		Connection con = null;
		try {
			con = getConnection();
			String sql = "update member set email=?, address=?, name=?,"
					+ " password=? where userid=?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, member.getEmail());
			pstmt.setString(2, member.getAddress());
			pstmt.setString(3, member.getName());
			pstmt.setString(4, member.getPassword());
			pstmt.setString(5, member.getUserid());
			pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
			throw new RuntimeException("MemberDAO.updateMember() : "+e.getMessage());
		}finally {
			closeConnection(con);
		}
	}
	
	public String getPassword(String userid) {
		String pw = "";
		Connection con = null;
		try {
			con = getConnection();
			String sql = "select password from member where userid=?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userid);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				pw = rs.getString("password");
			}else {
				throw new RuntimeException("아이디가 존재하지 않습니다");
			}
		}catch(Exception e) {
			throw new RuntimeException("MemberDAO.getPassword : " + e.getMessage());
		}finally {
			closeConnection(con);
		}
		return pw;
	}
	
	public void deleteMember(String userid, String password) {
		Connection con=null;
		String pw = "";
		try {
			con = getConnection();
			con.setAutoCommit(false);
			String sql = "select password from member where userid=?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userid);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				pw = rs.getString("password");
			}else {
				throw new RuntimeException("아이디가 존재하지 않습니다");
			}
		if(pw.equals(password)) {
			try {
			String sql2 = "delete from board b where name=(select name from member where userid=?)";	
			pstmt = con.prepareStatement(sql2);
			pstmt.setString(1, userid);
			pstmt.executeQuery();
			
			String sql3 = "delete from member where userid=?";
			pstmt = con.prepareStatement(sql3);
			pstmt.setString(1, userid);
			pstmt.executeQuery();
			con.commit();
			}catch(Exception e) {
				throw new RuntimeException("삭제가 되지 않았습니다");
			}
		}else {
			throw new RuntimeException("삭제 : (비밀번호가 다릅니다)");
		}
		}catch(Exception e) {
			throw new RuntimeException("MemberDAO.getPassword : " + e.getMessage());
		}finally {
			closeConnection(con);
		}
	}
}
