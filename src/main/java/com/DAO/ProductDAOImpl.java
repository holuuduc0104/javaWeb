package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Brand;
import com.entity.Product;

public class ProductDAOImpl implements ProductDAO {

	private Connection conn;

	public ProductDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	@Override
	public boolean addProduct(Product p) {
		boolean f = false;
		try {
			String sql = "insert into tb_product(productName,catID,brandID,product_desc,product_info,type,price,image) values (?,?,?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, p.getProductName());
			ps.setInt(2, p.getCatID());
			ps.setInt(3, p.getBrandID());
			ps.setString(4, p.getProduct_desc());
			ps.setString(5, p.getProduct_info());
			ps.setInt(6, p.getType());
			ps.setDouble(7, p.getPrice());
			ps.setString(8, p.getImage());

			int i = ps.executeUpdate();

			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	@Override
	public List<Product> getAllProduct() {

		List<Product> list = new ArrayList<Product>();
		Product p = null;

		try {

			String sql = "SELECT tb_product.*, tb_category.catName, tb_brand.brandName \r\n"
					+ "        FROM tb_product INNER JOIN tb_category ON tb_product.catID = tb_category.catID \r\n"
					+ "        INNER JOIN tb_brand ON tb_product.brandID = tb_brand.brandID \r\n"
					+ "        ORDER BY tb_product.productID DESC";
			PreparedStatement ps = conn.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				p = new Product();
				p.setProductID(rs.getInt(1));
				p.setProductName(rs.getString(2));
				p.setCatID(rs.getInt(3));
				p.setBrandID(rs.getInt(4));
				p.setProduct_desc(rs.getString(5));
				p.setProduct_info(rs.getString(6));
				p.setType(rs.getInt(7));
				p.setPrice(rs.getDouble(8));
				p.setImage(rs.getString(9));
				p.setCatName(rs.getString("catName"));
				p.setBrandName(rs.getString("brandName"));

				list.add(p);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public Product getProductById(int id) {

		Product p = null;
		try {
			String sql = "SELECT tb_product.*, tb_category.catName, tb_brand.brandName FROM tb_product INNER JOIN tb_category ON tb_product.catID = tb_category.catID INNER JOIN tb_brand ON tb_product.brandID = tb_brand.brandID where productID=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				p = new Product();
				p.setProductID(rs.getInt(1));
				p.setProductName(rs.getString(2));
				p.setCatID(rs.getInt(3));
				p.setBrandID(rs.getInt(4));
				p.setProduct_desc(rs.getString(5));
				p.setProduct_info(rs.getString(6));
				p.setType(rs.getInt(7));
				p.setPrice(rs.getDouble(8));
				p.setImage(rs.getString(9));

				p.setCatName(rs.getString("catName"));
				p.setBrandName(rs.getString("brandName"));

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return p;
	}

	@Override
	public boolean updateEditProduct(Product p) {
		boolean f = false;
		try {
			String sql = "update tb_product set productName=?,catID=?,brandID=?,product_desc=?,product_info=?,type=?,price=? where productID=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, p.getProductName());
			ps.setInt(2, p.getCatID());
			ps.setInt(3, p.getBrandID());
			ps.setString(4, p.getProduct_desc());
			ps.setString(5, p.getProduct_info());
			ps.setInt(6, p.getType());
			ps.setDouble(7, p.getPrice());
			ps.setInt(8, p.getProductID());

			int i = ps.executeUpdate();

			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	@Override
	public boolean deleteProduct(int id) {

		boolean f = false;
		try {
			String sql = "delete from tb_product where productID=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}


	@Override
	public List<Product> getFeaturedProduct() {
		List<Product> list = new ArrayList<Product>();
		Product p = null;

		try {

			String sql = "SELECT * FROM tb_product WHERE type = '1' LIMIT 8";
			PreparedStatement ps = conn.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				p = new Product();
				p.setProductID(rs.getInt(1));
				p.setProductName(rs.getString(2));
				p.setCatID(rs.getInt(3));
				p.setBrandID(rs.getInt(4));
				p.setProduct_desc(rs.getString(5));
				p.setProduct_info(rs.getString(6));
				p.setType(rs.getInt(7));
				p.setPrice(rs.getDouble(8));
				p.setImage(rs.getString(9));
				list.add(p);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public List<Product> getProductByCate(int id) {
		List<Product> list = new ArrayList<>();

		try {
			String sql = "SELECT * FROM tb_product WHERE catID = ? ORDER BY productID desc LIMIT 8";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Product p = new Product();
				p.setProductID(rs.getInt(1));
				p.setProductName(rs.getString(2));
				p.setCatID(rs.getInt(3));
				p.setBrandID(rs.getInt(4));
				p.setProduct_desc(rs.getString(5));
				p.setProduct_info(rs.getString(6));
				p.setType(rs.getInt(7));
				p.setPrice(rs.getDouble(8));
				p.setImage(rs.getString(9));
				list.add(p);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Product> getProductByCatePage(int catid, int currentPage) {

		List<Product> list = new ArrayList<>();

		try {
			int limit = 16;

			int start = (currentPage - 1) * limit;

			String sql = "SELECT * FROM tb_product WHERE catID = ? ORDER BY productID DESC LIMIT ? OFFSET ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, catid);
			ps.setInt(2, limit);
			ps.setInt(3, start);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Product p = new Product();
				p.setProductID(rs.getInt(1));
				p.setProductName(rs.getString(2));
				p.setCatID(rs.getInt(3));
				p.setBrandID(rs.getInt(4));
				p.setProduct_desc(rs.getString(5));
				p.setProduct_info(rs.getString(6));
				p.setType(rs.getInt(7));
				p.setPrice(rs.getDouble(8));
				p.setImage(rs.getString(9));
				list.add(p);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Product> getProductByBrand(int catid, int brandid, int currentPage) {
		List<Product> list = new ArrayList<>();

		try {
			int limit = 16;

			int start = (currentPage - 1) * limit;

			String sql = "SELECT * FROM tb_product WHERE catID = ? AND brandID = ? ORDER BY productID desc LIMIT ? OFFSET ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, catid);
			ps.setInt(2, brandid);
			ps.setInt(3, limit);
			ps.setInt(4, start);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Product p = new Product();
				p.setProductID(rs.getInt(1));
				p.setProductName(rs.getString(2));
				p.setCatID(rs.getInt(3));
				p.setBrandID(rs.getInt(4));
				p.setProduct_desc(rs.getString(5));
				p.setProduct_info(rs.getString(6));
				p.setType(rs.getInt(7));
				p.setPrice(rs.getDouble(8));
				p.setImage(rs.getString(9));
				list.add(p);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Product> getAllProductByBrand(int catid, int brandid) {
		List<Product> list = new ArrayList<>();

		try {
			String sql = "SELECT * FROM tb_product WHERE catID = ? AND brandID = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, catid);
			ps.setInt(2, brandid);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Product p = new Product();
				p.setProductID(rs.getInt(1));
				p.setProductName(rs.getString(2));
				p.setCatID(rs.getInt(3));
				p.setBrandID(rs.getInt(4));
				p.setProduct_desc(rs.getString(5));
				p.setProduct_info(rs.getString(6));
				p.setType(rs.getInt(7));
				p.setPrice(rs.getDouble(8));
				p.setImage(rs.getString(9));
				list.add(p);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Product> getAllProductByCate(int id) {
		List<Product> list = new ArrayList<>();

		try {
			String sql = "SELECT * FROM tb_product WHERE catID = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Product p = new Product();
				p.setProductID(rs.getInt(1));
				p.setProductName(rs.getString(2));
				p.setCatID(rs.getInt(3));
				p.setBrandID(rs.getInt(4));
				p.setProduct_desc(rs.getString(5));
				p.setProduct_info(rs.getString(6));
				p.setType(rs.getInt(7));
				p.setPrice(rs.getDouble(8));
				p.setImage(rs.getString(9));
				list.add(p);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Product> getProductBySearch(String key) {
		List<Product> list = new ArrayList<>();

		try {
			String sql = "SELECT * FROM tb_product WHERE productName LIKE ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "%"+key+"%");

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Product p = new Product();
				p.setProductID(rs.getInt(1));
				p.setProductName(rs.getString(2));
				p.setCatID(rs.getInt(3));
				p.setBrandID(rs.getInt(4));
				p.setProduct_desc(rs.getString(5));
				p.setProduct_info(rs.getString(6));
				p.setType(rs.getInt(7));
				p.setPrice(rs.getDouble(8));
				p.setImage(rs.getString(9));
				list.add(p);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	

}
