package com.e_Look.member.model;

import java.util.List;

public interface MemberDAO_interface {
	 public void insert(MemberVO memberVO);
     public void update(MemberVO memberVO,String update);
     public void delete(Integer memberID);
     public MemberVO  findByPrimaryKey(Integer memberID);
     public List<MemberVO> getAll();
}
