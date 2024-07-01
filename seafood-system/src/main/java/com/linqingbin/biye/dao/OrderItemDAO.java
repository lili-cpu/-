package com.linqingbin.biye.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.linqingbin.biye.pojo.Order;
import com.linqingbin.biye.pojo.OrderItem;
import com.linqingbin.biye.pojo.Product;
import com.linqingbin.biye.pojo.User;

public interface OrderItemDAO extends JpaRepository<OrderItem,Integer>{
	List<OrderItem> findByOrderOrderByIdDesc(Order order);
	List<OrderItem> findByProduct(Product product);
	List<OrderItem> findByUserAndOrderIsNull(User user);
}
