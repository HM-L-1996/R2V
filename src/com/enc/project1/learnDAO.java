package com.enc.project1;

import java.sql.*;

import java.util.ArrayList;

public class learnDAO {
	
	
	public ArrayList<learnVO> getList (String searchType, String search, int pageNumber, String sortType) {
	
		ArrayList<learnVO> learnList = null; // 리뷰리스트 생성
		String sql = "";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
	
		try {
			if(sortType.equals("최신순")) {
				if(searchType.equals("강의 제목")) { 
					sql = "select * from learn where learn_title like ? order by learn_num limit "+ (pageNumber-1) * 24   + ", " + (pageNumber-1) * 24 + 24;
				} else if (searchType.equals("강사")) { 
					sql = "select * from learn where learn_teacher like ? order by learn_num limit " + (pageNumber-1) * 24   + ", " + (pageNumber-1) * 24 + 24;
				}
			}
			else if(sortType.equals("가격 낮은순")) {
				if(searchType.equals("강의 제목")) { 
					sql = "select * from learn where learn_title like ? order by price limit "+ (pageNumber-1) * 24   + ", " + (pageNumber-1) * 24 + 24;
				} else if (searchType.equals("강사")) { 
					sql = "select * from learn where learn_teacher like ? order by price limit " + (pageNumber-1) * 24   + ", " + (pageNumber-1) * 24 + 24;
				}
			}
			else if(sortType.equals("가격 높은순")) {
				if(searchType.equals("강의 제목")) { 
					sql = "select * from learn where learn_title like ? order by price desc limit "+ (pageNumber-1) * 24   + ", " + (pageNumber-1) * 24 + 24;
				} else if (searchType.equals("강사")) { 
					sql = "select * from learn where learn_teacher like ? order by price desc limit " + (pageNumber-1) * 24   + ", " + (pageNumber-1) * 24 + 24;
				}
			}
			else {
				if(searchType.equals("강의 제목")) { 
					sql = "select * from learn where learn_title like ? order by learn_title limit "+ (pageNumber-1) * 24   + ", " + (pageNumber-1) * 24 + 24;
				} else if (searchType.equals("강사")) { 
					sql = "select * from learn where learn_teacher like ? order by learn_title limit " + (pageNumber-1) * 24   + ", " + (pageNumber-1) * 24 + 24;
				}
			}
			
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + search + "%");
			rs = pstmt.executeQuery();
			learnList = new ArrayList<learnVO>();
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
				
				learnList.add(learn);
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
		return learnList;
		
	}
	
	public int getlearn_num(String learn_title) { 
		String sql = "select learn_num from learn where learn_title = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		ResultSet rs = null;
		try {
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + learn_title + "%");
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1); // 강의제목
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
	// 임시 추가 카운트 불러옴
		public int getlearnCount(String searchType, String search) {
			String sql="";
			if(searchType.equals("강의 제목")) { 
				sql = "select count(learn_num) from learn where learn_title like ? ";
			} else if (searchType.equals("강사")) { 
				sql = "select count(learn_num) from learn where learn_teacher like ? ";
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
		
}
