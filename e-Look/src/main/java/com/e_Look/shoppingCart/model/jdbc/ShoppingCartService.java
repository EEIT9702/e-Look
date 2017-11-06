package com.e_Look.shoppingCart.model.jdbc;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.e_Look.Course.CourseVO;
import com.e_Look.sponsor.model.SponsorDAO_interface;

public class ShoppingCartService {
		private ShoppingCartDAO_interface dao;
		public ShoppingCartService(){
			ApplicationContext context = new ClassPathXmlApplicationContext("beans-config-jndi.xml");
			dao= (ShoppingCartDAO_interface) context.getBean("shoppingCartDAO");
		}
		
		public void insert(ShoppingCartVO scVO){
			dao.insert(scVO);
		}

		public ShoppingCartVO findByPrimaryKey(ShoppingCartVO scVO) {			
			return dao.findByPrimaryKey(scVO);
		}

		public List<CourseVO> findByMemberID(Integer memberID) {
			return dao.findByMemberID(memberID);
		}

		public void delete(ShoppingCartVO shoppingCartVO) {
			dao.delete(shoppingCartVO);		
		}
}
