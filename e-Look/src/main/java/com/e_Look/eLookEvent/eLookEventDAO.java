package com.e_Look.eLookEvent;

import java.util.List;

import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
@Transactional(readOnly = true)
public class eLookEventDAO implements eLookEvent_interface {
	public HibernateTemplate hibernateTemplate;
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	
	}

	// private static final String INSERT_ELOOKEVENT = "insert into eLookEvent
	// (eventName,ePhoto,eStartDate,eEndDate,discount) values ( ?, ?, ?, ?, ?)";
	// private static final String UPDATE_ELOOKEVENT = "update eLookEvent set
	// eventName=?, ePhoto=?, eStartDate=?, eEndDate=?, discount=? where eventID=
	// ?";
	// private static final String DELETE_ELOOKEVENT = "delete from eLookEvent where
	// eventID= ?";
	// private static final String SELECT_ONE_ELOOKEVENT = "select eventID,eventName
	// ,ePhoto,eStartDate,eEndDate,discount from eLookEvent where eventID= ?";
	// private static final String SELECT_ALL_ELOOKEVENT = "select eventID,eventName
	// ,ePhoto,eStartDate,eEndDate,discount from eLookEvent";


	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void insert(eLookEventVO eLookEventVO) {
		hibernateTemplate.save(eLookEventVO);
	}

	@Override
	@Transactional(readOnly=false,propagation = Propagation.REQUIRED)
	public void delete(Integer eventID) {
		eLookEventVO eLookEventVO=new eLookEventVO();
		eLookEventVO.setEventID(eventID);
		hibernateTemplate.delete(eLookEventVO);
	}

	@Override
	@Transactional(readOnly=false,propagation = Propagation.REQUIRED)
	public void update(eLookEventVO eLookEventVO) {
		hibernateTemplate.update(eLookEventVO);
	}

	@Override
	public eLookEventVO findByPrimaryKey(Integer eventID) {
	return hibernateTemplate.get(eLookEventVO.class,eventID);
	}

	@Override
	public List<eLookEventVO> getAll() {
		return (List<eLookEventVO>) hibernateTemplate.find("from eLookEventVO");
	}

}
