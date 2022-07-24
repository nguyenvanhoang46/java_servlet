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
import AdminServlet.DAO.ProductDAO;
import AdminServlet.Model.Category;
import AdminServlet.Model.Product;

 

/**
 * Servlet implementation class SearchProductController
 */
@WebServlet("/SearchProductController")
public class SearchProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public SearchProductController() {
        super();
         
    }

	 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String keyword3=request.getParameter("keyword");
		if(keyword3==null) {
			keyword3="";
		}
		ProductDAO  productDAO = new ProductDAO();
		CategoryDAO categoryDAO= new CategoryDAO();
		List<Product> product = productDAO.Search(keyword3);
		List<Category> listCategory = categoryDAO.selectAllCategory();
		request.setAttribute("listCategory", listCategory);
		request.setAttribute("listProduct", product);
		request.setAttribute("keyword1", keyword3);
		RequestDispatcher requestDispatcher =request.getRequestDispatcher("Admin/list-product.jsp");
		requestDispatcher.forward(request, response);
	}

  

}
