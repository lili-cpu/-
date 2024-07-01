package com.linqingbin.biye.dao;
 

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.linqingbin.biye.pojo.Product;
import com.linqingbin.biye.pojo.Property;
import com.linqingbin.biye.pojo.PropertyValue;

public interface PropertyValueDAO extends JpaRepository<PropertyValue,Integer>{

	List<PropertyValue> findByProductOrderByIdDesc(Product product);
	PropertyValue getByPropertyAndProduct(Property property, Product product);

	
	
	
}
