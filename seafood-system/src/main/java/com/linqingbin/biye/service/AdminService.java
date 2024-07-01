package com.linqingbin.biye.service;


import com.linqingbin.biye.dao.AdminDAO;
import com.linqingbin.biye.pojo.Admin;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminService {
    @Autowired
    AdminDAO adminDAO;
    public Admin get(String name, String password){
        return adminDAO.getByNameAndPassword(name, password);
    }
}
