package com.DAO;

import java.util.List;
import com.entity.Brand;

public interface BrandDAO {

//	public boolean addBrand(Brand p);

	public List<Brand> getAllBrand();

	public Brand getProductById(int id);

	public List<Brand> getBrandByCat(int id);

	public boolean deleteBrand(int id);

}
