package com.e_Look.CourseClassDetails;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.e_Look.Course.CourseVO;
import com.e_Look.courseClass.courseClassVO;

public class CourseClassDetailsDAO implements CourseClassDetails_interface {
	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/eLookDB");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	private static final String INSERT_courseNClass = 
			"insert into CourseClassDetails (courseID,courseName,CourseClassID,ccName) values (?,?,?,?)";
	
//	private static final String UPDATE_courseNClass = 
//			"update CourseClassDetails set CourseClassID=? where courseID=?";
	
	private static final String DELETE_courseNClass = 
			"delete from CourseClassDetails where courseID=?";
	
	private static final String SELECT_findBycourseClassID = 
			"select CourseClassID,courseID from CourseClassDetails where CourseClassID=?";
	
	private static final String SELECT_findBycourseID = 
			"select courseID,CourseClassID from CourseClassDetails where courseID=?";
	
	private static final String SELECT_ALL = 
			"select CourseClassID,ccName,eventID from CourseClassDetails";

	@Override
	public void insert(courseClassVO courseClassVO, CourseVO courseVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_courseNClass);
			pstmt.setInt(1, courseVO.getCourseID());
			pstmt.setString(2, courseVO.getCourseName());
			pstmt.setInt(3, courseClassVO.getCourseClassID());
			pstmt.setString(4, courseClassVO.getCcName());

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
	public void update(courseClassVO courseClassVO, CourseVO courseVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = ds.getConnection();
//			pstmt = con.prepareStatement(UPDATE_courseNClass);

			pstmt.setInt(1, courseClassVO.getCourseClassID());
			pstmt.setInt(2, courseVO.getCourseID());
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

	public void delete(CourseVO CourseVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE_courseNClass);
			pstmt.setInt(1, CourseVO.getCourseID());
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
	public List<CourseClassDetailsVO> findBycourseClassID(Integer CourseClassID) {
		
		List<CourseClassDetailsVO> findBycourseClassID = new LinkedList<CourseClassDetailsVO>();
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			pstmt = conn.prepareStatement(SELECT_findBycourseClassID);
			pstmt.setInt(1, CourseClassID);
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				CourseClassDetailsVO CourseClassDetailsVO = new CourseClassDetailsVO();
				CourseClassDetailsVO.setCourseClassID(rs.getInt(1));
				CourseClassDetailsVO.setCourseID(rs.getInt(2));
				findBycourseClassID.add(CourseClassDetailsVO);
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
			if (conn != null) {
				try {
					conn.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return findBycourseClassID;
	}

	@Override
	public List<CourseClassDetailsVO> findBycourseID(Integer CourseID) {
		List<CourseClassDetailsVO> findBycourseID = new LinkedList<CourseClassDetailsVO>();

		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			pstmt = conn.prepareStatement(SELECT_findBycourseID);
			pstmt.setInt(1, CourseID);
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				CourseClassDetailsVO CourseClassDetailsVO = new CourseClassDetailsVO();
				CourseClassDetailsVO.setCourseClassID(rs.getInt(1));
				CourseClassDetailsVO.setCourseID(rs.getInt(2));
				findBycourseID.add(CourseClassDetailsVO);
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
			if (conn != null) {
				try {
					conn.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return findBycourseID;
	}

	@Override
	public List<CourseClassDetailsVO> getAll() {
		List<CourseClassDetailsVO> getAll = new LinkedList<CourseClassDetailsVO>();

		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(SELECT_ALL);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				CourseClassDetailsVO CourseClassDetailsVO = new CourseClassDetailsVO();
				CourseClassDetailsVO.setCourseClassID(rs.getInt(1));
				CourseClassDetailsVO.setCourseID(rs.getInt(2));
				getAll.add(CourseClassDetailsVO);
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
			if (conn != null) {
				try {
					conn.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return getAll;
	}

	@Override
	public void delete(Integer courseID) {
		// TODO Auto-generated method stub

	}
}
