package com.e_Look.message.model;

import java.sql.Timestamp;
import java.util.List;

public class MessageService {
	private MessageDAO_interface dao;    //多型多

	public MessageService() {
		dao = new MessageDAO();
	}

	public MessageVO addMessage(String mContent,Integer memberID,Integer courseID, Long bought, Byte status)
	   {

		MessageVO messageVO = new MessageVO();

		messageVO.setmContent(mContent);

		messageVO.setMemberID(memberID);
		messageVO.setCourseID(courseID);
		messageVO.setBought(bought);
		messageVO.setStatus(status);
		dao.insert(messageVO);

		return messageVO;
	}

		
	public MessageVO updateMessage(Integer messageID,String mContent, Integer memberID,Integer courseID, Long bought, Byte status,String update) {

		MessageVO messageVO = new MessageVO();

		messageVO.setmContent(mContent);
//		messageVO.setmTime(mTime);
//		messageVO.setMessageID_response(messageID_response);
		messageVO.setMemberID(memberID);
		messageVO.setCourseID(courseID);
		messageVO.setBought(bought);
		messageVO.setStatus(status);
		dao.update(messageVO,update);

		return dao.findByPrimaryKey(courseID);
	}
	
	

	public void deleteMessage(Integer messageID) {
		dao.delete(messageID);
	}

	public MessageVO getOneMessage(Integer courseID) {
		return dao.findByPrimaryKey(courseID);
	}

	public List<MessageVO> getAll() {
		return dao.getAll();
	}

	

}
