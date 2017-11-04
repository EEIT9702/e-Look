package com.e_Look.member.model;

import java.io.IOException;
import java.io.Serializable;
import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Transactional(readOnly = true)
public class MemberDAO implements MemberDAO_interface {
	public HibernateTemplate hibernateTemplate;
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	
	}
	private static final String UPDATE_MEMBER = "update MemberVO set email=?, mPassword=?, mName=?,aboutme=?, skill=?, hobby=?, address=? where memberID= ?";
	private static final String UPDATE_MEMBER_IMAGE = "update MemberVO set mPhoto=? where memberID=?";
	private static final String UPDATE_STATUS = "update MemberVO set status=? where memberID= ?";
	private static final String UPDATE_COUNT = "update MemberVO set count=? where memberID= ?";

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void insert(MemberVO memberVO) {
		Serializable i = hibernateTemplate.save(memberVO);
		System.out.println(i);

	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void updataimage(MemberVO memberVO) {

		hibernateTemplate.bulkUpdate(UPDATE_MEMBER_IMAGE, memberVO.getmPhoto(), memberVO.getMemberID());
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void update(MemberVO memberVO, String update) {

		if (update.equalsIgnoreCase("member")) {
			hibernateTemplate.bulkUpdate(UPDATE_MEMBER, memberVO.getEmail(), memberVO.getmPassword(),
					memberVO.getmName(), memberVO.getAboutme(), memberVO.getSkill(), memberVO.getHobby(),
					memberVO.getAddress(), memberVO.getMemberID());
		} else if (update.equalsIgnoreCase("status")) {
			hibernateTemplate.bulkUpdate(UPDATE_STATUS, memberVO.getStatus(), memberVO.getMemberID());
		} else if (update.equalsIgnoreCase("count")) {
			hibernateTemplate.bulkUpdate(UPDATE_COUNT, memberVO.getCount(), memberVO.getMemberID());
		}
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRED)
	public void delete(Integer memberID) {
		MemberVO memberVO = new MemberVO();
		memberVO.setMemberID(memberID);
		hibernateTemplate.delete(memberVO);
	}

	@Override
	public MemberVO findByPrimaryKey(Integer memberID) {
		MemberVO memberVO = hibernateTemplate.get(MemberVO.class, memberID);
		return memberVO;
	}

	@Override
	public MemberVO findByPrimaryKey(String email) {
		List<MemberVO> memberVOlist = (List<MemberVO>) hibernateTemplate.find("from MemberVO where email=?",email);
		MemberVO memberVO=null;
		if(memberVOlist.size()>0){
			memberVO=memberVOlist.get(0);
		}
		return memberVO;
	}

	@Override
	public List<MemberVO> getAll() {
		List<MemberVO> list = (List<MemberVO>) hibernateTemplate.find("from MemberVO");
		return list;
	}

	public static void main(String[] args) throws IOException {
		ApplicationContext context = new ClassPathXmlApplicationContext("beans-config.xml");

        // 建立DAO物件
		MemberDAO_interface dao =(MemberDAO_interface) context.getBean("memberDAO");
		//新增方法
//		MemberVO memberVO1= new MemberVO();
//		memberVO1.setmName("李XX");
//		memberVO1.setEmail("abc8512125230@yahyy.com.tw");
//		memberVO1.setmPassword("XXXX");
//		memberVO1.setRegisterDate(new Date(System.currentTimeMillis()));
//		memberVO1.setStatus((byte) 0);
//		memberVO1.setCount(1);
//		/*100行 是讀取硬碟路徑寫入資料庫方法*/
//		byte[] bytes = IOUtils.toByteArray(new FileInputStream(new File("src/main/webapp/img/imember_image.png")));
//		memberVO1.setmPhoto(bytes);
//		dao.insert(memberVO1);
		
		//修改方法
//		MemberVO memberVO2= new MemberVO();
//		memberVO2.setMemberID(100010);
//		memberVO2.setEmail("xxx@yahoo.com.tw");
//		memberVO2.setmPassword("123456");
//		dao.update(memberVO2, "member");
		
		//主建查詢
//		MemberVO memberVO3=dao.findByPrimaryKey(100010);
//		System.out.println(memberVO3.getMemberID());
//		System.out.println(memberVO3.getEmail());
//		System.out.println(memberVO3.getmPassword());
//		System.out.println(memberVO3.getmName());
//		System.out.println(memberVO3.getmPhoto());
//		System.out.println(memberVO3.getSkill());
//		System.out.println(memberVO3.getHobby());
//		System.out.println(memberVO3.getRegisterDate());
//		System.out.println(memberVO3.getStatus());
//		System.out.println(memberVO3.getCount());
//		System.out.println(memberVO3.getAddress());
//		
		//信箱查詢
//		MemberVO memberVO4=dao.findByPrimaryKey("XXXXX");
//		System.out.println(memberVO4.getMemberID());
//		System.out.println(memberVO4.getEmail());
//		System.out.println(memberVO4.getmPassword());
//		System.out.println(memberVO4.getmName());
//		System.out.println(memberVO4.getmPhoto());
//		System.out.println(memberVO4.getSkill());
//		System.out.println(memberVO4.getHobby());
//		System.out.println(memberVO4.getRegisterDate());
//		System.out.println(memberVO4.getStatus());
//		System.out.println(memberVO4.getCount());
//		System.out.println(memberVO4.getAddress());
		
		List<MemberVO> list=dao.getAll();
		for(MemberVO memberVO :list){
			System.out.print(memberVO.getMemberID()+"  ");
			System.out.print(memberVO.getEmail()+"  ");
			System.out.print(memberVO.getmPassword()+"  ");
			System.out.print(memberVO.getmName()+"  ");
			System.out.print(memberVO.getmPhoto()+"  ");
			System.out.print(memberVO.getSkill()+"  ");
			System.out.print(memberVO.getHobby()+"  ");
			System.out.print(memberVO.getRegisterDate()+"  ");
			System.out.print(memberVO.getStatus()+"  ");
			System.out.print(memberVO.getCount()+"  ");
			System.out.println(memberVO.getAddress());
		}
		
	}

}
