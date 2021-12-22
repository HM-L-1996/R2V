package com.enc.project1;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
public class noticeDAO {

	public int write(noticeVO noticeVO) { // 글 작성
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "insert into notice values (null, ?, ?, default, 0);"; 
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(sql); 
		
			pstmt.setString(1, noticeVO.getNotice_title());
			pstmt.setString(2, noticeVO.getNotice_article());  
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
	

	public ArrayList<noticeVO> getList (String searchType, String search, int pageNumber) {
		ArrayList<noticeVO> noticeList = null; // 리뷰리스트 생성
		String sql = "";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
	
		try {
			
			if(searchType.equals("제목")) { 
				sql = "select * from notice where notice_title like ? order by notice_date desc limit " + (pageNumber-1) * 10  + ", " + (pageNumber-1) * 10 + 10;
			} else if (searchType.equals("내용")) { 
				sql = "select * from notice where notice_article like ? order by notice_date desc limit " + (pageNumber-1) * 10   + ", " + (pageNumber-1) * 10 + 10;
			}
			
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + search + "%");
			rs = pstmt.executeQuery();
			noticeList = new ArrayList<noticeVO>();
			while (rs.next()) {
				noticeVO notice = new noticeVO(
					rs.getInt(1), 
					rs.getString(2),
					rs.getString(3),
					rs.getString(4),
					rs.getInt(5)
				);
				noticeList.add(notice);
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
		return noticeList;
	}
	public int watch(int notice_num) { // 리뷰에 공감 적용하는 함수
		String sql = "update notice set notice_watch = notice_watch + 1 where notice_num = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, notice_num);
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
	
	public int delete(int notice_num) {
		String sql = "delete from notice where notice_num = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, notice_num);
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
	public int update(int notice_num,String notice_title, String notice_article) {
		String sql = "update notice set notice_title = ?, notice_article = ? where notice_num = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, notice_title);
			pstmt.setString(2, notice_article);
			pstmt.setInt(3, notice_num);
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
	// 임시 추가 리뷰 내용 가져오는 함수 
		public String getnoticeContent(int notice_num) { 
			String sql = "select notice_article from notice where notice_num = ?";
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			try {
				conn = DBConn.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, notice_num);
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
		// 임시 추가 카운트 불러옴
		public int getnoticeCount(String searchType, String search) {
			String sql="";
			if(searchType.equals("제목")) { 
				sql = "select count(notice_num) from notice where notice_title like ? ";
			} else if (searchType.equals("내용")) { 
				sql = "select count(notice_num) from notice where notice_article like ? ";
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
		public String getnotice_title(int notice_num) { 
			String sql = "select notice_title from notice where notice_num = ?";
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			try {
				conn = DBConn.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, notice_num);
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
	
		
}
