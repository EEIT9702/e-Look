package com.e_Look.search;

import java.sql.Date;
import java.util.*;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.e_Look.ad.AdVO;



public class SearchService {
	private SearchDAO_interface sdao;

	public SearchService() {
		ApplicationContext context = new ClassPathXmlApplicationContext("beans-config-jndi.xml");
        // 建立DAO物件
		 sdao =(SearchDAO_interface) context.getBean("searchDAO");
	}

	public String[] getKeyWordRank(){
		List<SearchVO> list2 =sdao.getAll();
		HashMap<String, Integer> map = new HashMap<String,Integer>();	
		String[] ss = null;
		for(SearchVO searchVO:list2){
			if(map.containsKey(searchVO.getKeyWord())){
				map.replace(searchVO.getKeyWord(), (map.get(searchVO.getKeyWord())+1));
			}else{
				map.put(searchVO.getKeyWord(), 1);
			}
		}
		ss= new String[map.size()];
		int i = 0;
		while(!map.isEmpty()){
			int count=0;
			String bigKeyword="";
			for(String key:map.keySet()){
				if(map.get(key)>count){
					bigKeyword=key;
					count=map.get(key);
				}
			}
			ss[i]=bigKeyword;
			map.remove(bigKeyword);
			i++;
		}
		return ss;
	}
	
	public void addSearch(SearchVO searchVO) {
		sdao.insert(searchVO);
	}
	
}
