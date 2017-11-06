package com.e_Look.shoppingCart.model.spring;

import java.util.LinkedList;
import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.transaction.annotation.Transactional;

import com.e_Look.Course.CourseVO;
@Transactional(readOnly = false)
public class ShoppingCartDAO implements ShoppingCartDAO_interface {
	
	
	private HibernateTemplate hibernateTemplate; 
    public void setHibernateTemplate(HibernateTemplate hibernateTemplate) { 
        this.hibernateTemplate = hibernateTemplate;
    }
	
	
	@Override
	public void insert(ShoppingCartVO shoppingCartVO) {
		hibernateTemplate.saveOrUpdate(shoppingCartVO);
	}

	@Override
	public void update(ShoppingCartVO shoppingCartVO, ShoppingCartVO shoppingCartVO2) {
		hibernateTemplate.update(shoppingCartVO);
	}

	@Override
	public void delete(ShoppingCartVO shoppingCartVO) {
		hibernateTemplate.delete(shoppingCartVO);
	}


	@Override
	public List findByMemberID(Integer memberID) {
		return hibernateTemplate.find("from ShoppingCartVO where memberID=?", memberID);
	}


	@Override
	public List<ShoppingCartVO> getAll() {
		return (List<ShoppingCartVO>) hibernateTemplate.find("from ShoppingCartVO");
	}

	
	
	
	public static void main(String[] args){
		ApplicationContext context = new ClassPathXmlApplicationContext("beans-config.xml");
		ShoppingCartDAO_interface dao=(ShoppingCartDAO_interface) context.getBean("shoppingCartDAO");
		ShoppingCartVO vo=new ShoppingCartVO();
		vo.setMemberID(100001);
		vo.setCourseID(200001);
		
		dao.insert(vo);
		//dao.delete(vo);
		
		
		
		List<ShoppingCartVO> list1 = dao.findByMemberID(100001);
		for(ShoppingCartVO shoppingCartVO:list1){
			System.out.print(shoppingCartVO.getMemberID()+"\t");
			System.out.println(shoppingCartVO.getCourseID());
		}
		List<ShoppingCartVO> aa = dao.getAll();
		System.out.println("======================================================");
		for(ShoppingCartVO ss:aa){
			System.out.print(ss.getCourseID()+"\t");
			System.out.println(ss.getMemberID());
		}
	}
	
}
