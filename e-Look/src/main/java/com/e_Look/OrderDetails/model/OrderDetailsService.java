package com.e_Look.OrderDetails.model;

import java.util.List;

import org.springframework.context.support.ClassPathXmlApplicationContext;


public class OrderDetailsService {
 private OrderDetailsDAO_interface dao;
	public OrderDetailsService(){
	 dao = (OrderDetailsDAO_interface) new ClassPathXmlApplicationContext("beans-config-jndi.xml").getBean("orderDetailsDAO");
 }
	public List<OrderDetailsVO> findByOrderID(Integer orderID){
		return dao.findByOrderID(orderID);
	}
	public List<OrderDetailsVO> findByCourseID(Integer orderID){
		return dao.findByCourseID(orderID);
	}
	public void update(OrderDetailsVO orderDetailsVO){
		dao.update(orderDetailsVO);
	}
	public void delete (OrderDetailsVO orderDetailsVO){
		dao.delete(orderDetailsVO);
	}
	
	public void insert(OrderDetailsVO orderDetailsVO){
		dao.insert(orderDetailsVO);
	}
}
