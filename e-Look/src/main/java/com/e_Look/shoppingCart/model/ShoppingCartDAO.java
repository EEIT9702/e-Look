package com.e_Look.shoppingCart.model;

import java.util.List;

import org.springframework.orm.hibernate5.HibernateTemplate;

import com.e_Look.Course.CourseVO;

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
	public List<CourseVO> findByMemberID(Integer memberID) {
		List<CourseVO> list = null;
		final String GET_MEMBER_COURSE = "from ShoppingCartVO where memberID ="+memberID;
		
		list = (List<CourseVO>) hibernateTemplate.find("from ShoppingCartVO where memberID");
		
		return list;
	}

	@Override
	public List<ShoppingCartVO> getAll() {
		return null;
	}

	
	
	
	public static void main(String[] args){
		
		ShoppingCartDAO dao=new ShoppingCartDAO();
		List<CourseVO> list=dao.findByMemberID(100001);
		
		for(CourseVO courseVO:list ){
			System.out.println(courseVO.getCourseID());	
		}
		
	}
	
	
	
	
	
	
}
