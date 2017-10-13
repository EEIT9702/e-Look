package com.e_Look.search;

import java.util.List;

public interface SearchDAO_interface {
	
	public void insert(SearchVO searchVO);
	//public void update(SearchVO searchVO);
	//public void delete(SearchVO searchVO);
	public SearchVO findByKeyWord(String keyWord);
	public List<SearchVO> getAll();
}
