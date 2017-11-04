package com.e_Look.ad;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
@Transactional(readOnly = true)
public class AdDAO implements AdDAO_interface {
	public HibernateTemplate hibernateTemplate;
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	
	}
	private static final String UPDATE_STATUS =
		    "UPDATE AdVO SET status=? WHERE adID=?";
	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void insert(AdVO adVO) {
		hibernateTemplate.save(adVO);
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void update(AdVO adVO) {
		hibernateTemplate.update(adVO);
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void updateStatus(Byte status, Integer adID){
		hibernateTemplate.bulkUpdate(UPDATE_STATUS, status,adID);
	}
	
	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void delete(Integer adID) {
		AdVO adVO = new AdVO();
		adVO.setAdID(adID);
		hibernateTemplate.delete(adVO);
	}

	@Override
	public AdVO findByAdID(Integer adID) {
		return hibernateTemplate.get(AdVO.class, adID);
		
	}

	@Override
	public List<AdVO> getAll() {
		return (List<AdVO>) hibernateTemplate.find("from AdVO");
	}
	
	@Override
	public List<AdVO> findByStatus() {
		return (List<AdVO>) hibernateTemplate.find("from AdVO WHERE status=0 order by adID");
		
	}
	public static void main(String[] args) throws FileNotFoundException, IOException {
		ApplicationContext context = new ClassPathXmlApplicationContext("beans-config.xml");

        // 建立DAO物件
		AdDAO_interface dao =(AdDAO_interface) context.getBean("adDAO");
		// 新增
//				AdVO adVO1 = new AdVO();
//				adVO1.setFileName("聖誕大特賣");
//				byte[] bytes = IOUtils.toByteArray(new FileInputStream(new File("src/main/webapp/body/img/xmas video sale.jpg")));
//				adVO1.setAdFile(bytes);
//				adVO1.setStatus((byte) 0);
//				dao.insert(adVO1);
		
		//修改
//		AdVO adVO2 = new AdVO();
//		adVO2.setFileName("聖誕大特賣");
//		byte[] bytes = IOUtils.toByteArray(new FileInputStream(new File("src/main/webapp/body/img/xmas video sale.jpg")));
//		adVO2.setAdFile(bytes);
//		adVO2.setStatus((byte) 1);
//		adVO2.setAdID(1002);
//		dao.update(adVO2);
		
		//單一查詢
		AdVO adVO3 = dao.findByAdID(1002);
		System.out.println(adVO3.getAdID());
		System.out.println(adVO3.getFileName());
		System.out.println(adVO3.getAdFile());
		System.out.println(adVO3.getStatus());
		System.out.println("---------------------------");
		
		//查詢全部
		List<AdVO> list = dao.getAll();
		for(AdVO adVO : list){
			System.out.print(adVO.getAdID() + "  ");
			System.out.print(adVO.getFileName() + "  ");
			System.out.print(adVO.getAdFile() + "  ");
			System.out.print(adVO.getStatus());
		}

	}
}
