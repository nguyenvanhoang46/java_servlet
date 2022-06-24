package javaservlet.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javaservlet.connection.DBCon;
import javaservlet.entity.Category;
import javaservlet.entity.Product;

public class ProductRepository {

	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
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




	public static void main(String[] args) {
		ProductRepository productRepository = new ProductRepository();
		List<Product> list = productRepository.getAllProduct();
		for (Product product : list) {
			System.out.println(product);
		}
	}
}
