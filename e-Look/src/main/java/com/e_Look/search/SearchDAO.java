package com.e_Look.search;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
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

import com.e_Look.ad.AdDAO_interface;
import com.e_Look.ad.AdVO;

@Transactional(readOnly = true)
public class SearchDAO implements SearchDAO_interface {
	
	public HibernateTemplate hibernateTemplate;
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	
	}
	
	private static final String INSERT_SEARCH = "insert into SearchVO (keyWord,enterTime) values (?,?)";
	// deprecated
	private static final String UPDATE_SEARCH = "update SearchVO set keyWord=? , enterTime=? where keyWord=? and enterTime=?";
	private static final String DELETE_SEARCH = "delete from SearchVO where keyWord=? and enterTime=?";
	private static final String DELETE_DATE_SEARCH = "delete from SearchVO where enterTime < ?";
	private static final String SELECT_ALL_SEARCH = "select keyWord,enterTime from Search";

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void insert(SearchVO searchVO) {
		hibernateTemplate.save(searchVO);
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void update(SearchVO oldSearchVO, SearchVO newSearchVO) {
		hibernateTemplate.bulkUpdate(UPDATE_SEARCH,oldSearchVO.getKeyWord(),oldSearchVO.getEnterTime(),newSearchVO.getKeyWord(),newSearchVO.getEnterTime());
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void delete(SearchVO searchVO) {
		SearchVO searchVO1 = new SearchVO();
//		searchVO1.setKeyWord(KeyWord);
//		searchVO1.setEnterTime(enterTime);
		
		hibernateTemplate.delete(searchVO1);
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void dateDelete(Date date) {
		SearchVO searchVO1 = new SearchVO();
		searchVO1.setEnterTime(date);
		
		hibernateTemplate.delete(searchVO1);
	}

	@Override
	public List<SearchVO> getAll() {
		return (List<SearchVO>) hibernateTemplate.find("from SearchVO");
		
	}
	public static void main(String[] args) throws FileNotFoundException, IOException {
		ApplicationContext context = new ClassPathXmlApplicationContext("beans-config.xml");

		 // 建立DAO物件
		SearchDAO_interface dao =(SearchDAO_interface) context.getBean("searchDAO");
		// 新增
		SearchVO searchVO=new SearchVO();
		searchVO.setKeyWord("Java");
		searchVO.setEnterTime(new Date(System.currentTimeMillis()));
		dao.insert(searchVO);
		

//		List<SearchVO> list = dao.getAll();
//		for(SearchVO searchVO2:list){
//			System.out.print(searchVO2.getKeyWord()+"\t");
//			System.out.println(searchVO2.getEnterTime());
//			
//		}
//		
		
	

		

		
		

	}



}
