package com.e_Look.ReportCourse.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.e_Look.message.model.MessageVO;

public class ReportCourseDAO implements ReportCourseDAO_interface {
	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/eLookDB");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
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
			con = ds.getConnection();
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
			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE_STATUS);
			pstmt.setByte(1, reportCourseVO.getStatus());
			pstmt.setInt(2, reportCourseVO.getReportId());
			pstmt.executeUpdate();
		
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
	public void delete(Integer reportID) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			//"DELETE FROM ReportMessage WHERE reportId =?";
			con = ds.getConnection();
			pstmt=con.prepareStatement(DELETE_REPORTCOURSE);
			pstmt.setInt(1, reportID);
			pstmt.executeUpdate();

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
	public ReportCourseVO findByReportId(Integer reportId) {
		ReportCourseVO reportCourseVO = null;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			//"SELECT reportId,reportCourseID,reportMemberID,reportContent,reportTime,status FROM ReportCourse WHERE reportId=?";
			con = ds.getConnection();
			pstmt = con.prepareStatement(SELECT_ONE_REPORT_MESSAGE);

			pstmt.setInt(1, reportId);

			rs = pstmt.executeQuery();

			while (rs.next()) {
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
			con = ds.getConnection();
			pstmt = con.prepareStatement(SELECT_NOT_HANDLE_REPORT_MESSAGE);
			pstmt.setByte(1, status);
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
			con = ds.getConnection();
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

}
