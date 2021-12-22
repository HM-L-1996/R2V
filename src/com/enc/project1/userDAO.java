package com.enc.project1;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class userDAO {
	public int login(String id,String pw) {
		String sql = "select pw from user where id=?";
		Connection conn = null; 
		PreparedStatement pstmt = null; 
		ResultSet rs = null;
		try {
			conn = DBConn.getConnection(); 
			pstmt = conn.prepareStatement(sql); 
			pstmt.setString(1, id); 
			rs = pstmt.executeQuery(); 
			if (rs.next()) { 
				if(rs.getString(1).equals(pw)) {
					return 1; // 로그인 성공 
				} else { // 
					return 0; // 비밀번호 불일치 ---- 로그인 실패
				}
			}
			return -1; // id가 없음 ---- 로그인 실패
		} catch (Exception e) { 
			e.printStackTrace(); 
		} finally { 
			try {
				if(conn != null) conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			try {
				if(pstmt != null) pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			try {
				if(rs != null) rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return -2; //DB 관련 오류 (꺼져있거나 오류 발생) ---- 로그인 실패
	}
	
	public int join(userVO user) { // 회원가입 
		String sql = "insert into user values (null, ?, ?, ?, ?, ?, ?, ?, default)"; // 이메일체크 제외
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user.getId()); 
			pstmt.setString(2, user.getNickname());
			pstmt.setString(3, user.getPw());
			pstmt.setString(4, user.getUsername());
			pstmt.setString(5, user.getBirth());
			pstmt.setString(6, user.getEmail());
			pstmt.setInt(7, user.getInterest());
			return pstmt.executeUpdate();  //회원 가입 성공
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(conn != null) conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			try {
				if(pstmt != null) pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			try {
				if(rs != null) rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return -1; // 회원가입 실패
	}
	
	public int update(String id, String nickname, String pw, String username ,String birth, String email,int interest) { // 회원정보 수정하는 함수
		String sql = "update user set nickname = ?, pw = ?, username = ?, birth = ?, email = ?, interest = ? where id = ?"; 
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, nickname);
			pstmt.setString(2, pw);
			pstmt.setString(3, username);
			pstmt.setString(4, birth);
			pstmt.setString(5, email);
			pstmt.setInt(6, interest);
			pstmt.setString(7, id);
			return pstmt.executeUpdate(); // 수정 성공
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(conn != null) conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			try {
				if(pstmt != null) pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return -1; // 수정 실패
	}
	
	
	
		
	public userVO getUser(int usernum) { // usernum을 이용해 회원정보 가져오는 함수
		userVO user = new userVO();
		String sql = "select nickname from user where usernum = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, usernum);
			rs = pstmt.executeQuery(); 
			if (rs.next()) {
				user.setUsernum(usernum);
				user.setNickname(rs.getString("nickname"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(conn != null) conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			try {
				if(pstmt != null) pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			try {
				if(rs != null) rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return user;
	}
	
	public void deleteUser(String id) throws Exception { //user 삭제
		Connection conn = null;
		PreparedStatement pstmt = null; 
		String SQL = null;
		try {
			conn = DBConn.getConnection(); 
			SQL = "delete from user where id = ?";
			pstmt = conn.prepareStatement(SQL); 
			pstmt.setString(1, id); 
			pstmt.executeUpdate();
		} catch (Exception e) { 
			e.printStackTrace(); 
		} finally { // conn, pstmt, rs 자원 해제
			try {
				if(conn != null) conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			try {
				if(pstmt != null) pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	public String getNickname(String id) { // id를 이용해 회원정보 가져오는 함수
		userVO user = new userVO();
		String sql = "select nickname from user where id = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery(); 
			if (rs.next()) {
				user.setNickname(rs.getString("nickname"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(conn != null) conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			try {
				if(pstmt != null) pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			try {
				if(rs != null) rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return user.getNickname();
	}
	
	public int getDAOUsernum(String id) { // usernum을 이용해 회원정보 가져오는 함수
		userVO user = new userVO();
		String sql = "select usernum from user where id = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery(); 
			if (rs.next()) {
				user.setUsernum(rs.getInt(1));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(conn != null) conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			try {
				if(pstmt != null) pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			try {
				if(rs != null) rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return user.getUsernum();
	}

public userVO getUserInfo(int usernum) { // 을 이용해 회원정보 모두를 가져오는 함수
	userVO user = new userVO();
	String sql = "select * from user where usernum = ?";
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	try {
		conn = DBConn.getConnection();
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, usernum);
		rs = pstmt.executeQuery(); 
		if (rs.next()) {
			user.setUsernum(rs.getInt(1));
			user.setId(rs.getString(2));
			user.setNickname(rs.getString(3));
			user.setPw(rs.getString(4));
			user.setUsername(rs.getString(5));
			user.setBirth(rs.getString(6));
			user.setEmail(rs.getString(7));
		}
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		try {
			if(conn != null) conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		try {
			if(pstmt != null) pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		try {
			if(rs != null) rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	return user;
}
}
