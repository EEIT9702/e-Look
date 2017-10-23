package com.e_Look.ReportCourse.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.e_Look.message.model.MessageVO;

public class ReportCourseDAO_JDBC implements ReportCourseDAO_interface {
	String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
	String url = "jdbc:sqlserver://localhost:1433;DatabaseName=elook";
	String userid = "sa";
	//第一組密碼
	String passwd = "P@ssw0rd";
	//第二組密碼
	//String passwd = "123456";
	
	private static final String INSERT_REPORTCOURSE =
			"INSERT INTO ReportCourse (reportCourseID, reportMemberID, reportContent, reportTime,status ) VALUES (?,?,?,getDate(),0)";
	private static final String UPDATE_STATUS =
		    "UPDATE ReportCourse SET status=? WHERE reportId=?";	
	private static final String DELETE_REPORTCOURSE =
		    "DELETE FROM ReportCourse WHERE reportId =?";
	private static final String SELECT_ONE_REPORT_MESSAGE =
			"SELECT reportId,reportCourseID,reportMemberID,reportContent,reportTime,status FROM ReportCourse WHERE reportId=?";
	private static final String SELECT_NOT_HANDLE_REPORT_MESSAGE =
			"SELECT reportId,reportCourseID,reportMemberID,reportContent,reportTime,status FROM ReportCourse WHERE status=?";
	private static final String SELECT_ALL_REPORT_MESSAGE =
			"SELECT reportId,reportCourseID,reportMemberID,reportContent,reportTime,status FROM ReportCourse";	
		
	@Override
	public void insert(ReportCourseVO ReportCourseVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_REPORTCOURSE);

			pstmt.setInt(1, ReportCourseVO.getReportCourseID());
			pstmt.setInt(2,	ReportCourseVO.getReportMemberID());
			pstmt.setString(3, ReportCourseVO.getReportContent());
			
			pstmt.executeUpdate();
			
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
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
	public void update(ReportCourseVO reportCourseVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			//"UPDATE ReportMessage SET status=? WHERE reportId=?";
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE_STATUS);
			pstmt.setByte(1, reportCourseVO.getStatus());
			pstmt.setInt(2, reportCourseVO.getReportId());
			pstmt.executeUpdate();
		
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
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
	public void delete(Integer reportID) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			//"DELETE FROM ReportMessage WHERE reportId =?";
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt=con.prepareStatement(DELETE_REPORTCOURSE);
			pstmt.setInt(1, reportID);
			pstmt.executeUpdate();

			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
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
	public ReportCourseVO findByReportId(Integer reportId) {
		ReportCourseVO reportCourseVO = null;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			//"SELECT reportId,reportCourseID,reportMemberID,reportContent,reportTime,status FROM ReportCourse WHERE reportId=?";
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(SELECT_ONE_REPORT_MESSAGE);

			pstmt.setInt(1, reportId);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				reportCourseVO=new ReportCourseVO();
				reportCourseVO.setReportId(rs.getInt("reportId"));
				reportCourseVO.setReportMemberID(rs.getInt("reportMemberID"));
				reportCourseVO.setReportContent(rs.getString("reportContent"));
				reportCourseVO.setReportTime(rs.getDate("reportTime"));
				reportCourseVO.setReportTime(rs.getDate("reportTime"));
				reportCourseVO.setStatus(rs.getByte("status"));
			}

			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
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
		return reportCourseVO;
	}

	@Override
	public List<ReportCourseVO> getNotHandle(byte status) {
		List<ReportCourseVO> list = new ArrayList<ReportCourseVO>();
		ReportCourseVO reportCourseVO = null;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(SELECT_NOT_HANDLE_REPORT_MESSAGE);
			pstmt.setByte(1, status);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				reportCourseVO.setReportId(rs.getInt("reportId"));
				reportCourseVO.setReportMemberID(rs.getInt("reportMemberID"));
				reportCourseVO.setReportContent(rs.getString("reportContent"));
				reportCourseVO.setReportTime(rs.getDate("reportTime"));
				reportCourseVO.setReportTime(rs.getDate("reportTime"));
				reportCourseVO.setStatus(rs.getByte("status"));
				list.add(reportCourseVO); // Store the row in the list
			}

			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
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
	public List<ReportCourseVO> getAll() {
		List<ReportCourseVO> list = new ArrayList<ReportCourseVO>();
		ReportCourseVO reportCourseVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(SELECT_ALL_REPORT_MESSAGE);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				reportCourseVO=new ReportCourseVO();
				reportCourseVO.setReportId(rs.getInt("reportId"));
				reportCourseVO.setReportMemberID(rs.getInt("reportMemberID"));
				reportCourseVO.setReportContent(rs.getString("reportContent"));
				reportCourseVO.setReportTime(rs.getDate("reportTime"));
				reportCourseVO.setReportTime(rs.getDate("reportTime"));
				reportCourseVO.setStatus(rs.getByte("status"));
				list.add(reportCourseVO); // Store the row in the list
			}

			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
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
		
		ReportCourseDAO_JDBC dao = new ReportCourseDAO_JDBC();
		
		
		ReportCourseVO reportCourseVO = new ReportCourseVO();
		
		// 新增	
//		reportCourseVO.setReportCourseID(200002);
//		reportCourseVO.setReportMemberID(100001);
//		reportCourseVO.setReportContent("太長了");
//		dao.insert(reportCourseVO);
		
		//修改
//		reportCourseVO.setReportId(1001);
//		reportCourseVO.setStatus((byte) 1);
//		dao.update(reportCourseVO);
		
		//查詢單一
//		"SELECT reportId,reportCourseID,reportMemberID,reportContent,reportTime,status FROM ReportCourse WHERE reportId=?";
//		ReportCourseVO reportCourseVO2 = dao.findByReportId(1001);
//		System.out.println(reportCourseVO2.getReportId());
//		System.out.println(reportCourseVO2.getReportMemberID());
//		System.out.println(reportCourseVO2.getReportContent());
//		System.out.println(reportCourseVO2.getReportTime());
//		System.out.println(reportCourseVO2.getStatus());
//		System.out.println("---------------------------");
		
		//查詢全部
//		List<ReportCourseVO> list = dao.getAll();
//		for(ReportCourseVO reportCourseVO1 : list) {
//			System.out.print(reportCourseVO1.getReportId() + "  ");
//			System.out.print(reportCourseVO1.getReportMemberID() + "  ");
//			System.out.print(reportCourseVO1.getReportContent() + "  ");
//			System.out.print(reportCourseVO1.getReportTime() + "  ");
//			System.out.print(reportCourseVO1.getStatus());
//		}
		
	}

}
