package com.e_Look.message.model;

import java.text.SimpleDateFormat;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.e_Look.member.model.MemberDAO;
import com.e_Look.member.model.MemberDAO_interface;
import com.e_Look.member.model.MemberVO;

public class MessageService {
	private MessageDAO_interface dao;    //多型多
	private MemberDAO_interface memberDAO;
	public MessageService() {
		
		
		ApplicationContext context = new ClassPathXmlApplicationContext("beans-config-jndi.xml");
        // 建立DAO物件
		 dao =(MessageDAO_interface) context.getBean("MessageDAO");
		 memberDAO =(MemberDAO_interface) context.getBean("memberDAO");
	}
	public void addMessage(String mContent,Integer memberID,Integer courseID, Byte status)
	   {
		MemberVO memberVO = memberDAO.findByPrimaryKey(memberID);
		
		MessageVO messageVO = new MessageVO();
		messageVO.setmContent(mContent);
        //mTime時間由dao產生
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		Timestamp mTime=Timestamp.valueOf(sdf.format(System.currentTimeMillis()));
		
		messageVO.setmTime(mTime);
		messageVO.setMemberVO(memberVO);
		messageVO.setCourseID(courseID);
		messageVO.setStatus(status);
		dao.insert(messageVO);
	}
	
	public void addResponse(String mContent,Integer messageID_response,Integer memberID,Integer courseID, Byte status)
	   {
//		System.out.println(mContent);
//		System.out.println(courseID);
//		System.out.println(messageID_response);
//		System.out.println(memberID);
//		System.out.println(status);
		MemberVO memberVO = memberDAO.findByPrimaryKey(memberID);
		System.out.println(memberVO);
		MessageVO messageVO = new MessageVO();
		messageVO.setmContent(mContent);
		messageVO.setMessageID_response(messageID_response);
		messageVO.setMemberVO(memberVO);
		messageVO.setCourseID(courseID);
		messageVO.setStatus(status);
		dao.insert_re(messageVO);
	}
		
	public void updateMessage(Integer messageID,String mContent) {

		MessageVO messageVO = new MessageVO();
		messageVO.setMessageID(messageID);
		messageVO.setmContent(mContent);
		dao.update(messageVO);
//		return dao.findByPrimaryKey(messageID);
	}
	public List<MessageVO> findCourseRe(Integer courseID){
		return dao.findMessageByCourseID(courseID);
	} 
	
	public MessageVO getOneMessage(Integer messageID) {
		return dao.findByPrimaryKey(messageID);
	}

	public List<MessageVO> findAllResponse(Integer messageID_response) {
		return dao.findAllResponse(messageID_response);
	}


}
