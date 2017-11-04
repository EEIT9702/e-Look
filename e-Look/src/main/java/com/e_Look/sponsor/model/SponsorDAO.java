package com.e_Look.sponsor.model;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.orm.hibernate5.HibernateTemplate;

import com.e_Look.Course.CourseDAO_interface;

public class SponsorDAO implements SponsorDAO_interface {
	public HibernateTemplate hibernateTemplate;
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate){
		this.hibernateTemplate = hibernateTemplate;
	}

	
	private static final String SELECT_ONE_SPONSOR = "FROM SponsorVO WHERE courseID=?";

	

	@Override
	public void insert(SponsorVO sponsorVO) {
		 hibernateTemplate.saveOrUpdate(sponsorVO);	
	}


	@Override
	public void delete(Integer courseID) {
		SponsorVO sponsorVO = new SponsorVO();
		sponsorVO.setCourseID(courseID);
		hibernateTemplate.delete(sponsorVO);
	}

	@Override
	public SponsorVO findByCourseID(Integer courseID) {
		SponsorVO sponsorVO = hibernateTemplate.get(SponsorVO.class,courseID);
		return sponsorVO;
	}

	@Override
	public List<SponsorVO> getCountMoney(Integer courseID) {
		List<SponsorVO> list = (List<SponsorVO>) hibernateTemplate.find(SELECT_ONE_SPONSOR,courseID);
		return list;
	}

	public List<SponsorVO> getAll() {
		List<SponsorVO> list = (List<SponsorVO>) hibernateTemplate.find("from SponsorVO");
		return list;
	}


	@Override
	public void update(SponsorVO sponsorVO) {
		// TODO Auto-generated method stub
		
	}
	public static void main(String[] args) {
		ApplicationContext context = new ClassPathXmlApplicationContext("beans-config.xml");
		SponsorDAO_interface dao =(SponsorDAO_interface) context.getBean("sponsorDAO");
		// 新增
		SponsorVO sponsorVO1 = new SponsorVO();
		sponsorVO1.setCourseID(200001);
		sponsorVO1.setSponsorName("王大明");
		sponsorVO1.setMoney(3000);
		SimpleDateFormat sdf= new SimpleDateFormat("yyyy-MM-dd");
		Date date=Date.valueOf(sdf.format(System.currentTimeMillis()));
		System.out.println(date);
		sponsorVO1.setDateSponsor(date);
		dao.insert(sponsorVO1);
		
		//修改
//		SponsorVO sponsorVO2 = new SponsorVO();
//		sponsorVO1.setCourseID(200001);
//		sponsorVO1.setSponsorName("王大明");
//		sponsorVO1.setMoney(500);
//		dao.update(sponsorVO2);
		
		//刪除
//		dao.delete(200001);
		
		//查詢單一
//		SponsorVO sponsorVO3 = dao.findByCourseID(200001);
//		System.out.println(sponsorVO3.getCourseID());
//		System.out.println(sponsorVO3.getSponsorName());
//		System.out.println(sponsorVO3.getMoney());
//		System.out.println("---------------------------");
		
		
		//查詢課程募款金額
//		List<SponsorVO> list = dao.getCountMoney(200001);
//		int count=0;
//		for(SponsorVO sponsorVO : list){
//			System.out.print(sponsorVO.getCourseID() + "  ");
//			System.out.print(sponsorVO.getSponsorName() + "  ");
//			
//			System.out.print(sponsorVO.getMoney()+"  ");
//			System.out.print(sponsorVO.getDateSponsor());
//			count+=sponsorVO.getMoney();
//		}
//		System.out.println(count);
//		System.out.println("---------------------------");
		
		//查詢全部
//		List<SponsorVO> list = dao.getAll();
//		for(SponsorVO sponsorVO : list){
//			System.out.print(sponsorVO.getCourseID() + "  ");
//			System.out.print(sponsorVO.getSponsorName() + "  ");
//			System.out.print(sponsorVO.getMoney()+" ");
//			System.out.println(sponsorVO.getDateSponsor());
//		}
		
	}

}
