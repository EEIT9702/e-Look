package com.e_Look.courseClass;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.e_Look.eLookEvent.eLookEventVO;
import com.e_Look.member.model.MemberVO;



public class courseClassDAO_JDBC implements courseClass_interface{
	String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
	String url = "jdbc:sqlserver://localhost:1433;DatabaseName=eLook";
	String userid = "sa";
	// 第一組密碼
	
	String passwd = "P@ssw0rd";
	// 第二組密碼
	// String passwd = "123456";

	private static final String INSERT_courseClass = "insert into courseClass (ccName) values (?)"; 
	private static final String UPDATE_courseClass = "update courseClass set ccName=? eventID=? where CourseClassID=?"; 
	private static final String DELETE_courseClass = "delete from courseClass where CourseClassID=?"; 
	private static final String SELECT_courseClass = "select CourseClassID,ccName,eventID from courseClass where CourseClassID=?";
	private static final String SELECT_event_courseClass = "select CourseClassID,ccName,eventID from courseClass where eventID=?";
	private static final String SELECT_ALL_courseClass = "select CourseClassID,ccName,eventID from courseClass";
	@Override
	public void insert(courseClassVO courseClassVO) {
		Connection conn =null;
		PreparedStatement pstmt=null;
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, userid, passwd);
			
			pstmt=conn.prepareStatement(INSERT_courseClass);
			pstmt.setString(1,courseClassVO.getCcName());

			pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			throw new RuntimeException("A database error occured. " + e.getMessage());
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
			if (conn != null) {
				try {
					conn.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
	}
	
	
	
	@Override
	public void delete(Integer CourseClassID) {
		Connection conn =null;
		PreparedStatement pstmt=null;
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, userid, passwd);
			
			pstmt=conn.prepareStatement(DELETE_courseClass);
			
			pstmt.setInt(1,CourseClassID);
			pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			throw new RuntimeException("A database error occured. " + e.getMessage());
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
			if (conn != null) {
				try {
					conn.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		
	}

	@Override
	public void update(courseClassVO courseClassVO) {
		Connection conn =null;
		PreparedStatement pstmt=null;
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, userid, passwd);
			
			pstmt=conn.prepareStatement(UPDATE_courseClass);
			
			pstmt.setString(1,courseClassVO.getCcName());
			pstmt.setInt(2,courseClassVO.getEventID());
			pstmt.setInt(3,courseClassVO.getCourseClassID());
			pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			throw new RuntimeException("A database error occured. " + e.getMessage());
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
			if (conn != null) {
				try {
					conn.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		
	}

	
	@Override
	public courseClassVO findByCourseClassID(Integer CourseClassID) {
		courseClassVO courseClassVO = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, userid, passwd);
			pstmt = conn.prepareStatement(SELECT_courseClass);
			pstmt.setInt(1, CourseClassID);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				courseClassVO = new courseClassVO();
				courseClassVO.setCourseClassID(rs.getInt(1));
				courseClassVO.setCcName(rs.getString(2));
				courseClassVO.setEventID(rs.getInt(3));				
			}
		} catch (SQLException e) {
			throw new RuntimeException("A database error occured. " + e.getMessage());
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
			if (conn != null) {
				try {
					conn.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		
		return courseClassVO;
	
	}

	public List<courseClassVO> findByEventID(Integer eventID){
			List<courseClassVO> list_event_courseClass = new LinkedList<courseClassVO>();
			Connection conn =null;
			PreparedStatement pstmt=null;
			try {		
				Class.forName(driver);
				conn = DriverManager.getConnection(url, userid, passwd);
				pstmt=conn.prepareStatement(SELECT_event_courseClass);
				pstmt.setInt(1, eventID);
				ResultSet rs = pstmt.executeQuery();
				
				while(rs.next()){
					courseClassVO courseClassVO = new courseClassVO();
					courseClassVO.setCourseClassID(rs.getInt(1));	
					courseClassVO.setCcName(rs.getString(2));	
					courseClassVO.setEventID(rs.getInt(3));	
					list_event_courseClass.add(courseClassVO);
				}		
		} catch (SQLException e) {
			throw new RuntimeException("A database error occured. " + e.getMessage());
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
			if (conn != null) {
				try {
					conn.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return list_event_courseClass;
	}
			

	@Override
	public List<courseClassVO> getAll() {
		
		List<courseClassVO> list_event_courseClass = new LinkedList<courseClassVO>();
		
		Connection conn =null;
		PreparedStatement pstmt=null;
		
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, userid, passwd);
			pstmt=conn.prepareStatement(SELECT_ALL_courseClass);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()){
				courseClassVO courseClassVO = new courseClassVO();
				courseClassVO.setCourseClassID(rs.getInt(1));	
				courseClassVO.setCcName(rs.getString(2));	
				courseClassVO.setEventID(rs.getInt(3));	
				list_event_courseClass.add(courseClassVO);
			}		
		} catch (SQLException e) {
			throw new RuntimeException("A database error occured. " + e.getMessage());
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
			if (conn != null) {
				try {
					conn.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return list_event_courseClass;
	}
	public static void main(String[] args) {
		courseClassDAO_JDBC daoJdbc=new courseClassDAO_JDBC();
//		新增類別
		courseClassVO courseClassVO=new courseClassVO();	
		courseClassVO.setCcName("商業");
		daoJdbc.insert(courseClassVO);
		
//		查詢一筆
//		courseClassVO courseClassVO = daoJdbc.findByCourseClassID(101);
//		
//			System.out.print(courseClassVO.getCourseClassID()+",");
//			System.out.print(courseClassVO.getCcName()+",");
//			System.out.print(courseClassVO.getEventID()+",");
		
//		}
		
//		查詢全部
		List<courseClassVO> list2 = daoJdbc.getAll();
		for(courseClassVO courseClassVO1:list2){
			System.out.print(courseClassVO1.getCourseClassID()+",");
			System.out.print(courseClassVO1.getCcName()+",");
			System.out.print(courseClassVO1.getEventID()+",");
		
		}
	}
}

