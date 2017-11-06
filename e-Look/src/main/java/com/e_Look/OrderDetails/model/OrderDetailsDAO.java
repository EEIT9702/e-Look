package com.e_Look.OrderDetails.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.e_Look.Course.CourseDAO;
import com.e_Look.Course.CourseDAO_interface;
import com.e_Look.Course.CourseService;
import com.e_Look.Course.CourseVO;
import com.e_Look.Order.model.OrderDAO;
import com.e_Look.Order.model.OrderDAO_interface;
import com.e_Look.tool.BuyingPrice;
@Transactional(readOnly = true)
public class OrderDetailsDAO implements OrderDetailsDAO_interface {
	public HibernateTemplate hibernateTemplate;
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}

	private static final String INSERT_ORDERDETAILS = "insert into OrderDetails (orderID,courseID,buyingPrice,originalPrice) values(?,?,?,?)";
	private static final String UPDATE_ORDERDETAILS = "update OrderDetails set orderID=?,courseID=?,buyingPrice=?,originalPrice=? where orderID=? and courseID=?";
	private static final String DELETE_ORDERDETAILS = "delete from OrderDetails where orderID=? and courseID=?";
	private static final String SELECT_ORDER_ORDERDETAILS = "select orderID,courseID,buyingPrice,originalPrice from OrderDetails where orderID = ?";
	private static final String SELECT_ALL_ORDERDETAILS = "select orderID,courseID,buyingPrice,originalPrice from OrderDetails";
	private static final String SELECT_ONE_ORDERDETAILS = "select orderID,courseID,buyingPrice,originalPrice from OrderDetails where orderID=? and courseID=?";
	private static final String SELECT_ORDERDETAILS_BY_COURSEID = "select orderID,courseID,buyingPrice,originalPrice from OrderDetails where courseID=?";
	
	
	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void insert(OrderDetailsVO orderDetailsVO) {
		hibernateTemplate.save(orderDetailsVO);
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void update(OrderDetailsVO orderDetailsVO) {
		hibernateTemplate.update(orderDetailsVO);
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void delete(OrderDetailsVO orderDetailsVO) {
		hibernateTemplate.delete(orderDetailsVO);
	}

	@Override
	public List<OrderDetailsVO> findByOrderID(Integer orderID) {
		return (List<OrderDetailsVO>) hibernateTemplate.find("from OrderDetailsVO where orderID = ?", orderID);
	}

	@Override
	public List<OrderDetailsVO> getAll() {
		return (List<OrderDetailsVO>) hibernateTemplate.find("from OrderDetailsVO");
	}

	@Override
	public OrderDetailsVO findByPrimaryKey(OrderDetailsVO orderDetailsVO) {
		return (OrderDetailsVO) hibernateTemplate.find("from OrderdetailsVO where orderID= ? courseID = ? ",orderDetailsVO.getOrderVO().getOrderID(),orderDetailsVO.getCourseVO().getCourseID()); 
	}

	@Override
	public List<OrderDetailsVO> findByCourseID(Integer courseID) {
		return (List<OrderDetailsVO>) hibernateTemplate.find("from OrderdetailsVO where courseID = ? ", courseID);
	}
	
	public static void main(String[] args){
		ApplicationContext context = new ClassPathXmlApplicationContext("beans-config.xml");
		OrderDetailsDAO_interface dao = (OrderDetailsDAO_interface) context.getBean("orderDetailsDAO");
		
//		OrderDAO_interface odao = (OrderDAO_interface) context.getBean("orderDAO");
//		CourseDAO_interface cdao = (CourseDAO_interface) context.getBean("courseDAO");
//		CourseVO courseVO=cdao.findByPrimaryKey(200001);
//		OrderDetailsVO orderDetailsVO=new OrderDetailsVO();
//		orderDetailsVO.setBuyingPrice(300);
//		orderDetailsVO.setOrderVO(odao.findByPrimaryKey(1007));
//		orderDetailsVO.setOriginalPrice(courseVO.getSoldPrice());
//		orderDetailsVO.setCourseVO(courseVO);
//		dao.insert(orderDetailsVO);
//		
//		for(OrderDetailsVO aa:dao.getAll()){
//			System.out.println(aa.getCourseVO().getCourseName());
//		}
		
		
	}
}
