package com.e_Look.ad;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class AdService {
	private AdDAO_interface dao;

	public AdService() {
		ApplicationContext context = new ClassPathXmlApplicationContext("beans-config-jndi.xml");
        // 建立DAO物件
		 dao =(AdDAO_interface) context.getBean("adDAO");
	}

//	public AdVO addAd(String fileName, InputStream adFile, Byte status) {
//		AdVO AdVO = new AdVO();
//		AdVO.setFileName(fileName);
//		AdVO.setAdFile(adFile);
//		AdVO.setStatus(status);
//		return AdVO;
//	}
	public void addAd(AdVO AdVO) {
		dao.insert(AdVO);
	}
	
	public void delete(Integer adID) {
		dao.delete(adID);
	}
	
	public AdVO getOneAd(Integer adID) {
		return dao.findByAdID(adID);
	}

	public List<AdVO> getAll() {
		return dao.getAll();
	}

	public void updateAd(AdVO AdVO) {
		dao.update(AdVO);
	}

	public List<AdVO> findByStatus() {
		return dao.findByStatus();
	}
	
	
}
