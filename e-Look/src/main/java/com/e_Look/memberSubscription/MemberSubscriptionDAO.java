package com.e_Look.memberSubscription;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Transactional(readOnly=false)
public class MemberSubscriptionDAO implements MemberSubscriptionDAO_interface {
	public HibernateTemplate hibernateTemplate;
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate){
		this.hibernateTemplate = hibernateTemplate;
	}
	
	private static final String INSERT_MEMBERSUBSCRIPTION =
			"INSERT INTO MemberSubscription (memberID, memberTrackID) VALUES (?,?) ";
	//UPDATE寫著,但應該用不到
	private static final String UPDATE_MEMBERSUBSCRIPTION =
			"UPDATE MemberSubscription SET memberTrackID=? WHERE memberID=?";
	private static final String DELETE_MEMBERSUBSCRIPTION =
		    "DELETE FROM MemberSubscription WHERE memberID=? and memberTrackID =?";
	private static final String SELECT_ONE_MEMBERSUBSCRIPTION =
			"SELECT memberTrackID, memberID FROM MemberSubscription WHERE memberID=?";
	private static final String SELECT_ALL_MEMBERSUBSCRIPTION =
			"SELECT memberTrackID, memberID FROM MemberSubscription";
	
	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public void insert(MemberSubscriptionVO memberSubscriptionVO) {
		hibernateTemplate.save(memberSubscriptionVO);
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public void update(MemberSubscriptionVO memberSubscriptionVO) {
		hibernateTemplate.update(memberSubscriptionVO);
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public void delete(Integer memberID, Integer memberTrackID) {
		//hibernateTemplate.delete(memberID);
		hibernateTemplate.bulkUpdate("DELETE FROM MemberSubscriptionVO WHERE memberID=? and memberTrackID =?", memberID, memberTrackID);
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public List<MemberSubscriptionVO> findByMemberID(Integer memberID) {
		List<MemberSubscriptionVO> list = (List<MemberSubscriptionVO>) hibernateTemplate.find("FROM MemberSubscriptionVO WHERE memberID=?", memberID);	
		return list;
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public List<MemberSubscriptionVO> getAll() {
		List<MemberSubscriptionVO> list = (List<MemberSubscriptionVO>) hibernateTemplate.find("FROM MemberSubscriptionVO");
		return list;
	}


	public static void main(String[] args) {
		
		ApplicationContext context = new ClassPathXmlApplicationContext("beans-config.xml");
		
		// 建立DAO物件
		MemberSubscriptionDAO_interface dao = (MemberSubscriptionDAO_interface) context.getBean("memberSubscriptionDAO");
		
		//新增
//		MemberSubscriptionVO msVO1 = new MemberSubscriptionVO();
//		msVO1.setMemberID(100001);
//		msVO1.setMemberTrackID(100002);
//		dao.insert(msVO1);
		
		//修改 >>> 沒主鍵,所以修改只會新增,勿用
//		MemberSubscriptionVO msVO2 = new MemberSubscriptionVO();
//		msVO2.setMemberID(100001);
//		msVO2.setMemberTrackID(100004);
//		dao.insert(msVO2);
		
		//刪除
//		MemberSubscriptionVO msVO3 = new MemberSubscriptionVO();
//		dao.delete(100001,100004);
		
		//查詢單一
//		List<MemberSubscriptionVO> list1 =  dao.findByMemberID(100001);
//		for(MemberSubscriptionVO msVO4 : list1) {
//			System.out.println(msVO4.getMemberID() + ", " + msVO4.getMemberTrackID());
//		}
//		System.out.println("-------------------------");
		
		//查詢全部
		List<MemberSubscriptionVO> listAll = dao.getAll();
		for(MemberSubscriptionVO msVO5 : listAll){
			System.out.println(msVO5.getMemberID() + ", track: " + msVO5.getMemberTrackID());
		}
	}

}
