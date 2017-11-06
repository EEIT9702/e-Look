package com.e_Look.message.model;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.e_Look.member.model.MemberVO;


@Transactional(readOnly=false)
public class MessageDAO implements MessageDAO_interface {
//	private static DataSource ds = null;
//	static {
//		try {
//			Context ctx = new InitialContext();
//			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/eLookDB");
//		} catch (NamingException e) {
//			e.printStackTrace();
//		}
//	}
	public HibernateTemplate hibernateTemplate;
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}
	//新增留言或回應
	private static final String INSERT_MESSAGE = "insert into Message ( mContent,mTime,messageID_response,memberID,courseID,status) values ( ?, ?, ?, ?,?)";
	//新增回應
	private static final String UPDATE_MESSAGE_RESPONSE = "insert into MessageVO ( mContent,mTime,messageID_response,memberID,courseID,status) values (?, ?, ?, ?, ?,?)";
	//修改留言或回應的內容、時間
	private static final String UPDATE_MESSAGE = "update Message set mContent=?, mTime=? where messageID= ?";
	//變更留言或回應的狀態
	private static final String UPDATE_STATUS = "update MessageVO set status=? where messageID= ?";
	//刪除留言或回應
	private static final String DELETE_MESSAGE = "delete from MessageVO where messageID= ?";
	//選出某筆回應或留言內容
	private static final String SELECT_ONE_MESSAGE = "select messageID,mContent,mTime,messageID_response,memberID,courseID,status from MessageVO where messageID= ?";
	//選出某課程所有內容
	private static final String SELECT_MESSAGE_BY_COURSEID = "select messageID,mContent,mTime,messageID_response,memberID,courseID,status from MessageVO where courseID= ?";
	//選出某課程所有回應
	private static final String SELECT_RESPONSE = "select messageID,mContent,mTime,messageID_response,memberID,courseID,status from MessageVO where messageID_response= ?";
	//選出所有留言和回應
	private static final String SELECT_ALL_MESSAGE = "select messageID,mContent,mTime,messageID_response,memberID,courseID,status from MessageVO";	
		
	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public Integer insert(MessageVO messageVO) {
		Serializable id=hibernateTemplate.save(messageVO);
		return (int)id;
	}
	
	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public void insert_re(MessageVO messageVO) {
//UPDATE_MESSAGE_RESPONSE = "insert into Message ( mContent,mTime,messageID_response,memberID,
//							 courseID,status) values (?, ?, ?, ?, ?,?)";
		hibernateTemplate.save(messageVO);		
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public void update(MessageVO messageVO) {
		hibernateTemplate.saveOrUpdate(messageVO);
		
	}
	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public void updateStatus(Integer messageID,Byte status) {
		//"update Message set status=? where messageID= ?"
		hibernateTemplate.bulkUpdate(UPDATE_STATUS, status,messageID);
				
	}
	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public void delete(Integer messageID) {
		MessageVO messageVO=new MessageVO();
		messageVO.setMessageID(messageID);
		hibernateTemplate.delete(messageVO);
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public MessageVO findByPrimaryKey(Integer messageID) {
		MessageVO messageVO=(MessageVO)hibernateTemplate.get(MessageVO.class, messageID);
		return messageVO;
		
	}
	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public List<MessageVO> findMessageByCourseID(Integer courseID) {
//		"select messageID,mContent,mTime,messageID_response,memberID,courseID,status 
//		from Message where courseID= ?";
		List<MessageVO> list=(List<MessageVO>)hibernateTemplate.find("from MessageVO where courseID= ?",courseID);
		return list;
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public List<MessageVO> findAllResponse(Integer messageID_response) {
		
//"select messageID,mContent,mTime,messageID_response,memberID,courseID,status from Message where messageID_response= ?";
		List<MessageVO> list=(List<MessageVO>)hibernateTemplate.find("from MessageVO where messageID_response= ?",messageID_response);
		return list;
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public List<MessageVO> getAll() {
		
//"select messageID,mContent,mTime,messageID_response,memberID,courseID,status from Message";	
			List<MessageVO> list=(List<MessageVO>)hibernateTemplate.find("from MessageVO");
			return list;
	}
	public static void main(String arg[]){
		ApplicationContext context = new ClassPathXmlApplicationContext("beans-config.xml");
		MessageDAO_interface dao =(MessageDAO_interface) context.getBean("MessageDAO");
		MessageVO messageVO1=new MessageVO();
		MemberVO memberVO=new MemberVO();
//		memberVO.setMemberID(100004);
//		新增
//		messageVO1.setmContent("spring測試");
//		messageVO1.setCourseID(200003);
//		messageVO1.setMemberVO(memberVO);
//		messageVO1.setStatus((byte)0);
//		Timestamp ts = new Timestamp(System.currentTimeMillis());		
//		messageVO1.setmTime(ts);
//		dao.insert(messageVO1);
//      新增回應
//		messageVO1.setmContent("spring測試回應");
//		messageVO1.setCourseID(200002);
//		messageVO1.setMemberVO(memberVO);
//		messageVO1.setStatus((byte)0);
//		messageVO1.setMessageID_response(1006);
//		Timestamp ts = new Timestamp(System.currentTimeMillis());		
//		messageVO1.setmTime(ts);
//		dao.insert(messageVO1);
		
		List<MessageVO> list=dao.findMessageByCourseID(200003);
		for(MessageVO messageVO:list){
			System.out.println(messageVO.getMessageID());
			System.out.println(messageVO.getmTime());
			System.out.println(messageVO.getmContent());
			System.out.println(messageVO.getMessageID_response());
			System.out.println(messageVO.getCourseID());
			System.out.println(messageVO.getMemberVO());
			
		}
		//查全部
//		List<MessageVO> list=dao.getAll();
//		for(MessageVO messageVO:list){
//			System.out.println(messageVO.getMessageID());
//			System.out.println(messageVO.getmTime());
//			System.out.println(messageVO.getmContent());
//			System.out.println(messageVO.getMessageID_response());
//			System.out.println(messageVO.getCourseID());
//			System.out.println(messageVO.getMemberVO());
//			
//		}
	}
}
