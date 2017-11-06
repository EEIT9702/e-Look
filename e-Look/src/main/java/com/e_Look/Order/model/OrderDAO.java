package com.e_Look.Order.model;

import java.sql.Date;
import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
@Transactional(readOnly = true)
public class OrderDAO implements OrderDAO_interface {
	public HibernateTemplate hibernateTemplate;
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	
	}

	private static final String INSERT_Order = "insert into [Order] (memberID,orderTime) values (?,?)";
	private static final String UPDATE_Order = "update [Order] set memberID=? ,orderTime=? where OrderID=?";
	private static final String DELETE_Order = "delete from [Order] where OrderID=?";
	private static final String SELECT_Order = "select OrderID,memberID,orderTime from [Order] where OrderID=?";
	private static final String SELECT_ALL_Order = "select OrderID,memberID,orderTime from [Order]";
	private static final String SELECT_MEMBER_UNCHECK_Order = "select OrderID,memberID,orderTime from [Order] where memberID=? and orderTime is null";
	private static final String SELECT_MEMBER_ALL_Order = "select OrderID,memberID,orderTime from [Order] where memberID=? ";
	private static final String SELECT_ORDER_OF_DATE = "select OrderID,memberID,orderTime from [Order] where orderTime>=? and orderTime <=?";

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void insert(OrderVO orderVO) {
		hibernateTemplate.save(orderVO);		
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void delete(Integer orderID) {
		OrderVO orderVO=new OrderVO();
		orderVO.setOrderID(orderID);
		hibernateTemplate.delete(orderVO);
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void update(OrderVO OrderVO) {
		hibernateTemplate.update(OrderVO);
	}

	@Override
	public OrderVO findByPrimaryKey(Integer orderID) {
		return hibernateTemplate.get(OrderVO.class, orderID);
	}

	@Override
	public List<OrderVO> getAll() {
		return (List<OrderVO>) hibernateTemplate.find("from OrderVO");
	}

	@Override
	public OrderVO findMemberUncheckOrder(Integer memberID) {
		
		OrderVO OrderVO=null;
			
		List<OrderVO> list=(List<OrderVO>) hibernateTemplate.find("from OrderVO where orderTime is null and memberID = ?",memberID);
		if(list.size()>0){
			list.get(0);
		}
		return OrderVO;		
	}

	@Override
	public List<OrderVO> getMemberAllOrder(Integer memberID) {
		return (List<OrderVO>) hibernateTemplate.find("from OrderVO where memberID = ?", memberID);
	}
	@Override
	public List<OrderVO> getOrderByDate(Date sDate, Date eDate) {
		return (List<OrderVO>) hibernateTemplate.find("from OrderVO where orderTime=>? and orderTime<=?", sDate,eDate);
	}
	
	public static void main(String[] args){
		ApplicationContext context = new ClassPathXmlApplicationContext("beans-config.xml");
		OrderDAO_interface dao = (OrderDAO_interface) context.getBean("orderDAO");
		
//		OrderVO orderVO=new OrderVO();
//		orderVO.setMemberID(100001);
//		dao.insert(orderVO);
//		dao.update(dao.findByPrimaryKey(1004));
//		dao.findByPrimaryKey(1001);
//		
		
		for(OrderVO vo:dao.getAll()){
			System.out.print(vo.getOrderID());
			System.out.print(vo.getMemberID());
			System.out.println(vo.getOrderTime());
			
		}
//		dao.delete(dao.findMemberUncheckOrder(100001).getOrderID());
//		
	}
}
