package com.enc.project1;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
public class reviewDAO {

	public int write(reviewVO reviewVO) { // 글 작성
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "insert into review values (null, ?,?, ?, default, 0);"; 
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(sql); 
			pstmt.setInt(1, reviewVO.getUsernum());
			pstmt.setInt(2, reviewVO.getLearn_num());
			pstmt.setString(3, reviewVO.getReview_article());  
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
	

	public ArrayList<reviewVO> getList (String searchType, String search, int pageNumber) {
		ArrayList<reviewVO> reviewList = null; // 리뷰리스트 생성
		String sql = "";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
	
		try {
			conn = DBConn.getConnection();
			if(searchType.equals("강좌 제목")) { 				
				sql = "select * from review where learn_num in ( select learn_num from learn where learn_title like ?) order by review_date desc limit " + (pageNumber-1) * 10   + ", " + (pageNumber-1) * 10 + 10;
			} else if (searchType.equals("리뷰 내용")) { 
				sql = "select * from review where review_article like ? order by review_date desc limit " + (pageNumber-1) * 10   + ", " + (pageNumber-1) * 10 + 10;
			}
			
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + search + "%");
			rs = pstmt.executeQuery();
			reviewList = new ArrayList<reviewVO>();
			while (rs.next()) {
				reviewVO review = new reviewVO(
					rs.getInt(1),
					rs.getInt(2),
					rs.getInt(3),
					rs.getString(4),
					rs.getString(5),
					rs.getInt(6)
				);
				reviewList.add(review);
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
		return reviewList;
	}
	public int watch(int review_num) { // 리뷰에 조회수 적용하는 함수
		String sql = "update review set review_watch = review_watch + 1 where review_num = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, review_num);
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
	
	public int delete(int review_num) {
		String sql = "delete from review where review_num = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, review_num);
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
	
	// 리뷰 수정을 위한 업데이트 구문 작성
	public int update(int review_num, String review_article) {
		String sql = "update review set review_article = ? where review_num = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, review_article);
			pstmt.setInt(2, review_num);
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
		return null;
	}
	
	public String getlearn_title(int learn_num) { 
		String sql = "select learn_title from learn where learn_num = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, learn_num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getString(1); // 강의제목
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
	
	// 임시 추가 카운트 불러옴
	public int getreviewCount() { 
		String sql = "select count(review_num) from review";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			if (rs.next()) {
			
				if((rs.getInt(1) / 10) == 0) { return (rs.getInt(1) / 10); }
				else { return ((rs.getInt(1) / 10) + 1); }
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
	
	// 임시 추가 리뷰 내용 가져오는 함수 
	public String getreviewContent(int Review_num) { 
		String sql = "select review_article from review where review_num = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Review_num);
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
	
	// 임시 추가 리뷰 글쓰기용 모든 강좌 목록 불러오는 함수
	public ArrayList<learnVO> getAllLearnTitle() { 
		ArrayList<learnVO> LearnTitlelist = null; // 강좌 제목 리스트 생성
		String sql = "select * from learn";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(sql);
	
			rs = pstmt.executeQuery();
			LearnTitlelist = new ArrayList<learnVO>();
			while (rs.next()) {
				learnVO learn = new learnVO(
						rs.getInt(1), 
						rs.getString(2),
						rs.getString(3),
						rs.getString(4),
						rs.getString(5),
						rs.getInt(6),
						rs.getInt(7)
					);
					
				LearnTitlelist.add(learn);
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
		return LearnTitlelist; 
	}
	
}

