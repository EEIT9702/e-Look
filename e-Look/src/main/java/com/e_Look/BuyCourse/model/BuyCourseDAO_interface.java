package com.e_Look.BuyCourse.model;

import java.util.List;

public interface BuyCourseDAO_interface {
	 public void insert(BuyCourseVO buyCourseVO);
     public void update(BuyCourseVO buyCourseVO);
     public void delete(BuyCourseVO buyCourseVO);
     public Double getAvgScore(Integer courseID);
     public List<BuyCourseVO> findByMemberID(Integer memberID);
     public List<BuyCourseVO> getAll();
}
