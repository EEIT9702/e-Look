package com.e_Look.eLookEvent;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.LinkedList;
import java.util.List;

import com.e_Look.buyCourse.model.BuyCourseVO;

public class eLookEventDAO_JDBC implements eLookEvent_interface {
	String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
	String url = "jdbc:sqlserver://localhost:1433;DatabaseName=elook";
	String userid = "sa";
	// 第一組密碼
	String passwd = "P@ssw0rd";
	// 第二組密碼
	// String passwd = "123456";

	private static final String INSERT_ELOOKEVENT = "insert into eLookEvent (eventName,ePhoto,eStartDate,eEndDate,discount) values ( ?, ?, ?, ?, ?)";
	private static final String UPDATE_ELOOKEVENT = "update eLookEvent set eventName=?, ePhoto=?, eStartDate=?, eEndDate=?, discount=? where eventID= ?";
	private static final String DELETE_ELOOKEVENT = "delete from eLookEvent where eventID= ?";
	private static final String SELECT_ONE_ELOOKEVENT = "select eventID,eventName ,ePhoto,eStartDate,eEndDate,discount from eLookEvent where eventID= ?";
	private static final String SELECT_ALL_ELOOKEVENT = "select eventID,eventName ,ePhoto,eStartDate,eEndDate,discount from eLookEvent";

	@Override
	public void insert(eLookEventVO eLookEventVO) {

		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);

			pstmt = con.prepareStatement(INSERT_ELOOKEVENT);
			pstmt.setString(1, eLookEventVO.getEventName());
			pstmt.setBlob(2, eLookEventVO.getePhoto());
			pstmt.setDate(3, eLookEventVO.geteStartDate());
			pstmt.setDate(4, eLookEventVO.geteEndDate());
			pstmt.setDouble(5, eLookEventVO.getDiscount());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			throw new RuntimeException("A database error occured. " + e.getMessage());
		} catch (ClassNotFoundException e) {

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
	public void delete(Integer eventID) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE_ELOOKEVENT);
			pstmt.setInt(1, eventID);

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
	public void update(eLookEventVO eLookEventVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE_ELOOKEVENT);
			pstmt.setString(1, eLookEventVO.getEventName());
			pstmt.setBlob(2, eLookEventVO.getePhoto());
			pstmt.setDate(3, eLookEventVO.geteStartDate());
			pstmt.setDate(4, eLookEventVO.geteEndDate());
			pstmt.setDouble(5, eLookEventVO.getDiscount());
			pstmt.setInt(6, eLookEventVO.getEventID());
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
	public eLookEventVO findByPrimaryKey(Integer eventID) {
		eLookEventVO eLookEventVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(SELECT_ONE_ELOOKEVENT);
			pstmt.setInt(1, eventID);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				eLookEventVO = new eLookEventVO();
				eLookEventVO.setEventID(rs.getInt(1));
				eLookEventVO.setEventName(rs.getString(2));
				eLookEventVO.setePhoto(rs.getBinaryStream(3));
				eLookEventVO.seteStartDate(rs.getDate(4));
				eLookEventVO.seteEndDate(rs.getDate(5));
				eLookEventVO.setDiscount(rs.getDouble(6));
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
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return eLookEventVO;
	}

	@Override
	public List<eLookEventVO> getAll() {
		List<eLookEventVO> list = new LinkedList<eLookEventVO>();

		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(SELECT_ALL_ELOOKEVENT);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				eLookEventVO eLookEventVO = new eLookEventVO();
				eLookEventVO = new eLookEventVO();
				eLookEventVO.setEventID(rs.getInt(1));
				eLookEventVO.setEventName(rs.getString(2));
				eLookEventVO.setePhoto(rs.getBinaryStream(3));
				eLookEventVO.seteStartDate(rs.getDate(4));
				eLookEventVO.seteEndDate(rs.getDate(5));
				eLookEventVO.setDiscount(rs.getDouble(6));
				list.add(eLookEventVO);
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
		//insert一筆資料
		eLookEventDAO_JDBC daoJDBC=new eLookEventDAO_JDBC();
		
//		eLookEventVO dao = new eLookEventVO();
//		dao.setEventName("萬聖節派對");
//		
//		
//		try {
//			dao.seteStartDate(new Date(System.currentTimeMillis()));
//			dao.seteEndDate(new Date(System.currentTimeMillis()));
//			dao.setePhoto(new FileInputStream(new File("D:/A550/GRD/R0014769.JPG")));
//		} catch (FileNotFoundException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		
//		dao.setDiscount(0.8);
//		daoJDBC.insert(dao);
		
		
		//查單筆
		eLookEventVO list1 = daoJDBC.findByPrimaryKey(1001);
	
			System.out.print(list1.getEventName()+",");
			System.out.print(list1.getePhoto()+",");
			System.out.print(list1.geteStartDate()+",");
			System.out.print(list1.geteEndDate()+",");
			System.out.print(list1.getDiscount()+",");
			
		//查全部
//		List<eLookEventVO> list2 = daoJDBC.getAll();
//		for(eLookEventVO eLookEventVO:list2){
//			System.out.print(eLookEventVO.getEventName()+",");
//			System.out.print(eLookEventVO.geteStartDate()+",");
//			System.out.print(eLookEventVO.geteEndDate()+",");
//			System.out.print(eLookEventVO.getDiscount()+",");
//		}
	}

}
