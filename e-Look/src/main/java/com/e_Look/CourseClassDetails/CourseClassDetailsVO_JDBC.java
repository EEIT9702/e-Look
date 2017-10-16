package com.e_Look.CourseClassDetails;

import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.e_Look.Course.CourseVO;

public class CourseClassDetailsVO_JDBC  implements CourseClassDetails_interface{
	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/eLookDB");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	private static final String INSERT_courseNClass = "insert into CourseClassDetails (courseID,CourseClassID) values (?,?)"; 
	private static final String UPDATE_courseNClass = "update CourseClassDetails set courseID=? CourseClassID=? where courseID=?"; 
	private static final String DELETE_courseNClass = "delete from CourseClassDetails where courseID=?"; 
	private static final String SELECT_findBycourseClassID = "select CourseClassID,courseID from CourseClassDetails where CourseClassID=?";
	private static final String SELECT_findBycourseID = "select courseID,CourseClassID from CourseClassDetails where courseID=?";
	private static final String SELECT_ALL = "select CourseClassID,ccName,eventID from CourseClassDetails";
	@Override
	public void insert(CourseClassDetailsVO courseClassVO, CourseVO courseVO) {
	
		
	}

	@Override
	public void delete(CourseClassDetailsVO courseClassID, CourseVO courseID) {
		
	}

	@Override
	public void update(CourseClassDetailsVO courseClassVO, CourseVO courseVO) {
		
		
	}

	@Override
	public List<CourseClassDetailsVO> findBycourseClassID(CourseClassDetailsVO courseClassID) {
		
		return null;
	}

	@Override
	public List<CourseClassDetailsVO> findBycourseID(CourseVO courseID) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<CourseClassDetailsVO> getAll() {
		// TODO Auto-generated method stub
		return null;
	}
	
	
}
