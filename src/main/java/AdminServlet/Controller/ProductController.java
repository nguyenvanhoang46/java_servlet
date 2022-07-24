package AdminServlet.Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import AdminServlet.DAO.CategoryDAO;
import AdminServlet.DAO.ProductDAO;
import AdminServlet.DAO.AccountDAO;
import AdminServlet.Model.Category;
import AdminServlet.Model.Product;
import AdminServlet.Model.Account;

@WebServlet(urlPatterns = { "/ProductCTL" })
public class ProductController extends HttpServlet {
	private ProductDAO productDAO;
	private CategoryDAO categoryDAO;

	public ProductController() {
		super();

	}

	public void init() {
		productDAO = new ProductDAO();
		categoryDAO = new CategoryDAO();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		if (action == null) {
			action = "";
		}

		try {
			switch (action) {
			case "insertProduct":
				insertProduct(request, response);
				break;
			case "deleteProduct":
				deleteProduct(request, response);
				break;
			case "editProduct":
				showEditForm(request, response);
				break;
			case "updateProduct":
				updateProduct(request, response);
				break;
			default:
				listProduct(request, response);
				break;
			}
		} catch (SQLException ex) {
			throw new ServletException(ex);
		}
	}

	private void listProduct(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		int page = 1;
		int recordsPerPage = 5;
		if (request.getParameter("page") != null)
			page = Integer.parseInt(request.getParameter("page"));
		ProductDAO productDAO = new ProductDAO();
		List<Product> listProduct = productDAO.viewProduct((page - 1) * recordsPerPage, recordsPerPage);
		int noOfRecords = productDAO.getNoOfRecords();
		int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / recordsPerPage);
		request.setAttribute("noOfPages", noOfPages);
		request.setAttribute("currentPage", page);
		List<Category> listCategory = categoryDAO.selectAllCategory();
//		List<Product> listProduct = productDAO.selectAllProduct();

		request.setAttribute("listCategory", listCategory);

		request.setAttribute("listProduct", listProduct);

		RequestDispatcher dispatcher = request.getRequestDispatcher("Admin/list-product.jsp");
		dispatcher.forward(request, response);
	}

	private void showEditForm(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, ServletException, IOException {

		int id = Integer.parseInt(request.getParameter("id"));
		Product prd = productDAO.selectProduct(id);
		RequestDispatcher dispatcher = request.getRequestDispatcher("Admin/product-form.jsp");
		request.setAttribute("prd", prd);
		dispatcher.forward(request, response);

	}

	private void insertProduct(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException {
		String name = request.getParameter("name");
		int price = Integer.parseInt(request.getParameter("price"));
		String image = "";  
		int category_id = Integer.parseInt(request.getParameter("category_id"));
		//upload 
		try {
			Part part = request.getPart("image");
			System.out.println(part);
			String realPath = request.getServletContext().getRealPath("/uploads");
			String filename = Paths.get(part.getSubmittedFileName()).getFileName().toString();
			
			System.out.println(realPath + "/"+filename);
			
			if(!Files.exists(Paths.get(realPath))) {
				Files.createDirectory(Paths.get(realPath));
				
			}
			part.write(realPath+"/"+filename);
			PrintWriter out = response.getWriter();
			
				 
			image ="uploads/"+filename;
		} catch (Exception e) {
			 
		} 
		Product newProduct = new Product(name, price, image, category_id);
		productDAO.insertProduct(newProduct);
		response.sendRedirect("/javaservlet/ProductCTL");
		
	}

	private void updateProduct(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		String name = request.getParameter("name");
		int price = Integer.parseInt(request.getParameter("price"));
		String image = request.getParameter("image");
		int category_id = Integer.parseInt(request.getParameter("category_id"));

		Product book = new Product(id, name, price, image, category_id);
		productDAO.updateProduct(book);
		response.sendRedirect("/javaservlet/ProductCTL");
	}

	private void deleteProduct(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		productDAO.deleteProduct(id);
		response.sendRedirect("/javaservlet/ProductCTL");

	}
}
