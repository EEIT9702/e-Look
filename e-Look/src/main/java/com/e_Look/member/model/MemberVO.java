package com.e_Look.member.model;


import java.io.InputStream;
import java.io.Serializable;
import java.sql.Date;

public class MemberVO implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private Integer memberID;
	private String email;
	private String mPassword;
	private String mName;
	private InputStream  mPhoto;
	private String skill;
	private String hobby;
	private Date registerDate;
	private Byte status;
	private Integer count;
	private String address;
	public MemberVO(){};
	
	public MemberVO(Integer memberID, String email, String mPassword, String mName, InputStream mPhoto, String skill,
			String hobby, Date registerDate, Byte status, Integer count, String address) {
		this.memberID = memberID;
		this.email = email;
		this.mPassword = mPassword;
		this.mName = mName;
		this.mPhoto = mPhoto;
		this.skill = skill;
		this.hobby = hobby;
		this.registerDate = registerDate;
		this.status = status;
		this.count = count;
		this.address = address;
	}

	public Integer getMemberID() {
		return memberID;
	}

	public void setMemberID(Integer memberID) {
		this.memberID = memberID;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getmPassword() {
		return mPassword;
	}

	public void setmPassword(String mPassword) {
		this.mPassword = mPassword;
	}

	public String getmName() {
		return mName;
	}

	public void setmName(String mName) {
		this.mName = mName;
	}

	public InputStream getmPhoto() {
		return mPhoto;
	}

	public void setmPhoto(InputStream mPhoto) {
		this.mPhoto = mPhoto;
	}

	public String getSkill() {
		return skill;
	}

	public void setSkill(String skill) {
		this.skill = skill;
	}

	public String getHobby() {
		return hobby;
	}

	public void setHobby(String hobby) {
		this.hobby = hobby;
	}

	public Date getRegisterDate() {
		return registerDate;
	}

	public void setRegisterDate(Date registerDate) {
		this.registerDate = registerDate;
	}

	public Byte getStatus() {
		return status;
	}

	public void setStatus(Byte status) {
		this.status = status;
	}

	public Integer getCount() {
		return count;
	}

	public void setCount(Integer count) {
		this.count = count;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

}
