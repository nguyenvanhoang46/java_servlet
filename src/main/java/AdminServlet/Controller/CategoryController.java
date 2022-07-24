package AdminServlet.Controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import AdminServlet.DAO.CategoryDAO;
import AdminServlet.Model.Category;
import AdminServlet.Model.Account;

 
@WebServlet("/CategoryCTL")
public class CategoryController extends HttpServlet { 
       private CategoryDAO categoryDAO;
       
   
    public CategoryController() {
        super();
         
    }
	 public void init() {
		 categoryDAO=new CategoryDAO();
	 } 

	 
	 protected void doPost(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	        doGet(request, response);
	    }

	    protected void doGet(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	    	String action = request.getParameter("action");
			if(action == null) {
				action=""; 
			}

	        try {
	            switch (action) {
	                case "insertCategory":
	                    insertCategory(request, response);
	                    break;
	                case "deleteCategory":
	                    deleteCategory(request, response);
	                    break;
	                case "editCategory":
	                    showEditForm(request, response);
	                    break;
	                case "updateCategory":
	                    updateCategory(request, response);
	                    break;
	                default:
	                    listCategory(request, response);
	                    break;
	            }
	        } catch (SQLException ex) {
	            throw new ServletException(ex);
	        }
	    }

	    private void listCategory(HttpServletRequest request, HttpServletResponse response)
	            throws SQLException, IOException, ServletException {
	    	int page = 1;
			int recordsPerPage = 5;
			if (request.getParameter("page") != null)
				page = Integer.parseInt(request.getParameter("page"));
			
	        List<Category> listCategory = categoryDAO.viewCategory((page - 1) * recordsPerPage, recordsPerPage);
			int noOfRecords = categoryDAO.getNoOfRecords();
			int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / recordsPerPage);
			request.setAttribute("noOfPages", noOfPages);
			request.setAttribute("currentPage", page);
	        request.setAttribute("listCategory", listCategory);
	        
	        RequestDispatcher dispatcher = request.getRequestDispatcher("Admin/list-category.jsp");
	        dispatcher.forward(request, response);
	    }

	    

	    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
	            throws SQLException, ServletException, IOException { 
	    	 
	        
	        int id = Integer.parseInt(request.getParameter("id"));
	        Category existingCategory = categoryDAO.selectCategory(id);
	        RequestDispatcher dispatcher = request.getRequestDispatcher("Admin/category-form.jsp");
	        request.setAttribute("category", existingCategory);
	        dispatcher.forward(request, response);

	    }

	    private void insertCategory(HttpServletRequest request, HttpServletResponse response)
	            throws SQLException, IOException {
	        String name = request.getParameter("name");  
	        Category newCategory = new Category(name );
	        categoryDAO.insertCategory(newCategory);
	        response.sendRedirect("/javaservlet/CategoryCTL");
	    }

	    private void updateCategory(HttpServletRequest request, HttpServletResponse response)
	            throws SQLException, IOException {
	        int id = Integer.parseInt(request.getParameter("id"));
	        String name = request.getParameter("name");   
	        Category book = new Category(id, name );
	        categoryDAO.updateCategory(book);
	        response.sendRedirect("/javaservlet/CategoryCTL");
	    }

	    private void deleteCategory(HttpServletRequest request, HttpServletResponse response)
	            throws SQLException, IOException {
	        int id = Integer.parseInt(request.getParameter("id"));
	        categoryDAO.deleteCategory(id);
	        response.sendRedirect("/javaservlet/CategoryCTL");

	    }
}
