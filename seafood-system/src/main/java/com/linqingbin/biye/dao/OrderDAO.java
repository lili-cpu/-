package com.linqingbin.biye.dao;
 
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.linqingbin.biye.pojo.Order;
import com.linqingbin.biye.pojo.User;

public interface OrderDAO extends JpaRepository<Order,Integer>{
    public List<Order> findByUserAndStatusNotOrderByIdDesc(User user, String status);
}
