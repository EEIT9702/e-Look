package com.e_Look.Course;

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
			"insert into Course (courseName,photoName,cPhoto,preTool,background,ability,targetgroup,soldPrice,courseLength,targetStudentNumber,fundStartDate,fundEndDate,courseStartDate,courseVideopathway,paper,status,courseContent,memberID,avgScore) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
	private static final String UPDATE_Course = 
			"update Course set courseName=?,photoName=?,cPhoto=?,preTool=?,background=?,ability=?,targetgroup=?,soldPrice=?,courseLength=?,targetStudentNumber=?,fundStartDate=?,fundEndDate=?,courseStartDate=?,courseVideopathway=?,paper=?,status=?,courseContent=?,memberID=?,avgScore=?";
	
	
		







	@Override
	public void insert(CourseVO courseVO) {
		// TODO Auto-generated method stub
		
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
