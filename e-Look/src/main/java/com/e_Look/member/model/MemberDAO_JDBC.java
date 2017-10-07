package com.e_Look.member.model;

import java.io.FileNotFoundException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;


public class MemberDAO_JDBC implements MemberDAO_interface{
	String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
	String url = "jdbc:sqlserver://localhost:1433;DatabaseName=elook";
	String userid = "sa";
	//第一組密碼
	String passwd = "P@ssw0rd";
	//第二組密碼
	//String passwd = "123456";
	private static final String INSERT_MEMBER =
		      "insert into Member ( email,mPassword,mName,mPhoto,skill,hobby,registerDate,status,count,address) values ( ?, ?, ?, ?, ?, ?,?, ?, ?, ?)";
	private static final String UPDATE_MEMBER =
		      "update Member set email=?, mPassword=?, mName=?, mPhoto=?, skill=?, hobby=?, address=? where memberID= ?";
	private static final String UPDATE_STATUS =
		      "update Member set status=? where memberID= ?";
	private static final String UPDATE_COUNT =
		      "update Member set count=? where memberID= ?";
	private static final String DELETE_MEMBER =
		      "delete from Member where memberID= ?";
	private static final String SELECT_ONE_MEMBER =
		      "select memberID ,email,mPassword,mName,mPhoto,skill,hobby,registerDate,status,count,address from Member where memberID= ?";
	private static final String SELECT_ALL_MEMBER =
		      "select memberID ,email,mPassword,mName,mPhoto,skill,hobby,registerDate,status,count,address from Member";
	@Override
	public void insert(MemberVO memberVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_MEMBER);
			pstmt.setString(1,memberVO.getEmail());
			pstmt.setString(2,memberVO.getmPassword());
			pstmt.setString(3,memberVO.getmName());
			pstmt.setBlob(4,memberVO.getmPhoto());
			pstmt.setString(5,memberVO.getSkill());
			pstmt.setString(6,memberVO.getHobby());
			pstmt.setDate(7,memberVO.getRegisterDate());
			pstmt.setByte(8,memberVO.getStatus());
			pstmt.setInt(9,memberVO.getCount());
			pstmt.setString(10,memberVO.getAddress());
			pstmt.executeUpdate();
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
		
	}

	@Override
	public void update(MemberVO memberVO,String update) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			if(update.equalsIgnoreCase("member")){
			pstmt = con.prepareStatement(UPDATE_MEMBER);
			pstmt.setString(1,memberVO.getEmail());
			pstmt.setString(2,memberVO.getmPassword());
			pstmt.setString(3,memberVO.getmName());
			pstmt.setBlob(4,memberVO.getmPhoto());
			pstmt.setString(5,memberVO.getSkill());
			pstmt.setString(6,memberVO.getHobby());
			pstmt.setString(7,memberVO.getAddress());
			pstmt.setInt(8,memberVO.getMemberID());
			pstmt.executeUpdate();
			}else if(update.equalsIgnoreCase("status")){
				pstmt = con.prepareStatement(UPDATE_STATUS);
				pstmt.setByte(1,memberVO.getStatus());
				pstmt.setInt(2,memberVO.getMemberID());
				pstmt.executeUpdate();
			}else if(update.equalsIgnoreCase("count")){
				pstmt = con.prepareStatement(UPDATE_COUNT);
				pstmt.setInt(1,memberVO.getCount());
				pstmt.setInt(2,memberVO.getMemberID());
				pstmt.executeUpdate();
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
	}

	@Override
	public void delete(Integer memberID) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE_MEMBER);
			pstmt.setInt(1, memberID);
			pstmt.executeUpdate();
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
	}

	@Override
	public MemberVO findByPrimaryKey(Integer memberID) {
		MemberVO memberVO=null;
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(SELECT_ONE_MEMBER);
			pstmt.setInt(1, memberID);
			ResultSet  rs=pstmt.executeQuery();
			if(rs.next()){
				memberVO=new MemberVO();
				memberVO.setMemberID(rs.getInt(1));
				memberVO.setEmail(rs.getString(2));
				memberVO.setmPassword(rs.getString(3));
				memberVO.setmName(rs.getString(4));
				memberVO.setmPhoto(rs.getBinaryStream(5));
				memberVO.setSkill(rs.getString(6));
				memberVO.setHobby(rs.getString(7));
				memberVO.setRegisterDate(rs.getDate(8));
				memberVO.setStatus(rs.getByte(9));
				memberVO.setCount(rs.getInt(10));
				memberVO.setAddress(rs.getString(11));
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
		return memberVO;
	}

	@Override
	public List<MemberVO> getAll() {
		List<MemberVO> list =new LinkedList<MemberVO>();

		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(SELECT_ALL_MEMBER);
			ResultSet  rs=pstmt.executeQuery();
			while(rs.next()){
				MemberVO memberVO=new MemberVO();
				memberVO.setMemberID(rs.getInt(1));
				memberVO.setEmail(rs.getString(2));
				memberVO.setmPassword(rs.getString(3));
				memberVO.setmName(rs.getString(4));
				memberVO.setmPhoto(rs.getBinaryStream(5));
				memberVO.setSkill(rs.getString(6));
				memberVO.setHobby(rs.getString(7));
				memberVO.setRegisterDate(rs.getDate(8));
				memberVO.setStatus(rs.getByte(9));
				memberVO.setCount(rs.getInt(10));
				memberVO.setAddress(rs.getString(11));
				list.add(memberVO);
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
		return list;
	}
	
	public static void main(String[] args) throws FileNotFoundException {
		MemberDAO_JDBC dao = new MemberDAO_JDBC();
//		//新增會員
//		MemberVO memberVO1= new MemberVO();
//		memberVO1.setmName("李XX");
//		memberVO1.setEmail("abc852855230@yahyy.com.tw");
//		memberVO1.setmPassword("XXXX");
//		memberVO1.setRegisterDate(new Date(System.currentTimeMillis()));
//		memberVO1.setStatus((byte) 0);
//		memberVO1.setCount(1);
//		memberVO1.setmPhoto(new FileInputStream(new File("src/main/webapp/img/imember_image.png")));
//		dao.insert(memberVO1);
//		//修改會員資料
//		MemberVO memberVO2= new MemberVO();
//		memberVO2.setMemberID(100001);
//		memberVO2.setEmail("xxx@yahoo.com.tw");
//		memberVO2.setmPassword("123456");
//		memberVO2.setmPhoto(new FileInputStream(new File("src/main/webapp/img/sgicon.gif")));
//		dao.update(memberVO2, "member");
//		//修改會員狀態
//		memberVO2.setMemberID(100002);
//		memberVO2.setStatus((byte) 1);
//		dao.update(memberVO2, "status");
//		//修改會員違規次數
//		memberVO2.setMemberID(100002);
//		memberVO2.setCount(2);
//		dao.update(memberVO2, "count");
		//刪除會員
//		dao.delete(100008);
		//查詢單一會員
//		MemberVO memberVO3=dao.findByPrimaryKey(100003);
//		System.out.println(memberVO3.getMemberID());
//		System.out.println(memberVO3.getEmail());
//		System.out.println(memberVO3.getmPassword());
//		System.out.println(memberVO3.getmName());
//		System.out.println(memberVO3.getmPhoto());
//		System.out.println(memberVO3.getSkill());
//		System.out.println(memberVO3.getHobby());
//		System.out.println(memberVO3.getRegisterDate());
//		System.out.println(memberVO3.getStatus());
//		System.out.println(memberVO3.getCount());
//		System.out.println(memberVO3.getAddress());
		//查詢全部會員
		List<MemberVO> list=dao.getAll();
		for(MemberVO memberVO :list){
			System.out.print(memberVO.getMemberID()+"  ");
			System.out.print(memberVO.getEmail()+"  ");
			System.out.print(memberVO.getmPassword()+"  ");
			System.out.print(memberVO.getmName()+"  ");
			System.out.print(memberVO.getmPhoto()+"  ");
			System.out.print(memberVO.getSkill()+"  ");
			System.out.print(memberVO.getHobby()+"  ");
			System.out.print(memberVO.getRegisterDate()+"  ");
			System.out.print(memberVO.getStatus()+"  ");
			System.out.print(memberVO.getCount()+"  ");
			System.out.println(memberVO.getAddress());
		}
	}
}



















/*請勿刪除    這是測試將資料庫圖片寫出來的程式，後面可能會用到先寫起放 以備不時之需*/
//String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
//String url = "jdbc:sqlserver://localhost:1433;DatabaseName=elook";
//String userid = "sa";
//String passwd = "P@ssw0rd";
//
//Connection con = null;
//PreparedStatement pstmt = null;
//try {
//	Class.forName(driver);
//	con = DriverManager.getConnection(url, userid, passwd);
//	pstmt = con.prepareStatement("select memberID, mPhoto from Member");
//	ResultSet  rs=pstmt.executeQuery();
//	
//	while(rs.next()){
//		FileOutputStream fos=new FileOutputStream(new File("src/main/webapp/img/"+rs.getString(1)+".png"));
//		Blob b= rs.getBlob(2);
//		byte[] data=b.getBytes(1, (int)b.length());
//		fos.write(data, 0, (int)b.length());
//		fos.close();
//	}
//} catch (ClassNotFoundException e) {
//	
//	e.printStackTrace();
//} catch (SQLException e) {
//
//	e.printStackTrace();
//} catch (IOException e) {
//	
//	e.printStackTrace();
//}finally {
//	if (pstmt != null) {
//		try {
//			pstmt.close();
//		} catch (SQLException e) {
//			e.printStackTrace(System.err);
//		}
//	}
//	if (con != null) {
//		try {
//			con.close();
//		} catch (Exception e) {
//			e.printStackTrace(System.err);
//		}
//	}
//
//}
