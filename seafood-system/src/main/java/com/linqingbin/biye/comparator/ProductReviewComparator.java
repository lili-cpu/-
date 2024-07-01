package com.linqingbin.biye.comparator;


import java.util.Comparator;

import com.linqingbin.biye.pojo.Product;

public class ProductReviewComparator implements Comparator<Product> {

	@Override
	public int compare(Product p1, Product p2) {
		return p2.getReviewCount()-p1.getReviewCount();
	}

}
