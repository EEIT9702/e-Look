package com.e_Look.memberBookmarks;

import java.util.List;

public interface MemberBookmarksDAO_interface {
	
	public void insert(MemberBookmarksVO memberBookmarksVO);
	public void update(MemberBookmarksVO memberBookmarksVO);
	public void delete(Integer memberID, Integer courseID);
	public List<MemberBookmarksVO> findByMemberID(Integer memberID);
	public List<MemberBookmarksVO> getAll();

}
