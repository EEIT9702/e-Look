package com.e_Look.sponsor.model;

import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import allPay.payment.integration.AllInOne;
import allPay.payment.integration.domain.*;
public class SponsorService { 
	private SponsorDAO_interface dao;
	public static AllInOne all;
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
	public String getOPay(String MerchantTradeNo,String itemName,String money,String url) throws UnsupportedEncodingException{
		
		all = new AllInOne("");//實體化(new) AllInOne類別參數內可放置log4j.properties的位置路徑
		AioCheckOutOneTime obj = new AioCheckOutOneTime();
		obj.setMerchantTradeNo(MerchantTradeNo+"s");
		
		SimpleDateFormat sfd=new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		String opayDate=sfd.format(new Date());
		obj.setItemName(itemName);
		obj.setMerchantTradeDate(opayDate);
		obj.setTotalAmount(money);
		obj.setTradeDesc("感謝您的贊助!");
		obj.setReturnURL("http://211.23.128.214:5000");
		obj.setClientBackURL(url);
		obj.setNeedExtraPaidInfo("N");
		obj.setHoldTradeAMT("0");
		obj.setUseRedeem("N");
		obj.setRedeem("Y");
		String form = all.aioCheckOut(obj, null);
		return form;		
		
	} 
	
}
