package javaservlet.repository;

import javaservlet.connection.DBCon;
import javaservlet.entity.Category;
import javaservlet.entity.Product;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class CategoryRepository {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

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

    public static void main(String[] args) {
        CategoryRepository categoryRepository = new CategoryRepository();
        List<Category> list = categoryRepository.getAllCategory();
        for (Category category : list) {
            System.out.println(category);
        }
    }
}
