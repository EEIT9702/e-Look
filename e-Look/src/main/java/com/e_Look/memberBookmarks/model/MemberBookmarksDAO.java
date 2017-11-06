package com.e_Look.memberBookmarks.model;

import java.util.List;

import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
@Transactional(readOnly=false)
public class MemberBookmarksDAO implements MemberBookmarksDAO_interface {
	public HibernateTemplate hibernateTemplate;
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate){
		this.hibernateTemplate=hibernateTemplate;
	}
	
	private static final String INSERT_MEMBERBOOKMARKS =
			"INSERT INTO MemberBookmarks (memberID, courseID) VALUES (?,?) ";
	private static final String UPDATE_MEMBERBOOKMARKS =
			"UPDATE MemberBookmarks SET courseID=? WHERE memberID=?";
	private static final String DELETE_MEMBERBOOKMARKS =
		    "DELETE FROM MemberBookmarks WHERE memberID =? and courseID =?";
	private static final String SELECT_ONE_MEMBERBOOKMARKS =
			"SELECT memberID, courseID FROM MemberBookmarksVO WHERE memberID=?";
	private static final String SELECT_ALL_MEMBERBOOKMARKS =
			"SELECT memberID, courseID FROM MemberBookmarks";
	
	
	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public void insert(MemberBookmarksVO MemberBookmarksVO) {
		hibernateTemplate.save(MemberBookmarksVO);
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public void update(MemberBookmarksVO MemberBookmarksVO) {
		hibernateTemplate.saveOrUpdate(MemberBookmarksVO);
	

	}
	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public void delete(Integer memberID, Integer courseID) {
		hibernateTemplate.bulkUpdate("DELETE FROM MemberBookmarksVO WHERE memberID =? and courseID =?", memberID,courseID);
	}
	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public List<MemberBookmarksVO> findByMemberID(Integer memberID) {
		List<MemberBookmarksVO> list =(List<MemberBookmarksVO>) hibernateTemplate.find("FROM MemberBookmarksVO WHERE memberID=?",memberID);
			//"SELECT memberID, courseID FROM MemberBookmarks WHERE memberID=?";
		return list;
	}
	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public List<MemberBookmarksVO> getAll() {
		List<MemberBookmarksVO> list = (List<MemberBookmarksVO>) hibernateTemplate.find("FROM MemberBookmarksVO");
		return list;
	}
	public static void main(String[] args) {
		MemberBookmarksDAO memberBookmarksDAO=new MemberBookmarksDAO();
		memberBookmarksDAO.delete(100003, 200004);
	}
}
