package com.e_Look.sponsor.model;

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
	
	
}
