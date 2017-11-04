package com.e_Look.backStage.login.model;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class ManagerService {
private Manager_interface dao;

public ManagerService() {
	ApplicationContext context = new ClassPathXmlApplicationContext("beans-config-jndi.xml");
    // 建立DAO物件
	 dao =(Manager_interface) context.getBean("managerDAO");

}

public ManagerVO findByManagerID(String managerID) {
	return dao.findByManagerID(managerID);
}


}
