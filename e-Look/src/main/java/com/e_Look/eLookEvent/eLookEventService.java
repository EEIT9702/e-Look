package com.e_Look.eLookEvent;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.e_Look.ad.AdDAO_interface;

public class eLookEventService {
private eLookEvent_interface dao;
public eLookEventService() {
	ApplicationContext context = new ClassPathXmlApplicationContext("beans-config-jndi.xml");
    // 建立DAO物件
	 dao =(eLookEvent_interface) context.getBean("eLookEventDAO");
}

public eLookEventVO getOneeLookEvent(Integer eventID) {
	return dao.findByPrimaryKey(eventID);
}

public List<eLookEventVO> getAll() {
	return dao.getAll();
}
public void updateeLookEvent(eLookEventVO eLookEventVO) {
	dao.update(eLookEventVO);
}
}
