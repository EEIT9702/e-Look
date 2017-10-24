package com.e_Look.Order.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

public class OrderDAO_JDBC implements OrderDAO_interface {
	String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
	String url = "jdbc:sqlserver://localhost:1433;DatabaseName=elook";
	String userid = "sa";
	//第一組密碼
	String passwd = "P@ssw0rd";
	//第二組密碼
	//String passwd = "123456";
	private static final String INSERT_Order = "insert into Order (memberID,receiptNO,orderTime) values (?,?,?)"; 
	private static final String UPDATE_Order = "update Order set memberID=? receiptNO=? orderTime=? where OrderID=?"; 
	private static final String DELETE_Order = "delete from Order where OrderID=?"; 
	private static final String SELECT_Order = "select OrderID,memberID,receiptNO,orderTime from Order where OrderID=?";
	private static final String SELECT_ALL_Order = "select OrderID,memberID,receiptNO,orderTime from Order";
	@Override
	public void insert(OrderVO orderVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);		
			pstmt=con.prepareStatement(INSERT_Order);
			pstmt.setInt(1,orderVO.getMemberID());
			pstmt.setString(2,orderVO.getReceiptNO());
			pstmt.setDate(3,orderVO.getOrderTime());
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
	public void update(OrderVO orderVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);		
			pstmt=con.prepareStatement(UPDATE_Order);
			pstmt.setInt(1,orderVO.getMemberID());
			pstmt.setString(2,orderVO.getReceiptNO());
			pstmt.setDate(3,orderVO.getOrderTime());
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
	public void delete(Integer orderID) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);		
			
			pstmt=con.prepareStatement(DELETE_Order);
			
			pstmt.setInt(1,orderID);
			
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
	public OrderVO findByPrimaryKey(Integer orderID) {
		OrderVO orderVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(SELECT_Order);
			pstmt.setInt(1, orderID);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				orderVO = new OrderVO();
				orderVO.setOrderID(rs.getInt(1));
				orderVO.setMemberID(rs.getInt(2));
				orderVO.setReceiptNO(rs.getString(3));
				orderVO.setOrderTime(rs.getDate(4));
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
		return orderVO;
	}

	@Override
	public List<OrderVO> getAll() {
		List<OrderVO> list = new LinkedList<OrderVO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);	
			
			pstmt = con.prepareStatement(SELECT_ALL_Order);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				
				OrderVO orderVO= new OrderVO();
				orderVO.setOrderID(rs.getInt(1));
				orderVO.setMemberID(rs.getInt(2));
				orderVO.setReceiptNO(rs.getString(3));
				orderVO.setOrderTime(rs.getDate(4));
				list.add(orderVO);
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

	public static void main(String[] args) {
		
		OrderDAO_JDBC dao=new OrderDAO_JDBC();
		OrderVO vo=new OrderVO();
		
		
		
		
		
		
	}
}
