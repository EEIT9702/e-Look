package _zhi;

import java.util.List;

public interface BuyCourseDAO_interface {
	 public void insert(BuyCourseVO memberVO);
     public void update(BuyCourseVO memberVO);
     public void delete(Integer memberID);
     public BuyCourseVO findByPrimaryKey(Integer memberID);
     public List<BuyCourseVO> getAll();
}
