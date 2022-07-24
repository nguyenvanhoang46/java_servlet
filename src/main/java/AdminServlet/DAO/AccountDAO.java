package AdminServlet.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import AdminServlet.Connection.Connect;
import AdminServlet.Model.Account;
import AdminServlet.Model.Product;

 
	public class AccountDAO {
 

	    private static final String INSERT_ACCOUNT_SQL = "INSERT INTO account" + "  (username,password, email,issell  ,isadmin) VALUES "
	            + " (?, ?,?, ?,?);";

	    private static final String SELECT_ACCOUNT_BY_ID = "select id,username,password, email ,issell ,isadmin from account where id =?";
	    private static final String SELECT_ALL_ACCOUNT = "select * from account";
	    private static final String DELETE_ACCOUNT_SQL = "delete from account where id = ?;";
	    private static final String UPDATE_ACCOUNT_SQL = "update account set username=?,password=?, email=? ,issell=? ,isadmin=? where id = ?;";
	    private int noOfRecords;
	    public AccountDAO() {
	    }

 
	    public void insertAccount(Account user) throws SQLException {
	        System.out.println(INSERT_ACCOUNT_SQL);
	        Connection connection=null;
	        
	        connection =Connect.ConnectDb();
	        try (
	             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_ACCOUNT_SQL)) {
	            preparedStatement.setString(1, user.getUser());
	            preparedStatement.setString(2, user.getPass());
	            preparedStatement.setString(3, user.getEmail()); 
	            preparedStatement.setInt(4, user.getIsSell());
	            preparedStatement.setInt(5, user.getIsAdmin());
	            System.out.println(preparedStatement);
	            preparedStatement.executeUpdate();
	        } catch (SQLException e) {
	            printSQLException(e);
	        }
	    }

	    public Account selectAccount(int id) {
	        Account user = null;
	        Connection connection=null;
	        
	        connection =Connect.ConnectDb();
	        try ( 
	             
	             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ACCOUNT_BY_ID);) {
	            preparedStatement.setInt(1, id);
	            System.out.println(preparedStatement);
	         
	            ResultSet rs = preparedStatement.executeQuery(); 
	            
	            while (rs.next()) {
	                String username = rs.getString("username");
	                String password = rs.getString("password");
	                String email = rs.getString("email"); 
	                int isSell = rs.getInt("isSell");
	                int isAdmin = rs.getInt("isAdmin");
	                user = new Account(id, username,password ,email,isSell, isAdmin);
	            }
	        } catch (SQLException e) {
	            printSQLException(e);
	        }
	        return user;
	    }

	    public List<Account> selectAllAccount(int offset, int noOfRecords) { 
	    	String query = "select SQL_CALC_FOUND_ROWS * from account limit " + offset + ", " + noOfRecords;
	        List<Account> users = new ArrayList<>();
	        Connection connection=null;
	        
	        connection =Connect.ConnectDb();
	        try ( 
	             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_ACCOUNT);) {
	            System.out.println(preparedStatement);  
	            ResultSet rs = preparedStatement.executeQuery(); 
	            while (rs.next()) {
	                int id = rs.getInt("id");
	                String username = rs.getString("username");
	                String password = rs.getString("password");
	                String email = rs.getString("email");
	                int isSell = rs.getInt("isSell");
	                int isAdmin = rs.getInt("isAdmin");
	                users.add(new Account(id, username,password ,email,isSell, isAdmin));
	            }
	            rs.close();
				rs = preparedStatement.executeQuery("SELECT FOUND_ROWS()");
				if (rs.next())
					this.noOfRecords = rs.getInt(1);
	        } catch (SQLException e) {
	            printSQLException(e);
	        }
	        return users;
	    }
	    public List<Account> viewAccount(int offset, int noOfRecords) {

			String query = "select SQL_CALC_FOUND_ROWS * from account limit " + offset + ", " + noOfRecords;
			List<Account> users = new ArrayList<>();
	        Connection connection=null;  

			try {
				 connection =Connect.ConnectDb();
				 PreparedStatement preparedStatement = connection.prepareStatement(query);
				 ResultSet rs = preparedStatement.executeQuery(); 
				 while (rs.next()) {
		                int id = rs.getInt("id");
		                String username = rs.getString("username");
		                String password = rs.getString("password");
		                String email = rs.getString("email");
		                int isSell = rs.getInt("isSell");
		                int isAdmin = rs.getInt("isAdmin");
		                users.add(new Account(id, username,password ,email,isSell, isAdmin));
				}
				rs.close();
				rs = preparedStatement.executeQuery("SELECT FOUND_ROWS()");
				if (rs.next())
					this.noOfRecords = rs.getInt(1);
			} catch (Exception e){
				e.printStackTrace();
			}
			return users;
		}
	    public int getNoOfRecords() {
			return noOfRecords;
		}

	    public List<Account> Search(String keyword) { 
	        List<Account> account = new ArrayList<>();
	        Connection connection=null;
	        String searchsql="select * from account where username like \"%"+keyword+"%\" or email like \"%"+keyword+"%\"";
	        System.out.println(searchsql);
	        connection =Connect.ConnectDb();
	        try ( 
	             PreparedStatement preparedStatement = connection.prepareStatement(searchsql);) {
	            System.out.println(preparedStatement);  
	            ResultSet rs = preparedStatement.executeQuery(); 
	            while (rs.next()) {
	                int id = rs.getInt("id");
	                String username = rs.getString("username");
	                String password = rs.getString("password");
	                String email = rs.getString("email");
	                int isSell = rs.getInt("isSell");
	                int isAdmin = rs.getInt("isAdmin");
	                account.add(new Account(id, username,password ,email,isSell, isAdmin));
	            }
	        } catch (SQLException e) {
	            printSQLException(e);
	        }
	        return account;
	    }

	    public boolean deleteAccount(int id) throws SQLException {
	        boolean rowDeleted;
	        Connection connection=null;
	        
	        connection =Connect.ConnectDb();
	        try ( 
	             PreparedStatement statement = connection.prepareStatement(DELETE_ACCOUNT_SQL);) {
	            statement.setInt(1, id);
	            rowDeleted = statement.executeUpdate() > 0;
	        }
	        return rowDeleted;
	    }

	    public boolean updateAccount(Account acc) throws SQLException {
	        boolean rowUpdated;
	        Connection connection=null;
	        
	        connection =Connect.ConnectDb();
	        try ( 
	             PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_ACCOUNT_SQL);) {
	        	preparedStatement.setString(1, acc.getUser());
	            preparedStatement.setString(2, acc.getPass());
	            preparedStatement.setString(3, acc.getEmail()); 
	            preparedStatement.setInt(4, acc.getIsSell());
	            preparedStatement.setInt(5, acc.getIsAdmin());
	            preparedStatement.setInt(6, acc.getId());

	            rowUpdated = preparedStatement.executeUpdate() > 0;
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
