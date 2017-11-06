package com.e_Look.shoppingCart.model.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.naming.spi.DirStateFactory.Result;
import javax.sql.DataSource;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.e_Look.Course.*;
import com.e_Look.sponsor.model.SponsorDAO_interface;
import com.e_Look.sponsor.model.SponsorVO;
@Transactional(readOnly = true)
public class ShoppingCartDAO implements ShoppingCartDAO_interface {
	public HibernateTemplate hibernateTemplate;
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate){
		this.hibernateTemplate = hibernateTemplate;
	}
	
	private static final String DELETE_SHOPPINGCART = "DELETE ShoppingCartVO where memberID=? and courseID=?";
	private static final String SELECT_MEMBER_SHOPPINGCART = "from ShoppingCartVO where memberID=?";
	private static final String SELECT_ALL_SHOPPINGCART = "from ShoppingCartVO";
	private static final String SELECT_ONE_SHOPPINGCART = "from ShoppingCartVO where memberID=? and courseID=?";

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void insert(ShoppingCartVO shoppingCartVO) {
		hibernateTemplate.saveOrUpdate(shoppingCartVO);
	}


	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void delete(ShoppingCartVO shoppingCartVO) {
		hibernateTemplate.bulkUpdate(DELETE_SHOPPINGCART, shoppingCartVO.getMemberID(),shoppingCartVO.getCourseVO().getCourseID());
	}

	@Override
	public List<CourseVO> findByMemberID(Integer memberID) {
		List<ShoppingCartVO> ShoppingCartVOlist = (List<ShoppingCartVO>) hibernateTemplate.find(SELECT_MEMBER_SHOPPINGCART,memberID);
		List<CourseVO> list = new LinkedList<CourseVO>();
		for(ShoppingCartVO shoppingCartVO: ShoppingCartVOlist){
			list.add(shoppingCartVO.getCourseVO());
		}
		return list;
	}

	@Override
	public List<ShoppingCartVO> getAll() {
		List<ShoppingCartVO> list = (List<ShoppingCartVO>) hibernateTemplate.find(SELECT_ALL_SHOPPINGCART);
		return list;
	}

	@Override
	public ShoppingCartVO findByPrimaryKey(ShoppingCartVO shoppingCartVO) {
		List<ShoppingCartVO> list = (List<ShoppingCartVO>) hibernateTemplate.find(SELECT_ONE_SHOPPINGCART,shoppingCartVO.getMemberID(),shoppingCartVO.getCourseVO().getCourseID());
		ShoppingCartVO shoppingCartVO1=null;
		if(list.size()>0){
			shoppingCartVO1=list.get(0);	
			return shoppingCartVO1;	
		}
		return shoppingCartVO1;
	}


	@Override
	public void update(ShoppingCartVO shoppingCartVO, ShoppingCartVO shoppingCartVO2) {
		// TODO Auto-generated method stub
		
	}
	public static void main(String[] args) {
		ApplicationContext context = new ClassPathXmlApplicationContext("beans-config.xml");
		ShoppingCartDAO_interface dao= (ShoppingCartDAO_interface) context.getBean("shoppingCartDAO");		
	
		
		CourseVO courseVO = new CourseVO();
		courseVO.setCourseID(200001);
		ShoppingCartVO shoppingCartVO = new ShoppingCartVO();
		shoppingCartVO.setCourseVO(courseVO);
		shoppingCartVO.setMemberID(100005);
		
		ShoppingCartVO shoppingCartVO1=dao.findByPrimaryKey(shoppingCartVO);
//		dao.insert(shoppingCartVO);
		System.out.println(shoppingCartVO1);
//		System.out.println(dao.getAll().size());
		
		
		
	}
	
	
}
