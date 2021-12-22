package com.enc.project1;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
public class freeDAO {

	public int write(freeVO freeVO) { // 글 작성
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "insert into free values (null, ?,?, ?, default, 0);"; 
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(sql); 
			pstmt.setInt(1, freeVO.getUsernum());
			pstmt.setString(2, freeVO.getFree_title());
			pstmt.setString(3, freeVO.getFree_article());  
			return pstmt.executeUpdate();
		} catch (Exception e) { // 예외 발생하면
			e.printStackTrace(); // 오류 출력
		} finally {
			try {
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			try {
				if (pstmt != null)
					pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			try {
				if (rs != null)
					rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return -1; // DB 꺼져있거나 오류
	}
	

	public ArrayList<freeVO> getList (String searchType, String search, int pageNumber) {
		ArrayList<freeVO> freeList = null; // 리뷰리스트 생성
		String sql = "";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
	
		try {
			
			if(searchType.equals("제목")) { 
				sql = "select * from free where free_title like ? order by free_date desc limit " + (pageNumber-1) * 10   + ", " + (pageNumber-1) * 10 + 10;
			} else if (searchType.equals("내용")) { 
				sql = "select * from free where free_article like ? order by free_date desc limit " + (pageNumber-1) * 10   + ", " + (pageNumber-1) * 10 + 10;
			}
			
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + search + "%");
			rs = pstmt.executeQuery();
			freeList = new ArrayList<freeVO>();
			while (rs.next()) {
				freeVO free = new freeVO(
					rs.getInt(1),
					rs.getInt(2),
					rs.getString(3),
					rs.getString(4),
					rs.getString(5),
					rs.getInt(6)
				);
				freeList.add(free);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			try {
				if (pstmt != null)
					pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			try {
				if (rs != null)
					rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return freeList;
	}
	public int watch(int free_num) { // 리뷰에 공감 적용하는 함수
		String sql = "update free set free_watch = free_watch + 1 where free_num = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, free_num);
            return pstmt.executeUpdate(); // 조회수 + 1
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
		return -1; // DB 오류
	}
	
	public int delete(int free_num) {
		String sql = "delete from free where free_num = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, free_num);
            return pstmt.executeUpdate();
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
		return -1; // DB 오류
	}
	public String getuserNickname(int usernum) { 
		String SQL = "select nickname from user where usernum = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, usernum);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getString(1); // 닉네임
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
		return null; // 아이디 존재X
	}
	
	public int getFreeCount(String searchType, String search) {
		String sql="";
		if(searchType.equals("제목")) { 
			sql = "select count(free_num) from free where free_title like ? ";
		} else if (searchType.equals("내용")) { 
			sql = "select count(free_num) from free where free_article like ? ";
		}
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + search + "%");
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1); 					
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
		return -1; 
	
	}
	public String getFree_title(int free_num) { 
		String sql = "select free_title from free where free_num = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, free_num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getString(1); // 제목
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
		return null; 
	}
	public String getfreeContent(int free_num) { 
		String sql = "select free_article from free where free_num = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, free_num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getString(1);
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
		return null; 
	}	
	public int update(int free_num,String free_title, String free_article) {
		String sql = "update free set free_title = ?, free_article = ? where free_num = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, free_title);
			pstmt.setString(2, free_article);
			pstmt.setInt(3, free_num);
            return pstmt.executeUpdate();
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
		return -1; // DB 오류
	}
}
