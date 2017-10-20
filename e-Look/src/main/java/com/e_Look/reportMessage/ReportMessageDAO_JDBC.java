package com.e_Look.reportMessage;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.e_Look.message.model.MessageVO;

public class ReportMessageDAO_JDBC implements ReportMessageDAO_interface {
	String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
	String url = "jdbc:sqlserver://localhost:1433;DatabaseName=elook";
	String userid = "sa";
	//第一組密碼
	String passwd = "P@ssw0rd";
	//第二組密碼
	//String passwd = "123456";
	
	private static final String INSERT_REPORT_MESSAGE =
			"INSERT INTO ReportMessage (reportMessageID, reportMemberID, reportContent, reportTime, status) VALUES (?,?,?,getDate(),0)";
//	private static final String UPDATE_ReportMessage =
//			"UPDATE ReportMessage SET reportContent=? WHERE reportId=?";
	private static final String UPDATE_STATUS =
		    "UPDATE ReportMessage SET status=? WHERE reportId=?";
	//DELETE_REPORTMESSAGE寫著,但應該用不到
	private static final String DELETE_REPORT_MESSAGE =
		    "DELETE FROM ReportMessage WHERE reportId =?";
	private static final String SELECT_ONE_REPORT_MESSAGE =
			"SELECT m.messageID, m.mContent, rm.reportID, rm.reportMessageID, rm.reportMemberID, rm.reportContent, rm.reportTime, rm.status FROM Message m INNER JOIN ReportMessage rm ON m.messageID = rm.reportMessageID WHERE rm.reportId=?";
	private static final String SELECT_NOT_HANDLE_REPORT_MESSAGE =
			"SELECT m.messageID, m.mContent, rm.reportID, rm.reportMessageID, rm.reportMemberID, rm.reportContent, rm.reportTime, rm.status FROM Message m INNER JOIN ReportMessage rm ON m.messageID = rm.reportMessageID WHERE rm.status=0";
	private static final String SELECT_ALL_REPORT_MESSAGE =
			"SELECT m.messageID, m.mContent, rm.reportID, rm.reportMessageID, rm.reportMemberID, rm.reportContent, rm.reportTime, rm.status FROM Message m INNER JOIN ReportMessage rm ON m.messageID = rm.reportMessageID ";
	/*
	private static final String SELECT_ONE_REPORT_MESSAGE =
			"SELECT reportId, reportMessageID, reportMemberID, reportContent, reportTime, status FROM ReportMessage WHERE reportId=?";
	private static final String SELECT_NOT_HANDLE_REPORT_MESSAGE =
			"SELECT reportId, reportMessageID, reportMemberID, reportContent, reportTime, status FROM ReportMessage WHERE status=0";
	private static final String SELECT_ALL_REPORT_MESSAGE =
			"SELECT reportId, reportMessageID, reportMemberID, reportContent, reportTime, status FROM ReportMessage";
	查詢檢舉join留言內容的指令
	SELECT m.messageID, m.mContent, rm.reportID, rm.reportMessageID, 
	rm.reportMemberID, rm.reportContent, rm.reportTime, rm.status
	FROM Message m INNER JOIN ReportMessage rm ON m.messageID = rm.reportMessageID
	*/
	
	@Override
	public void insert(ReportMessageVO reportMessageVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			//"INSERT INTO ReportMessage (reportMessageID, reportMemberID, reportContent, reportTime, status) VALUES (?,?,?,getDate(),0)";
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_REPORT_MESSAGE);
//			pstmt.setInt(1, reportMessageVO.getReportMessageID());
			pstmt.setInt(1, reportMessageVO.getMessageVO().getMessageID());
			pstmt.setInt(2, reportMessageVO.getReportMemberID());
			pstmt.setString(3, reportMessageVO.getReportContent());
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
	public void update(ReportMessageVO reportMessageVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			//"UPDATE ReportMessage SET status=? WHERE reportId=?";
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE_STATUS);
			pstmt.setByte(1, reportMessageVO.getStatus());
			pstmt.setInt(2, reportMessageVO.getReportId());
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
	public void delete(Integer reportID) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			//"DELETE FROM ReportMessage WHERE reportId =?";
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt=con.prepareStatement(DELETE_REPORT_MESSAGE);
			pstmt.setInt(1, reportID);
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
	public ReportMessageVO findByReportId(Integer reportId) {
		ReportMessageVO reportMessageVO = null;
		MessageVO messageVO = null;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			//"SELECT m.messageID, m.mContent, rm.reportID, rm.reportMessageID, rm.reportMemberID,
			//rm.reportContent, rm.reportTime, rm.status FROM Message m INNER JOIN ReportMessage rm 
			//ON m.messageID = rm.reportMessageID WHERE reportId=?";
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(SELECT_ONE_REPORT_MESSAGE);

			pstmt.setInt(1, reportId);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				// reportMessageVO 也稱為 Domain objects
				reportMessageVO = new ReportMessageVO();
				messageVO = new MessageVO();
				messageVO.setMessageID(rs.getInt("messageID"));
				messageVO.setmContent(rs.getString("mContent"));
				reportMessageVO.setMessageVO(messageVO);
				reportMessageVO.setReportId(rs.getInt("reportId"));
//				reportMessageVO.setReportMessageID(rs.getInt("reportMessageID"));
				reportMessageVO.setReportMemberID(rs.getInt("reportMemberID"));
				reportMessageVO.setReportContent(rs.getString("reportContent"));
				reportMessageVO.setReportTime(rs.getDate("reportTime"));
				reportMessageVO.setStatus(rs.getByte("status"));
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
		return reportMessageVO;
	}

	@Override
	public List<ReportMessageVO> getNotHandle() {
		List<ReportMessageVO> list = new ArrayList<ReportMessageVO>();
		ReportMessageVO reportMessageVO = null;
		MessageVO messageVO = null;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			//"SELECT m.messageID, m.mContent, rm.reportID, rm.reportMessageID, rm.reportMemberID, 
			//rm.reportContent, rm.reportTime, rm.status FROM Message m INNER JOIN ReportMessage rm 
			//ON m.messageID = rm.reportMessageID WHERE status=0";
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(SELECT_NOT_HANDLE_REPORT_MESSAGE);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				// reportMessageVO 也稱為 Domain objects
				reportMessageVO = new ReportMessageVO();
				messageVO = new MessageVO();
				messageVO.setMessageID(rs.getInt("messageID"));
				messageVO.setmContent(rs.getString("mContent"));
				reportMessageVO.setMessageVO(messageVO);
				reportMessageVO.setReportId(rs.getInt("reportId"));
				//reportMessageVO.setReportMessageID(rs.getInt("reportMessageID"));
				reportMessageVO.setReportMemberID(rs.getInt("reportMemberID"));
				reportMessageVO.setReportContent(rs.getString("reportContent"));
				reportMessageVO.setReportTime(rs.getDate("reportTime"));
				reportMessageVO.setStatus(rs.getByte("status"));
				list.add(reportMessageVO); // Store the row in the list
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
	public List<ReportMessageVO> getAll() {
		List<ReportMessageVO> list = new ArrayList<ReportMessageVO>();
		ReportMessageVO reportMessageVO = null;
		MessageVO messageVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			//"SELECT m.messageID, m.mContent, rm.reportID, rm.reportMessageID, rm.reportMemberID, 
			//rm.reportContent, rm.reportTime, rm.status FROM Message m INNER JOIN ReportMessage rm 
			//ON m.messageID = rm.reportMessageID ";
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(SELECT_ALL_REPORT_MESSAGE);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				// reportMessageVO 也稱為 Domain objects
				reportMessageVO = new ReportMessageVO();
				messageVO = new MessageVO();
				messageVO.setMessageID(rs.getInt("messageID"));
				messageVO.setmContent(rs.getString("mContent"));
				reportMessageVO.setMessageVO(messageVO);
				reportMessageVO.setReportId(rs.getInt("reportId"));
				//reportMessageVO.setReportMessageID(rs.getInt("reportMessageID"));
				reportMessageVO.setReportMemberID(rs.getInt("reportMemberID"));
				reportMessageVO.setReportContent(rs.getString("reportContent"));
				reportMessageVO.setReportTime(rs.getDate("reportTime"));
				reportMessageVO.setStatus(rs.getByte("status"));
				list.add(reportMessageVO); // Store the row in the list
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
		
		ReportMessageDAO_JDBC dao = new ReportMessageDAO_JDBC();
		
		// 新增
//		ReportMessageVO reportMessageVO1 = new ReportMessageVO();
//		MessageVO messageVO1 = new MessageVO();
//		messageVO1.setMessageID(1001);
//		reportMessageVO1.setMessageVO(messageVO1);
//		//reportMessageVO1.setReportMessageID(1001);
//		reportMessageVO1.setReportMemberID(100001);
//		reportMessageVO1.setReportContent("太短了");
//		dao.insert(reportMessageVO1);
		
		//修改
//		ReportMessageVO reportMessageVO2 = new ReportMessageVO();
//		MessageVO messageVO2 = new MessageVO();
//		messageVO2.setMessageID(1001);
//		reportMessageVO2.setMessageVO(messageVO2);
//		//reportMessageVO2.setReportMessageID(1001);
//		reportMessageVO2.setReportId(1001);
//		
//		reportMessageVO2.setReportMemberID(100001);
//		
//		reportMessageVO2.setReportContent("太短了~~~");
//		reportMessageVO2.setStatus((byte) 1);
//		dao.update(reportMessageVO2);
		
		//查詢單一
		ReportMessageVO reportMessageVO3 = dao.findByReportId(1001);
		System.out.println(reportMessageVO3.getReportId());
		System.out.println(reportMessageVO3.getMessageVO().getMessageID());
		System.out.println(reportMessageVO3.getReportMemberID());
		System.out.println(reportMessageVO3.getReportContent());
		System.out.println(reportMessageVO3.getReportTime());
		System.out.println(reportMessageVO3.getStatus());
		System.out.println("---------------------------");
		
		//查詢全部
		List<ReportMessageVO> list = dao.getAll();
		for(ReportMessageVO reportMessageVO : list) {
			System.out.print(reportMessageVO.getReportId() + "  ");
			System.out.print(reportMessageVO.getMessageVO().getMessageID() + "  ");
			System.out.print(reportMessageVO.getReportMemberID() + "  ");
			System.out.print(reportMessageVO.getReportContent() + "  ");
			System.out.print(reportMessageVO.getReportTime() + "  ");
			System.out.print(reportMessageVO.getStatus());
		}
		
	}

}
