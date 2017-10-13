package com.e_Look.ad;

import java.util.List;

public interface AdDAO_interface {
	
	public void insert(AdVO adVO);
	public void update(AdVO adVO);
	public void delete(AdVO adVO);
	public AdVO findByAdID(Integer adID);
	public List<AdVO> getAll();
}
