package com.e_Look.search;

import java.sql.Date;
import java.util.List;

public interface SearchDAO_interface {
	
	public void insert(SearchVO searchVO);
	public void update(SearchVO searchVO);
	public void delete(Integer searchID);
	public List<SearchVO> getAll();
}
