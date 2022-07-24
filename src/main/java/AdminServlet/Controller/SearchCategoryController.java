package AdminServlet.Controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import AdminServlet.DAO.CategoryDAO;
import AdminServlet.Model.Category;

 

/**
 * Servlet implementation class SearchCategoryController
 */
@WebServlet("/SearchCategoryController")
public class SearchCategoryController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public SearchCategoryController() {
        super();
         
    }

	 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String keyword3=request.getParameter("keyword");
		if(keyword3==null) {
			keyword3="";
		}
		CategoryDAO  categoryDAO = new CategoryDAO();
		List<Category> category = categoryDAO.Search(keyword3);
		request.setAttribute("listCategory", category);
		request.setAttribute("keyword1", keyword3);
		RequestDispatcher requestDispatcher =request.getRequestDispatcher("Admin/list-category.jsp");
		requestDispatcher.forward(request, response);
	}
	

	 
	 
}
