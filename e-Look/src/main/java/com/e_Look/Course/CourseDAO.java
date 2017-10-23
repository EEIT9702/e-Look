package com.e_Look.Course;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class CourseDAO implements CourseDAO_interface {
	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/eLookDB");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	private static final String INSERT_Course = "insert into Course (courseName,cPhoto,preTool,background,ability,targetgroup,soldPrice,courseLength,targetStudentNumber,fundStartDate,fundEndDate,courseStartDate,courseVideopathway,paper,status,courseContent,memberID,avgScore,proposalVideopathway) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
	private static final String UPDATE_Course = "update Course set courseName=?,cPhoto=?,preTool=?,background=?,ability=?,targetgroup=?,soldPrice=?,courseLength=?,targetStudentNumber=?,fundStartDate=?,fundEndDate=?,courseStartDate=?,courseVideopathway=?,paper=?,courseContent=?,proposalVideopathway=? where courseID= ?";
	private static final String DELETE_Course = "delete from Course where courseID= ?";
	private static final String SELECT_ONE_Course = "select courseID,courseName,cPhoto,preTool,background,ability,targetgroup,soldPrice,courseLength,targetStudentNumber,fundStartDate,fundEndDate,courseStartDate,courseVideopathway,paper,status,courseContent,memberID,avgScore,proposalVideopathway from Course where courseID= ?";
	private static final String SELECT_ALL_Course = "select courseID,courseName,cPhoto,preTool,background,ability,targetgroup,soldPrice,courseLength,targetStudentNumber,fundStartDate,fundEndDate,courseStartDate,courseVideopathway,paper,status,courseContent,memberID,avgScore,proposalVideopathway from Course where memberID= ? and status= ?";
	private static final String SELECT_STATUS_Course = "select courseID,courseName,cPhoto,preTool,background,ability,targetgroup,soldPrice,courseLength,targetStudentNumber,fundStartDate,fundEndDate,courseStartDate,courseVideopathway,paper,status,courseContent,memberID,avgScore,proposalVideopathway from Course where status= ?";
	private static final String CHANGE_Course_Stage = "update Course set status=? where courseID= ?";

	@Override
	public Integer insert(CourseVO courseVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		PreparedStatement pstmtCourseID = null;
		ResultSet generatedKeys = null;
		int id = 0;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_Course,Statement.RETURN_GENERATED_KEYS);						
			pstmt.setString(1, courseVO.getCourseName());// 課程名稱
			pstmt.setBlob(2, courseVO.getcPhoto());// 課程封面照片
			pstmt.setString(3, courseVO.getPreTool());// 準備工具
			pstmt.setString(4, courseVO.getBackground());// 背景知識
			pstmt.setString(5, courseVO.getAbility());// 先備能力
			pstmt.setString(6, courseVO.getTargetgroup());// 適合學習的族群
			pstmt.setInt(7, courseVO.getSoldPrice());// 課程售價
			pstmt.setInt(8, courseVO.getCourseLength());// 影片時間長度
			pstmt.setInt(9, courseVO.getTargetStudentNumber());// 募資人數
			pstmt.setDate(10, courseVO.getFundStartDate());// 募資開始日期
			pstmt.setDate(11, courseVO.getFundEndDate());// 募資結束日期
			pstmt.setDate(12, courseVO.getCourseStartDate());// 課程開始上線日期
			pstmt.setString(13, courseVO.getCourseVideopathway());// 課程影片
			pstmt.setBlob(14, courseVO.getPaper());// 課程講義
			pstmt.setInt(15, courseVO.getStatus());// 課程狀態(草稿、上線、下架等...)
			pstmt.setString(16, courseVO.getCourseContent());// 課程介紹內容
			pstmt.setInt(17, courseVO.getMemberID());// 會員編號
			pstmt.setDouble(18, courseVO.getAvgScore());// 課程平均分數
			pstmt.setString(19, courseVO.getProposalVideopathway());// 募資影片
			pstmt.executeUpdate();
			
			generatedKeys = pstmt.getGeneratedKeys();
			
			if (generatedKeys.next()) {
				id = generatedKeys.getInt(1);
			} else {
				throw new SQLException(
						"Creating user failed, no generated key obtained.");
			}
			
		} catch (SQLException e) {
			throw new RuntimeException("A database error occured. " + e.getMessage());
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
		return id;
	}

	@Override
	public void update(CourseVO courseVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE_Course);
			pstmt.setString(1, courseVO.getCourseName());// 課程名稱
			pstmt.setBlob(2, courseVO.getcPhoto());// 課程封面照片
			pstmt.setString(3, courseVO.getPreTool());// 準備工具
			pstmt.setString(4, courseVO.getBackground());// 背景知識
			pstmt.setString(5, courseVO.getAbility());// 先備能力
			pstmt.setString(6, courseVO.getTargetgroup());// 適合學習的族群
			pstmt.setInt(7, courseVO.getSoldPrice());// 課程售價
			pstmt.setInt(8, courseVO.getCourseLength());// 影片時間長度
			pstmt.setInt(9, courseVO.getTargetStudentNumber());// 募資人數
			pstmt.setDate(10, courseVO.getFundStartDate());// 募資開始日期
			pstmt.setDate(11, courseVO.getFundEndDate());// 募資結束日期
			pstmt.setDate(12, courseVO.getCourseStartDate());// 課程開始上線日期
			pstmt.setString(13, courseVO.getCourseVideopathway());// 課程影片
			pstmt.setBlob(14, courseVO.getPaper());// 課程講義
			pstmt.setString(15, courseVO.getCourseContent());// 課程介紹內容
			pstmt.setString(16, courseVO.getProposalVideopathway());// 募資影片
			pstmt.setInt(17, courseVO.getCourseID());// 課程ID
			pstmt.executeUpdate();

		} catch (SQLException e) {
			throw new RuntimeException("A database error occured. " + e.getMessage());
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
	public void delete(Integer courseID) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE_Course);
			pstmt.setInt(1, courseID);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			throw new RuntimeException("A database error occured. " + e.getMessage());
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
	public CourseVO findByPrimaryKey(Integer courseID) {
		CourseVO courseVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(SELECT_ONE_Course);
			pstmt.setInt(1, courseID);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				courseVO = new CourseVO();
				courseVO.setCourseID(rs.getInt(1));
				courseVO.setCourseName(rs.getString(2));
				courseVO.setcPhoto(rs.getBinaryStream(3));
				courseVO.setPreTool(rs.getString(4));
				courseVO.setBackground(rs.getString(5));
				courseVO.setAbility(rs.getString(6));
				courseVO.setTargetgroup(rs.getString(7));
				courseVO.setSoldPrice(rs.getInt(8));
				courseVO.setCourseLength(rs.getInt(9));
				courseVO.setTargetStudentNumber(rs.getInt(10));
				courseVO.setFundStartDate(rs.getDate(11));
				courseVO.setFundEndDate(rs.getDate(12));
				courseVO.setCourseStartDate(rs.getDate(13));
				courseVO.setCourseVideopathway(rs.getString(14));
				courseVO.setPaper(rs.getBinaryStream(15));
				courseVO.setStatus(rs.getInt(16));
				courseVO.setCourseContent(rs.getString(17));
				courseVO.setMemberID(rs.getInt(18));
				courseVO.setAvgScore(rs.getDouble(19));
				courseVO.setProposalVideopathway(rs.getString(20));
			}
		} catch (SQLException e) {
			throw new RuntimeException("A database error occured. " + e.getMessage());
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
		return courseVO;
	}

	@Override
	public List<CourseVO> findBymemberID(Integer memberID, Integer status) {
		List<CourseVO> CourseList = new LinkedList<CourseVO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		try{
			con = ds.getConnection();
			pstmt = con.prepareStatement(SELECT_ALL_Course);
			pstmt.setInt(1, memberID);
			pstmt.setInt(2, status);
			ResultSet  rs=pstmt.executeQuery();
			while(rs.next()){
				CourseVO courseVO=new CourseVO();
				courseVO.setCourseID(rs.getInt(1));
				courseVO.setCourseName(rs.getString(2));
				courseVO.setcPhoto(rs.getBinaryStream(3));
				courseVO.setPreTool(rs.getString(4));
				courseVO.setBackground(rs.getString(5));
				courseVO.setAbility(rs.getString(6));
				courseVO.setTargetgroup(rs.getString(7));
				courseVO.setSoldPrice(rs.getInt(8));
				courseVO.setCourseLength(rs.getInt(9));
				courseVO.setTargetStudentNumber(rs.getInt(10));
				courseVO.setFundStartDate(rs.getDate(11));
				courseVO.setFundEndDate(rs.getDate(12));
				courseVO.setCourseStartDate(rs.getDate(13));
				courseVO.setCourseVideopathway(rs.getString(14));
				courseVO.setPaper(rs.getBinaryStream(15));
				courseVO.setStatus(rs.getInt(16));
				courseVO.setCourseContent(rs.getString(17));
				courseVO.setMemberID(rs.getInt(18));
				courseVO.setAvgScore(rs.getDouble(19));
				courseVO.setProposalVideopathway(rs.getString(20));
				CourseList.add(courseVO);			
		}
		} catch (SQLException e) {
			throw new RuntimeException("A database error occured. " + e.getMessage());
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
		return CourseList;
	}

	@Override
	public void updateStatus(CourseVO courseVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(CHANGE_Course_Stage);
			pstmt.setInt(1,courseVO.getStatus());
			pstmt.setInt(2,courseVO.getCourseID());
			pstmt.executeUpdate();
		
		} catch (SQLException e) {
			throw new RuntimeException("A database error occured. " + e.getMessage());
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
}