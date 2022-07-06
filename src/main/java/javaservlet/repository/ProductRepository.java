package javaservlet.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javaservlet.connection.DBCon;
import javaservlet.entity.Account;
import javaservlet.entity.Cart;
import javaservlet.entity.Category;
import javaservlet.entity.Product;

public class ProductRepository {

	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	private int noOfRecords;

public ProductRepository() {

}
public ProductRepository(Connection conn) {
	super();
	this.conn = conn;
}
	public List<Product> getAllProduct() {
		List<Product> list = new ArrayList<>();
		String query = "select * from product";
		try {
			conn = new DBCon().getConnection();
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			while(rs.next()) {
				list.add(new Product(
						rs.getInt(1), 
						rs.getString(2), 
						rs.getInt(3), 
						rs.getString(4)));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return list;
	}

	public Account login(String username, String password) {
		String query = "select * from account\n"
				+ "where [username] = ?\n"
				+ " and password = ?";
		try {
			conn = new DBCon().getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, username);
			ps.setString(2, password);
			rs = ps.executeQuery();
			while (rs.next()) {
				return new Account(
						rs.getInt(1),
						rs.getString(2),
						rs.getString(3),
						rs.getString(4),
						rs.getInt(5),
						rs.getInt(6));
			}
		}catch (Exception e){

		}
	return null;
	}

	public List<Cart> getCartProducts(ArrayList<Cart> cartList) {
		List<Cart> products = new ArrayList<Cart>();
		try {
			if (cartList.size()>0) {
				for (Cart item:cartList){
					String query = "select * from product where id=?";
					ps = conn.prepareStatement(query);
					ps.setInt(1,item.getId());
					rs = ps.executeQuery();
					while (rs.next()) {
						Cart row = new Cart();
						row.setId(rs.getInt("id"));
						row.setName(rs.getString("name"));
						row.setPrice(rs.getInt("price")*item.getQuantity());
						row.setQuantity(item.getQuantity());
						products.add(row);
					}
				}
			}
		}catch (Exception e){
			System.out.println(e.getMessage());
			e.printStackTrace();
		}

		return products;
	}



	public double getTotalCartPrice(ArrayList<Cart> cartList) {
		double sum =0;
		try {
			if (cartList.size()>0) {
				for (Cart item:cartList) {
					String query = "select price from product where id=?";
					ps = conn.prepareStatement(query);
					ps.setInt(1, item.getId());
					rs = ps.executeQuery();
					while (rs.next()) {
						sum+= rs.getInt("price")* item.getQuantity();
					}
				}
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return sum;
	}

	public List<Product> getAllProducts() {
		List<Product> products = new ArrayList<Product>();

		try {
			String query = "select * from product";
			ps = conn.prepareStatement(query);
			ps.executeQuery();
			while (rs.next()) {
				Product row = new Product();
				row.setId(rs.getInt("id"));
				row.setName(rs.getString("name"));
				row.setPrice(rs.getInt("price"));
				row.setImage(rs.getString("image"));
				products.add(row);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}

		return products;
	}

	public List<Category> getAllCategory() {
		List<Category> list = new ArrayList<>();
		String query = "select * from category";
		try {
			conn = new DBCon().getConnection();
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			while(rs.next()) {
				list.add(new Category(
						rs.getInt(1),
						rs.getString(2)));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}

		return list;
	}
	public Product getLast() {
		String query = "select top 1 * from product\n" + "order by id desc";

		try {
			conn = new DBCon().getConnection();
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			while (rs.next()) {
				return new Product(
						rs.getInt(1),
						rs.getString(2),
						rs.getInt(3),
						rs.getString(4));
			}
		} catch (Exception e) {

		}
		return null;
	}
	public Product getProductByID(String id) {
		String query = "select * from product\n"
				+ "where id = ?";
		try {
			conn = new DBCon().getConnection();//mo ket noi voi sql
			ps = conn.prepareStatement(query);
			ps.setString(1, id);
			rs = ps.executeQuery();
			while (rs.next()) {
				return new Product(
						rs.getInt(1),
						rs.getString(2),
						rs.getInt(3),
						rs.getString(4));
			}
		} catch (Exception e) {
		}
		return null;
	}


	public List<Product> searchByName(String txtSearch) {
		List<Product> list = new ArrayList<>();
		String query = "select * from product\n"
				+ "where [name] like ?";
		try {
			conn = new DBCon().getConnection();//mo ket noi voi sql
			ps = conn.prepareStatement(query);
			ps.setString(1,"%"+ txtSearch+"%");
			rs = ps.executeQuery();
			while (rs.next()) {
				list.add(new Product(
						rs.getInt(1),
						rs.getString(2),
						rs.getInt(3),
						rs.getString(4)));
			}
		} catch (Exception e) {
		}
		return list;
	}


	public List<Product> viewProduct(int offset, int noOfRecords) {

		String query = "select SQL_CALC_FOUND_ROWS * from product limit " + offset + ", " + noOfRecords;

		List<Product> list = new ArrayList<Product>();

		Product product = null;

		try {
			conn = new DBCon().getConnection();//mo ket noi voi sql
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			while (rs.next()) {
				product = new Product();
				product.setId(rs.getInt("id"));
				product.setName(rs.getString("name"));
				product.setPrice(rs.getInt("price"));
				product.setImage(rs.getString("image"));
				list.add(product);
			}
			rs.close();
			rs = ps.executeQuery("SELECT FOUND_ROWS()");
			if (rs.next())
				this.noOfRecords = rs.getInt(1);
		} catch (Exception e){
			e.printStackTrace();
		}
		return list;
	}

	public int getNoOfRecords() {
		return noOfRecords;
	}

	public static void main(String[] args) {
		ProductRepository productRepository = new ProductRepository();
		List<Product> list = productRepository.getAllProduct();
//		for (Product product : list) {
//			System.out.println(product);
//		}


	}
}
