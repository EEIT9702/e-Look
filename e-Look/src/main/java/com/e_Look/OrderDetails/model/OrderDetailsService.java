package com.e_Look.OrderDetails.model;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;


public class OrderDetailsService {
 private OrderDetailsDAO_interface dao;
	public OrderDetailsService(){
		ApplicationContext context = new ClassPathXmlApplicationContext("beans-config-jndi.xml");
        // 建立DAO物件
		 dao =(OrderDetailsDAO_interface) context.getBean("orderDetailsDAO");
	 
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
	public OrderDetailsVO  findByPrimaryKey(OrderDetailsVO odVO) {
		return dao.findByPrimaryKey(odVO);
	}
}
