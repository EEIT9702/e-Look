package com.e_Look.ad;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

public class AdDAO_JDBC implements AdDAO_interface {
	String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
	String url = "jdbc:sqlserver://localhost:1433;DatabaseName=AVATAR";
	String userid = "sa";
	//第一組密碼
	String passwd = "P@ssw0rd";
	//第二組密碼
	//String passwd = "123456";
	
	private static final String INSERT_Ad =
			"INSERT INTO Ad (fileName, adFile, status) VALUES (?,?,?) ";
	private static final String UPDATE_Ad =
			"UPDATE Ad SET fileName=?, adFile=?, status=? WHERE adID=?";
	private static final String UPDATE_STATUS =
		    "UPDATE Ad SET status=? WHERE adID=?";
	private static final String DELETE_Ad =
		    "DELETE FROM Ad WHERE adID =?";
	private static final String SELECT_ONE_Ad =
			"SELECT adID, fileName, adFile, status FROM Ad WHERE adID=?";
	private static final String SELECT_ALL_Ad =
			"SELECT adID, fileName, adFile, status FROM Ad";
	
	@Override
	public void insert(AdVO adVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_Ad);
			pstmt.setString(1, adVO.getFileName());
			pstmt.setBlob(2, adVO.getAdFile());
			pstmt.setByte(3, adVO.getStatus());

			pstmt.executeUpdate();
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "+ e.getMessage());
		} catch (SQLException e) {
			throw new RuntimeException("A database error occured. "
					+ e.getMessage());
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
	public void update(AdVO adVO) {
		// TODO Auto-generated method stub

	}

	@Override
	public void delete(AdVO adVO) {
		// TODO Auto-generated method stub

	}

	@Override
	public AdVO findByAdID(Integer adID) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<AdVO> getAll() {
		// TODO Auto-generated method stub
		return null;
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
