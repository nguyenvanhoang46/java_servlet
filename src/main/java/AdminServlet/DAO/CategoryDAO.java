package AdminServlet.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import AdminServlet.Connection.Connect;
import AdminServlet.Model.Category;
import AdminServlet.Model.Product;
import AdminServlet.Model.Account;

public class CategoryDAO {
	
	private static final String INSERT_CATEGORY_SQL = "INSERT INTO category" + "(cname) VALUES "+ " (?);";  
    private static final String SELECT_CATEGORY_BY_ID = "select cid,cname from category where cid =?";
    private static final String SELECT_ALL_CATEGORY = "select * from category";
    private static final String DELETE_CATEGORY_SQL = "delete from category where cid = ?;";
    private static final String UPDATE_CATEGORY_SQL = "update category set cname = ? where cid = ?;";
    private int noOfRecords;
    public void CategoryDao() {}
    
    public void insertCategory(Category category) throws SQLException {
        System.out.println(INSERT_CATEGORY_SQL);
        Connection connection=null;
        
        connection =Connect.ConnectDb();
        try (
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_CATEGORY_SQL)) {
            preparedStatement.setString(1, category.getName()); 
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }

    public Category selectCategory(int id) {
    	Category category = null;
        Connection connection=null;
        
        connection =Connect.ConnectDb();
        try ( 
             
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_CATEGORY_BY_ID);) {
            preparedStatement.setInt(1, id);
            System.out.println(preparedStatement);
         
            ResultSet rs = preparedStatement.executeQuery(); 
            
            while (rs.next()) {
                String name = rs.getString("cname"); 
                 
                category = new Category(id, name  );
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return category;
    }

    public List<Category> selectAllCategory() { 
        List<Category> category = new ArrayList<>();
        Connection connection=null;
        
        connection =Connect.ConnectDb();
        try ( 
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_CATEGORY);) {
            System.out.println(preparedStatement);  
            ResultSet rs = preparedStatement.executeQuery(); 
            while (rs.next()) {
                int id = rs.getInt("cid");
                String name = rs.getString("cname");
                  
                category.add(new Category(id, name )); 
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return category;
    }
    public List<Category> viewCategory(int offset, int noOfRecords) {

		String query = "select SQL_CALC_FOUND_ROWS * from category limit " + offset + ", " + noOfRecords;
		List<Category> category = new ArrayList<>();
        Connection connection=null;  

		try {
			 connection =Connect.ConnectDb();
			 PreparedStatement preparedStatement = connection.prepareStatement(query);
			 ResultSet rs = preparedStatement.executeQuery(); 
			while (rs.next()) {
				 int id = rs.getInt("cid");
	                String name = rs.getString("cname");
	                  
	                category.add(new Category(id, name )); 
			}
			rs.close();
			rs = preparedStatement.executeQuery("SELECT FOUND_ROWS()");
			if (rs.next())
				this.noOfRecords = rs.getInt(1);
		} catch (Exception e){
			e.printStackTrace();
		}
		return category;
	}

	public int getNoOfRecords() {
		return noOfRecords;
	}
    public List<Category> Search(String keyword)  { 
        List<Category> category = new ArrayList<>();
        Connection connection=null;
        String searchsql="select * from category where cname like \"%"+keyword+"%\"";
        System.out.println(searchsql);
        connection =Connect.ConnectDb();
        try ( 
             PreparedStatement preparedStatement = connection.prepareStatement(searchsql);) {
            System.out.println(preparedStatement);  
            ResultSet rs = preparedStatement.executeQuery(); 
            while (rs.next()) {
                int id = rs.getInt("cid");
                String name = rs.getString("cname");
                  
                category.add(new Category(id, name )); 
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return category;
    }

    public boolean deleteCategory(int id) throws SQLException {
        boolean rowDeleted;
        Connection connection=null;
        
        connection =Connect.ConnectDb();
        try ( 
             PreparedStatement statement = connection.prepareStatement(DELETE_CATEGORY_SQL);) {
            statement.setInt(1, id);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    public boolean updateCategory(Category category) throws SQLException {
        boolean rowUpdated;
        Connection connection=null;
        
        connection =Connect.ConnectDb();
        try ( 
             PreparedStatement statement = connection.prepareStatement(UPDATE_CATEGORY_SQL);) {
            statement.setString(1, category.getName());
             
            statement.setInt(2, category.getId());

            rowUpdated = statement.executeUpdate() > 0;
        }
        return rowUpdated;
    }

    private void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
	
}
