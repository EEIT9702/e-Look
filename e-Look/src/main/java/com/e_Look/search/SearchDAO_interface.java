package com.e_Look.search;

import java.util.List;

public interface SearchDAO_interface {
	
	public void insertKeyword(SearchVO searchVO);
	//public void insertCountword(SearchVO searchVO);
	//public void update(SearchVO searchVO);
	//public void delete(SearchVO searchVO);
	public List<SearchVO> getCountWord();
	public SearchVO findByKeyWord(String keyWord);//search keyword
	//public List<SearchVO> getAll();//search keyword and call trigger insert countword
}
