package com.e_Look.Course;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

public class CourseDAO_JDBC implements CourseDAO_interface {
	String driver = "com.microsoft.sqlsever.jdbc.SQLSeverDriver";
	String url = "jdbc:sqlserver://localhost:1433;DatabaseName=eLook";
	String userid = "sa";
	//第一組密碼
	//String passwd = "P@ssw0rd";
	//第二組密碼
	String passwd = "123456";
	private static final String INSERT_Course = 
			"insert into Course (courseName,photoName,cPhoto,preTool,background,ability,targetgroup,soldPrice,courseLength,targetStudentNumber,fundStartDate,fundEndDate,courseStartDate,courseVideopathway,paper,status,courseContent,memberID,avgScore,proposalVideopathway) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
	private static final String UPDATE_Course = 
			"update Course set courseName=?,photoName=?,cPhoto=?,preTool=?,background=?,ability=?,targetgroup=?,soldPrice=?,courseLength=?,targetStudentNumber=?,fundStartDate=?,fundEndDate=?,courseStartDate=?,courseVideopathway=?,paper=?,status=?,courseContent=?,memberID=?,avgScore=?,proposalVideopathway=?";
	private static final String DELETE_Course =
			"delete from Course where courseID= ?";
	private static final String SELECT_ONE_Course =
			"select courseID,courseName,photoName,cPhoto,preTool,background,ability,targetgroup,soldPrice,courseLength,targetStudentNumber,fundStartDate,fundEndDate,courseStartDate,courseVideopathway,paper,status,courseContent,memberID,avgScore,proposalVideopathway from Course where courseID= ?";
	private static final String SELECT_ALL_MEMBER =
			"select courseID,courseName,photoName,cPhoto,preTool,background,ability,targetgroup,soldPrice,courseLength,targetStudentNumber,fundStartDate,fundEndDate,courseStartDate,courseVideopathway,paper,status,courseContent,memberID,avgScore,proposalVideopathway from Course";
	
	@Override
	public void insert(CourseVO courseVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try{
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_Course);
			pstmt.setString(1, "null");
			pstmt.setString(2, "null");
			pstmt.setString(3, "null");
			pstmt.setString(4, "null");
			pstmt.setString(5, "null");
			pstmt.setString(6, "null");
			pstmt.setString(7, "null");
			pstmt.setString(8, "null");
			pstmt.setString(9, "null");
			pstmt.setString(10, "null");
			pstmt.setString(11, "null");
			pstmt.setString(12, "null");
			pstmt.setString(13, "null");
			pstmt.setString(14, "null");
			pstmt.setString(15, "null");
			pstmt.setString(16, "null");			
			pstmt.setString(17, "null");
			pstmt.setString(18, "null");
			
			
			
		}catch (ClassNotFoundException e) {
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
	public void update(CourseVO courseVO) {
		// TODO Auto-generated method stub
		
	}







	@Override
	public void delete(Integer courseID) {
		// TODO Auto-generated method stub
		
	}







	@Override
	public CourseVO findByPrimaryKey(Integer courseID) {
		// TODO Auto-generated method stub
		return null;
	}







	@Override
	public List<CourseVO> getAll() {
		// TODO Auto-generated method stub
		return null;
	}
	
	
	
	
	public static void main(String[] args) {
		

	}

}
