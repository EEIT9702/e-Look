package com.e_Look.sponsor.model;

import java.util.List;

public class SponsorService { 
	private SponsorDAO_interface dao;
	public SponsorService(){
		dao=new SponsorDAO();
	}
	public void addNameMoney(Integer courseID, String SponsorName, Integer money){
		SponsorVO sponsorVO=new SponsorVO();
		
		sponsorVO.setCourseID(courseID);
		sponsorVO.setSponsorName(SponsorName);
		sponsorVO.setMoney(money);
		
		dao.insert(sponsorVO);
	}
	public int countMoney(Integer courseID){
		int count=0;
		List <SponsorVO> countMoney = dao.getCountMoney(courseID);
		
		for(SponsorVO Money:countMoney){
			count+=Money.getMoney();
		}
		return count;
	}
	public String getOPay(String sponosorDate,int courseID,String SponsorName,int money){
		
		
		
		
		return null;
		
		
	} 
	
}
