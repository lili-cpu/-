package com.linqingbin.biye.dao;
 
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.linqingbin.biye.pojo.Product;
import com.linqingbin.biye.pojo.ProductImage;

public interface ProductImageDAO extends JpaRepository<ProductImage,Integer>{
	public List<ProductImage> findByProductAndTypeOrderByIdDesc(Product product, String type);
	
}
