package com.e_Look.search;

import java.io.Serializable;
import java.sql.Date;

public class SearchVO implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private String keyWord;
	private String countWord;
	private Date time;
	public SearchVO(){}
	public SearchVO(String keyWord, String countWord, Date time){
		this.keyWord = keyWord;
		this.countWord = countWord;
		this.time = time;
	}
	
	
	public String getKeyWord() {
		return keyWord;
	}
	public void setKeyWord(String keyWord) {
		this.keyWord = keyWord;
	}
	public String getCountWord() {
		return countWord;
	}
	public void setCountWord(String countWord) {
		this.countWord = countWord;
	}
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
}
