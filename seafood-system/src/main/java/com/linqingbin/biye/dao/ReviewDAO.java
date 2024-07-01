package com.linqingbin.biye.dao;
 
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.linqingbin.biye.pojo.Product;
import com.linqingbin.biye.pojo.Review;

public interface ReviewDAO extends JpaRepository<Review,Integer>{

	List<Review> findByProductOrderByIdDesc(Product product);
	int countByProduct(Product product);

}
