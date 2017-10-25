package com.e_Look.OrderDetails.model;

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


public class OrderDetailsDAO implements OrderDetailsDAO_interface {
	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/eLookDB");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	private static final String INSERT_ORDERDETAILS = "insert into OrderDetails (orderID,courseID,buyingPrice,originalPrice) values(?,?,?,?)";
	private static final String UPDATE_ORDERDETAILS = "update OrderDetails set orderID=?,courseID=?,buyingPrice=?,originalPrice=? where orderID=? and courseID=?";
	private static final String DELETE_ORDERDETAILS = "delete from OrderDetails where orderID=? and courseID=?";
	private static final String SELECT_ORDER_ORDERDETAILS = "select orderID,courseID,buyingPrice,originalPrice from OrderDetails where orderID = ?";
	private static final String SELECT_ALL_ORDERDETAILS = "select orderID,courseID,buyingPrice,originalPrice from OrderDetails";
	
	
	@Override
	public void insert(OrderDetailsVO orderDetailsVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = ds.getConnection();		
			pstmt=con.prepareStatement(INSERT_ORDERDETAILS);
			pstmt.setInt(1, orderDetailsVO.getOrderID());
			pstmt.setInt(2, orderDetailsVO.getCourseID());
			pstmt.setInt(3, orderDetailsVO.getBuyingPrice());
			pstmt.setInt(4, orderDetailsVO.getOriginalPrice());
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
	public void update(OrderDetailsVO orderDetailsVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = ds.getConnection();		
			pstmt=con.prepareStatement(UPDATE_ORDERDETAILS);
			pstmt.setInt(1, orderDetailsVO.getOrderID());
			pstmt.setInt(2, orderDetailsVO.getCourseID());
			pstmt.setInt(3, orderDetailsVO.getBuyingPrice());
			pstmt.setInt(4, orderDetailsVO.getOriginalPrice());
			pstmt.setInt(5, orderDetailsVO.getOrderID());
			pstmt.setInt(6, orderDetailsVO.getCourseID());
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
	public void delete(OrderDetailsVO orderDetailsVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = ds.getConnection();		
			pstmt=con.prepareStatement(DELETE_ORDERDETAILS);
			pstmt.setInt(1, orderDetailsVO.getOrderID());
			pstmt.setInt(2, orderDetailsVO.getCourseID());
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
	public List<OrderDetailsVO> findByOrderID(Integer orderID) {
		List<OrderDetailsVO> list =new LinkedList<OrderDetailsVO>();

		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = ds.getConnection();		
			pstmt=con.prepareStatement(SELECT_ORDER_ORDERDETAILS);
			pstmt.setInt(1, orderID);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()){
				OrderDetailsVO vo = new OrderDetailsVO();
				vo.setOrderID(rs.getInt(1));
				vo.setCourseID(rs.getInt(2));
				vo.setBuyingPrice(rs.getInt(3));
				vo.setOriginalPrice(rs.getInt(4));
				list.add(vo);
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
		return list;
	}
	@Override
	public List<OrderDetailsVO> getAll() {
		List<OrderDetailsVO> list =new LinkedList<OrderDetailsVO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = ds.getConnection();		
			pstmt=con.prepareStatement(SELECT_ALL_ORDERDETAILS);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()){
				OrderDetailsVO vo = new OrderDetailsVO();
				vo.setOrderID(rs.getInt(1));
				vo.setCourseID(rs.getInt(2));
				vo.setBuyingPrice(rs.getInt(3));
				vo.setOriginalPrice(rs.getInt(4));
				list.add(vo);
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
		return list;
	}
	
	
	
	
	
	
}
