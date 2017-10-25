package com.e_Look.Order.model;
import java.util.List;
public interface OrderDAO_interface {
public void insert(OrderVO OrderVO);
public void update(OrderVO OrderVO);
public void delete(Integer orderID);
public OrderVO findMemberUncheckOrder(Integer memberID);
public OrderVO findByPrimaryKey(Integer orderID);
public List<OrderVO> getAll();
}
