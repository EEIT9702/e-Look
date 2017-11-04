package com.e_Look.backStage.login.model;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.transaction.annotation.Transactional;

@Transactional(readOnly = true)
public class ManagerDAO implements Manager_interface {
	public HibernateTemplate hibernateTemplate;

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}
	@Override
	public ManagerVO findByManagerID(String managerID) {
		ManagerVO managerVO=hibernateTemplate.get(ManagerVO.class, managerID);
		return managerVO;
	}

	public static void main(String[] args) {
		ApplicationContext context = new ClassPathXmlApplicationContext("beans-config.xml");
        // 建立DAO物件
		Manager_interface dao =(Manager_interface) context.getBean("managerDAO");
		ManagerVO managerVO=dao.findByManagerID("admin");
		System.out.println(managerVO.getManagerID());
		System.out.println(managerVO.getmPassword());
		
	}
}
