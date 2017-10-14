package com.e_Look.search;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class SearchDAO implements SearchDAO_interface {
	String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
	String url = "jdbc:sqlserver://localhost:1433;DatabaseName=elook";
	String userid = "sa";
	//第一組密碼
	String passwd = "P@ssw0rd";
	//第二組密碼
	//String passwd = "123456";
	
	private static final String INSERT_SEARCH =
			"INSERT INTO Search (keyWord, countWord, time) VALUES (?,?,?) ";
	private static final String SELECT_COUNTWORD =
			"SELECT TOP 5 FROM Search ORDER BY time";
	private static final String SELECT_ALL_KEYWORD = 
			"SELECT * FROM Search WHERE keyWord =?";
	
	
	@Override
	public void insertKeyword(SearchVO searchVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_SEARCH);
			pstmt.setString(1, searchVO.getKeyWord());
			pstmt.setString(2, searchVO.getCountWord());
			pstmt.setDate(3, searchVO.getTime());
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
	public List<SearchVO> getCountWord() {
		List<SearchVO> list = new ArrayList<SearchVO>();
		SearchVO searchVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			//"SELECT TOP 5 FROM Search ORDER BY time";
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(SELECT_COUNTWORD);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				// searchVO 也稱為 Domain objects
				searchVO = new SearchVO();
				searchVO.setCountWord(rs.getString("countWord"));

				list.add(searchVO); // Store the row in the list
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
	public SearchVO findByKeyWord(String keyWord) {
		SearchVO searchVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			//"SELECT * FROM Search WHERE keyWord =?";
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(SELECT_ALL_KEYWORD);
			pstmt.setString(1, keyWord);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				// searchVO 也稱為 Domain objects
				searchVO = new SearchVO();
				searchVO.setKeyWord(rs.getString("keyWord"));
				searchVO.setCountWord(rs.getString("countWord"));
				searchVO.setTime(rs.getDate("time"));

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
		return searchVO;
	}
}
