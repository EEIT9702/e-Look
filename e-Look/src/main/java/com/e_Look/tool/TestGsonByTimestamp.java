package com.e_Look.tool;
import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;

import com.e_Look.message.model.MessageVO;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;



public class TestGsonByTimestamp {

	public static void main(String[] args) throws JsonGenerationException, JsonMappingException, IOException {
		List<MessageVO> list=  new LinkedList<MessageVO>(); 
		MessageVO vo=new MessageVO();
		
		vo.setCourseID(2);
		vo.setMessageID(1);
		vo.setmContent("中文");
		vo.setmTime(new java.sql.Timestamp(System.currentTimeMillis()));
		
		MessageVO vo2=new MessageVO();
		vo2.setCourseID(2);
		vo2.setMessageID(1);
		vo2.setmContent("中文");
		vo2.setmTime(new java.sql.Timestamp(System.currentTimeMillis()));
		list.add(vo);
		list.add(vo2);
		
		GsonBuilder gb = new GsonBuilder();
		gb.setDateFormat("yyyyMMdd");
		Gson gson = gb.create();
		String jsonstr=gson.toJson(list);
		System.out.println(jsonstr);
		
		
	}

}
