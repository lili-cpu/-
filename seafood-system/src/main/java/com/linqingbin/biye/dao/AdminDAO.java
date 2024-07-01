package com.linqingbin.biye.dao;


import com.linqingbin.biye.pojo.Admin;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AdminDAO extends JpaRepository<Admin,Integer> {
    Admin getByNameAndPassword(String name, String password);
}
