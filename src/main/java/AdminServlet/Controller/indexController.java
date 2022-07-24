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

import AdminServlet.DAO.AccountDAO;
import AdminServlet.DAO.CategoryDAO;
import AdminServlet.DAO.ProductDAO;
import AdminServlet.Model.Category;
import AdminServlet.Model.Product;

@WebServlet(name = "indexController", urlPatterns = "/Admin")
public class indexController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		if (action == null) {
			action = "";
		}
		try {
			switch (action) {
			case "viewProduct":
				viewProduct(request, response);
				break;
			case "viewCategory":
				viewCategory(request, response);
				break;
			case "viewAccount":
				viewAccount(request, response);
				break;
			case "home":
				home(request, response);
				break;
			default:
				login(request, response);
				break;
			}
		} catch (SQLException ex) {
			throw new ServletException(ex);
		}
	}
	

	private void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("Admin/login.jsp");
		dispatcher.forward(request, response);
		
	}


	private void home(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {

		RequestDispatcher dispatcher = request.getRequestDispatcher("Admin/HomePage.jsp");
		dispatcher.forward(request, response);
	}

	private void viewProduct(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		RequestDispatcher dispatcher = request.getRequestDispatcher("Admin/list-product.jsp");
		dispatcher.forward(request, response);
	}

	private void viewCategory(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		RequestDispatcher dispatcher = request.getRequestDispatcher("Admin/product-form.jsp");

		dispatcher.forward(request, response);

	}

	private void viewAccount(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		RequestDispatcher dispatcher = request.getRequestDispatcher("Admin/list-account.jsp");
		dispatcher.forward(request, response);
	}

}
