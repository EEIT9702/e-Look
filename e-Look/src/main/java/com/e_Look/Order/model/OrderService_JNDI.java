package com.e_Look.Order.model;

import java.util.List;

public class OrderService_JNDI {
	private OrderDAO_interface dao;
	public OrderService_JNDI() {
		dao=new OrderDAO();
	}
	public List<OrderVO> getMemberOrder(Integer memberID){
		return dao.getMemberAllOrder(memberID);
	}
}
