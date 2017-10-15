package com.e_Look.memberBookmarks;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MemberBookmarksDAO_JDBC implements MemberBookmarksDAO_interface {
	String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
	String url = "jdbc:sqlserver://localhost:1433;DatabaseName=elook";
	String userid = "sa";
	//第一組密碼
	String passwd = "P@ssw0rd";
	//第二組密碼
	//String passwd = "123456";
	
	private static final String INSERT_MEMBERBOOKMARKS =
			"INSERT INTO MemberBookmarks (memberID, courseID) VALUES (?,?) ";
	//UPDATE寫著,但應該用不到
	private static final String UPDATE_MEMBERBOOKMARKS =
			"UPDATE MemberBookmarks SET courseID=? WHERE memberID=?";
	private static final String DELETE_MEMBERBOOKMARKS =
		    "DELETE FROM MemberBookmarks WHERE memberID =? and courseID =?";
	private static final String SELECT_ONE_MEMBERBOOKMARKS =
			"SELECT memberID, courseID FROM MemberBookmarks WHERE memberID=?";
	private static final String SELECT_ALL_MEMBERBOOKMARKS =
			"SELECT memberID, courseID FROM MemberBookmarks";
	
	
	@Override
	public void insert(MemberBookmarksVO memberBookmarksVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_MEMBERBOOKMARKS);
			pstmt.setInt(1, memberBookmarksVO.getCourseID());
			pstmt.executeUpdate();
			
			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
	}

	@Override
	public void update(MemberBookmarksVO memberBookmarksVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			//"UPDATE MemberBookmarks SET courseID=? WHERE memberID=?";
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE_MEMBERBOOKMARKS);
			pstmt.setInt(1, memberBookmarksVO.getCourseID());
			pstmt.setInt(2, memberBookmarksVO.getMemberID());
			pstmt.executeUpdate();
		
			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}

	}

	@Override
	public void delete(Integer memberID, Integer courseID) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			//"DELETE FROM MemberBookmarks WHERE memberID =? and courseID =?";
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt=con.prepareStatement(DELETE_MEMBERBOOKMARKS);
			pstmt.setInt(1, memberID);
			pstmt.setInt(2, courseID);
			pstmt.executeUpdate();
			
			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
	}

	@Override
	public List<MemberBookmarksVO> findByMemberID(Integer memberID) {
		List<MemberBookmarksVO> list = new ArrayList<MemberBookmarksVO>();
		MemberBookmarksVO memberBookmarksVO = null;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			//"SELECT memberID, courseID FROM MemberBookmarks WHERE memberID=?";
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(SELECT_ONE_MEMBERBOOKMARKS);

			pstmt.setInt(1, memberID);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				// memberSubscriptionVO 也稱為 Domain objects
				memberBookmarksVO = new MemberBookmarksVO();
				memberBookmarksVO.setMemberID(rs.getInt("memberID"));
				memberBookmarksVO.setCourseID(rs.getInt(""));
				list.add(memberBookmarksVO); // Store the row in the list
			}

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return list;
	}

	@Override
	public List<MemberBookmarksVO> getAll() {
		List<MemberBookmarksVO> list = new ArrayList<MemberBookmarksVO>();
		MemberBookmarksVO memberBookmarksVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			//"SELECT memberID, courseID FROM MemberBookmarks";
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(SELECT_ALL_MEMBERBOOKMARKS);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				// memberBookmarksVO 也稱為 Domain objects
				memberBookmarksVO = new MemberBookmarksVO();
				memberBookmarksVO.setMemberID(rs.getInt("memberID"));
				memberBookmarksVO.setCourseID(rs.getInt("courseID"));
				list.add(memberBookmarksVO); // Store the row in the list
			}

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return list;
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
