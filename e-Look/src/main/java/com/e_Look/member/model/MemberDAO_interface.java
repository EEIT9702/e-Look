package com.e_Look.member.model;

import java.util.List;

import org.hibernate.Session;
import org.springframework.orm.hibernate5.HibernateTemplate;

public interface MemberDAO_interface {

	 public void insert(MemberVO memberVO);
     public void update(MemberVO memberVO,String update);
     public void updataimage(MemberVO memberVO);
     public void delete(Integer memberID);
     public MemberVO  findByPrimaryKey(Integer memberID);
     public MemberVO  findByPrimaryKey(String email);
     public List<MemberVO> getAll();
}
