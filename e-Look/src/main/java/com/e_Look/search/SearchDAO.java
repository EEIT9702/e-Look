package com.e_Look.search;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

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
	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void insert(SearchVO searchVO) {
	hibernateTemplate.save(searchVO);

	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void update(SearchVO SearchVO) {
		hibernateTemplate.update(SearchVO);
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)

	public void delete(Integer searchID) {
		SearchVO searchVO=new SearchVO();
		searchVO.setSearchID(searchID);
		hibernateTemplate.delete(searchVO);
	}

	@Override
	public List<SearchVO> getAll() {
		return(List<SearchVO>) hibernateTemplate.find("from SearchVO");	}
}
