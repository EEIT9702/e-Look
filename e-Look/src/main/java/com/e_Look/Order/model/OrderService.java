package com.e_Look.Order.model;

import java.util.List;

import javax.ws.rs.core.Application;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class OrderService {
	private OrderDAO_interface dao;
	public OrderService() {
		dao = (OrderDAO_interface) new ClassPathXmlApplicationContext("beans-config-jndi.xml").getBean("orderDAO");
		
	}
	public List<OrderVO> getMemberOrder(Integer memberID){
		return dao.getMemberAllOrder(memberID);
	}
	public OrderVO findMemberUncheckOrder(Integer memberID){
		return dao.findMemberUncheckOrder(memberID);
	}
	public void insert(OrderVO orderVO){
		dao.insert(orderVO);
	}
}
