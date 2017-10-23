package com.e_Look.Course;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

import com.e_Look.member.model.MemberVO;

public class CourseDAO_JDBC implements CourseDAO_interface {
	String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
	String url = "jdbc:sqlserver://localhost:1433;DatabaseName=eLook";
	String userid = "sa";
	//第一組密碼
	String passwd = "P@ssw0rd";
	//第二組密碼
	//String passwd = "123456";
	private static final String INSERT_Course = 
			"insert into Course (courseName,cPhoto,preTool,background,ability,targetgroup,soldPrice,courseLength,targetStudentNumber,fundStartDate,fundEndDate,courseStartDate,courseVideopathway,paper,status,courseContent,memberID,avgScore,proposalVideopathway) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
	private static final String UPDATE_Course = 
			"update Course set courseName=?,cPhoto=?,preTool=?,background=?,ability=?,targetgroup=?,soldPrice=?,courseLength=?,targetStudentNumber=?,fundStartDate=?,fundEndDate=?,courseStartDate=?,courseVideopathway=?,paper=?,courseContent=?,proposalVideopathway=? where courseID= ?";
	private static final String DELETE_Course =
			"delete from Course where courseID= ?";
	private static final String SELECT_ONE_Course =
			"select courseID,courseName,cPhoto,preTool,background,ability,targetgroup,soldPrice,courseLength,targetStudentNumber,fundStartDate,fundEndDate,courseStartDate,courseVideopathway,paper,status,courseContent,memberID,avgScore,proposalVideopathway from Course where courseID= ?";
	private static final String SELECT_ALL_Course =
			"select courseID,courseName,cPhoto,preTool,background,ability,targetgroup,soldPrice,courseLength,targetStudentNumber,fundStartDate,fundEndDate,courseStartDate,courseVideopathway,paper,status,courseContent,memberID,avgScore,proposalVideopathway from Course where memberID= ? and status= ?";
	private static final String SELECT_STATUS_Course =
			"select courseID,courseName,cPhoto,preTool,background,ability,targetgroup,soldPrice,courseLength,targetStudentNumber,fundStartDate,fundEndDate,courseStartDate,courseVideopathway,paper,status,courseContent,memberID,avgScore,proposalVideopathway from Course where status= ?";	
	private static final String CHANGE_Course_Stage =
			"update Course set status=? where courseID= ?";
	
	
	
	//以下為我要開課的功能
	@Override
	public void insert(CourseVO courseVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try{
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_Course);
			pstmt.setString(1, courseVO.getCourseName());//課程名稱
			pstmt.setBlob(2, courseVO.getcPhoto());//課程封面照片
			pstmt.setString(3, courseVO.getPreTool());//準備工具
			pstmt.setString(4, courseVO.getBackground());//背景知識
			pstmt.setString(5, courseVO.getAbility());//先備能力
			pstmt.setString(6, courseVO.getTargetgroup());//適合學習的族群
			pstmt.setInt(7, courseVO.getSoldPrice());//課程售價
			pstmt.setInt(8, courseVO.getCourseLength());//影片時間長度
			pstmt.setInt(9, courseVO.getTargetStudentNumber());//募資人數
			pstmt.setDate(10, courseVO.getFundStartDate());//募資開始日期
			pstmt.setDate(11, courseVO.getFundEndDate());//募資結束日期
			pstmt.setDate(12, courseVO.getCourseStartDate());//課程開始上線日期
			pstmt.setString(13, courseVO.getCourseVideopathway());//課程影片
			pstmt.setBlob(14, courseVO.getPaper());//課程講義
			pstmt.setInt(15, courseVO.getStatus());//課程狀態(草稿、上線、下架等...)			
			pstmt.setString(16, courseVO.getCourseContent());//課程介紹內容
			pstmt.setInt(17, courseVO.getMemberID());//會員編號
			pstmt.setDouble(18, courseVO.getAvgScore());//課程平均分數
			pstmt.setString(19, courseVO.getProposalVideopathway());//募資影片
			pstmt.executeUpdate();
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






	//以下為自動儲存草稿的功能
	@Override
	public void update(CourseVO courseVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try{
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE_Course);
			pstmt.setString(1, courseVO.getCourseName());//課程名稱
			pstmt.setBlob(2, courseVO.getcPhoto());//課程封面照片
			pstmt.setString(3, courseVO.getPreTool());//準備工具
			pstmt.setString(4, courseVO.getBackground());//背景知識
			pstmt.setString(5, courseVO.getAbility());//先備能力
			pstmt.setString(6, courseVO.getTargetgroup());//適合學習的族群
			pstmt.setInt(7, courseVO.getSoldPrice());//課程售價
			pstmt.setInt(8, courseVO.getCourseLength());//影片時間長度
			pstmt.setInt(9, courseVO.getTargetStudentNumber());//募資人數
			pstmt.setDate(10, courseVO.getFundStartDate());//募資開始日期
			pstmt.setDate(11, courseVO.getFundEndDate());//募資結束日期
			pstmt.setDate(12, courseVO.getCourseStartDate());//課程開始上線日期
			pstmt.setString(13, courseVO.getCourseVideopathway());//課程影片
			pstmt.setBlob(14, courseVO.getPaper());//課程講義						
			pstmt.setString(15, courseVO.getCourseContent());//課程介紹內容
			pstmt.setString(16, courseVO.getProposalVideopathway());//募資影片
			pstmt.setInt(17,courseVO.getCourseID());//課程ID
			pstmt.executeUpdate();
			
			
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


	//以下為刪除草稿的功能
	@Override
	public void delete(Integer courseID) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try{
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE_Course);
			pstmt.setInt(1,courseID);
			pstmt.executeUpdate();
			
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



	//選擇草稿、選擇單一課程頁面
	@Override
	public CourseVO findByPrimaryKey(Integer courseID) {
		CourseVO courseVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		try{
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(SELECT_ONE_Course);
			pstmt.setInt(1, courseID);
			ResultSet  rs=pstmt.executeQuery();
			if(rs.next()){
				courseVO=new CourseVO();
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
		
		return courseVO;
	}

	//會員後臺管理(選擇我的草稿、我開的課)、管理員後台待審核中的課程列表
	public List<CourseVO> findBymemberID(Integer memberID,Integer status) {
		List<CourseVO> CourseList = new LinkedList<CourseVO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		try{
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
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
		
		return CourseList;
	}

	//管理員改變課程狀態(通過審核、下架等等....)
	@Override
	public void updateStatus(CourseVO courseVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try{
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(CHANGE_Course_Stage);
			pstmt.setInt(1,courseVO.getStatus());
			pstmt.setInt(2,courseVO.getCourseID());
			pstmt.executeUpdate();
			
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
	public List<CourseVO> getAllonlineCourse() {
		// TODO Auto-generated method stub
		return null;
	}
	
	
	
	public static void main(String[] args) throws FileNotFoundException {
		CourseDAO_JDBC dao = new CourseDAO_JDBC();
		//新增課程
//		CourseVO CourseVO1 =new CourseVO();
//		CourseVO1.setSoldPrice(0);
//		CourseVO1.setCourseLength(0);
//		CourseVO1.setTargetStudentNumber(0);
//		CourseVO1.setStatus(0);
//		CourseVO1.setMemberID(100001);
//		CourseVO1.setAvgScore(0.0);
//		dao.insert(CourseVO1);
		
		
		//自動儲存草稿
		CourseVO CourseVO2 = new CourseVO();
		CourseVO2.setCourseName("java的基本功能介紹");//課程名稱
		CourseVO2.setcPhoto(new FileInputStream(new File("src/main/webapp/img/04.jpg")));
		CourseVO2.setPreTool("需要安裝Adobe CC 2017的版本");
		CourseVO2.setBackground("無限制");
		CourseVO2.setAbility("需要基本的美術觀念");
		CourseVO2.setTargetgroup("影像後製特效師、剪接師");
		CourseVO2.setSoldPrice(1000);
		CourseVO2.setCourseLength(10);
		CourseVO2.setTargetStudentNumber(20);
		CourseVO2.setFundStartDate(null);
		CourseVO2.setFundEndDate(java.sql.Date.valueOf("2017-10-24"));
		CourseVO2.setCourseStartDate(java.sql.Date.valueOf("2017-10-26"));
		CourseVO2.setCourseVideopathway("img/EEIT97(e_Look)第一版.mp4");
		CourseVO2.setPaper(new FileInputStream(new File("src/main/webapp/img/AE教學.pdf")));
		CourseVO2.setCourseContent("第一次使用 After Effects 將會出現歡迎對話框，您可以選擇 New Composition 建立新的合成，或是選擇 Open Project 開啟已儲存的 After Effects 專案。若是以後不需要顯示此歡迎對話框，只要將下方的「Show Welcome Screen at startup」取消勾選即可。");
		CourseVO2.setProposalVideopathway("");
		CourseVO2.setCourseID(200003);
		dao.update(CourseVO2);
		
		
		
		//刪除草稿功能
//		dao.delete(200002);
		
		
		//選擇草稿、選擇單一課程頁面
//		CourseVO CourseVO3 = dao.findByPrimaryKey(200003);
//		System.out.println(CourseVO3.getCourseID());
//		System.out.println(CourseVO3.getCourseName());
//		System.out.println(CourseVO3.getcPhoto());
//		System.out.println(CourseVO3.getPreTool());
//		System.out.println(CourseVO3.getBackground());
//		System.out.println(CourseVO3.getAbility());
//		System.out.println(CourseVO3.getTargetgroup());
//		System.out.println(CourseVO3.getSoldPrice());
//		System.out.println(CourseVO3.getCourseLength());
//		System.out.println(CourseVO3.getTargetStudentNumber());
//		System.out.println(CourseVO3.getFundStartDate());
//		System.out.println(CourseVO3.getFundEndDate());
//		System.out.println(CourseVO3.getCourseStartDate());
//		System.out.println(CourseVO3.getCourseVideopathway());
//		System.out.println(CourseVO3.getPaper());
//		System.out.println(CourseVO3.getStatus());
//		System.out.println(CourseVO3.getCourseContent());
//		System.out.println(CourseVO3.getMemberID());
//		System.out.println(CourseVO3.getAvgScore());
//		System.out.println(CourseVO3.getProposalVideopathway());

		
		//管理員改變課程狀態
//		CourseVO CourseVO4 = new CourseVO();
//		CourseVO4.setStatus(5);
//		CourseVO4.setCourseID(200003);
//		dao.updateStatus(CourseVO4);
		
		
		/*請勿刪除    這是測試將資料庫圖片寫出來的程式，後面可能會用到先寫起放 以備不時之需*/
//		String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
//		String url = "jdbc:sqlserver://localhost:1433;DatabaseName=elook";
//		String userid = "sa";
//		String passwd = "123456";
//		
//		Connection con = null;
//		PreparedStatement pstmt = null;
//		try {
//			Class.forName(driver);
//			con = DriverManager.getConnection(url, userid, passwd);
//			pstmt = con.prepareStatement("select Paper from Course");
//			ResultSet  rs=pstmt.executeQuery();
//			
//			while(rs.next()){
//				FileOutputStream fos=new FileOutputStream(new File("src/main/webapp/img/AE教學1.pdf"));
//				Blob b= rs.getBlob(1);
//				byte[] data=b.getBytes(1, (int)b.length());
//				fos.write(data, 0, (int)b.length());
//				fos.close();
//			}
//		} catch (ClassNotFoundException e) {
//			
//			e.printStackTrace();
//		} catch (SQLException e) {
//		
//			e.printStackTrace();
//		} catch (IOException e) {
//			
//			e.printStackTrace();
//		}finally {
//			if (pstmt != null) {
//				try {
//					pstmt.close();
//				} catch (SQLException e) {
//					e.printStackTrace(System.err);
//				}
//			}
//			if (con != null) {
//				try {
//					con.close();
//				} catch (Exception e) {
//					e.printStackTrace(System.err);
//				}
//			}
//		
//		}
		
		
	}








}
