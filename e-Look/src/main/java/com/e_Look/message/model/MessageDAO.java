package com.e_Look.message.model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.e_Look.member.model.messageVO;

public class MessageDAO implements MessageDAO_interface {
	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/eLookDB");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	private static final String INSERT_MESSAGE = "insert into Message ( mContent,mTime,messageID_response,memberID,courseID,bought,status) values ( ?, ?, ?, ?, ?, ?,?)";
	private static final String UPDATE_MESSAGE = "update Message set mContent=?, mTime=?, messageID_response=? where messageID= ?";
	private static final String UPDATE_STATUS = "update Message set status=? where messageID= ?";
	private static final String DELETE_MESSAGE = "delete from Message where messageID= ?";
	private static final String SELECT_ONE_MESSAGE = "select messageID,mContent,mTime,messageID_response,memberID,courseID,bought,status from Message where messageID= ?";
	private static final String SELECT_ALL_MESSAGE = "select messageID,mContent,mTime,messageID_response,memberID,courseID,bought,status from Message";
		
	@Override
	public void insert(MessageVO messageVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_MESSAGE);
			pstmt.setString(1, messageVO.getmContent());
			pstmt.setDate(2, messageVO.getmTime());
			pstmt.setInt(3, messageVO.getMessageID_response());
			pstmt.setInt(4, messageVO.getMemberID());
			pstmt.setInt(5, messageVO.getCourseID());
			pstmt.setLong(6, messageVO.getBought());
			pstmt.setByte(7, messageVO.getStatus());
			
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
	public void update(MessageVO messageVO, String update) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = ds.getConnection();
			if (update.equalsIgnoreCase("member")) {
				pstmt = con.prepareStatement(UPDATE_MEMBER);
				pstmt.setString(1, messageVO.getEmail());
				pstmt.setString(2, messageVO.getmPassword());
				pstmt.setString(3, messageVO.getmName());
			//	pstmt.setBlob(4, messageVO.getmPhoto());
				pstmt.setString(4, messageVO.getSkill());
				pstmt.setString(5, messageVO.getHobby());
				pstmt.setString(6, messageVO.getAddress());
				pstmt.setInt(7, messageVO.getMemberID());
				pstmt.executeUpdate();
			} else if (update.equalsIgnoreCase("status")) {
				pstmt = con.prepareStatement(UPDATE_STATUS);
				pstmt.setByte(1, messageVO.getStatus());
				pstmt.setInt(2, messageVO.getMemberID());
				pstmt.executeUpdate();
			} else if (update.equalsIgnoreCase("count")) {
				pstmt = con.prepareStatement(UPDATE_COUNT);
				pstmt.setInt(1, messageVO.getCount());
				pstmt.setInt(2, messageVO.getMemberID());
				pstmt.executeUpdate();
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
		
	}

	@Override
	public void delete(Integer messageID) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE_MEMBER);
			pstmt.setInt(1, memberID);
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
	public MessageVO findByPrimaryKey(Integer messageID) {
		messageVO messageVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(SELECT_ONE_MEMBER);
			pstmt.setInt(1, memberID);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				messageVO = new messageVO();
				messageVO.setMemberID(rs.getInt(1));
				messageVO.setEmail(rs.getString(2));
				messageVO.setmPassword(rs.getString(3));
				messageVO.setmName(rs.getString(4));
				messageVO.setmPhoto(rs.getBinaryStream(5));
				messageVO.setSkill(rs.getString(6));
				messageVO.setHobby(rs.getString(7));
				messageVO.setRegisterDate(rs.getDate(8));
				messageVO.setStatus(rs.getByte(9));
				messageVO.setCount(rs.getInt(10));
				messageVO.setAddress(rs.getString(11));
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
		return messageVO;
		
	}

	@Override
	public List<MessageVO> getAll() {
		List<messageVO> list = new LinkedList<messageVO>();

		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(SELECT_ALL_MEMBER);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				messageVO messageVO = new messageVO();
				messageVO.setMemberID(rs.getInt(1));
				messageVO.setEmail(rs.getString(2));
				messageVO.setmPassword(rs.getString(3));
				messageVO.setmName(rs.getString(4));
				messageVO.setmPhoto(rs.getBinaryStream(5));
				messageVO.setSkill(rs.getString(6));
				messageVO.setHobby(rs.getString(7));
				messageVO.setRegisterDate(rs.getDate(8));
				messageVO.setStatus(rs.getByte(9));
				messageVO.setCount(rs.getInt(10));
				messageVO.setAddress(rs.getString(11));
				list.add(messageVO);
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
