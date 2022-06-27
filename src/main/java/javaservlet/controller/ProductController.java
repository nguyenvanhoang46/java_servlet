package javaservlet.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javaservlet.entity.Category;
import javaservlet.entity.Product;
import javaservlet.repository.CategoryRepository;
import javaservlet.repository.ProductRepository;

/**
 * Servlet implementation class ProductController
 */
@WebServlet(name = "ProductController", urlPatterns = {"/home"})
public class ProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		ProductRepository productRepository = new ProductRepository();
//		CategoryRepository categoryRepository = new CategoryRepository();
//		List<Product> list = productRepository.getAllProduct();
//		List<Category> listC = categoryRepository.getAllCategory();
//		System.out.println(list.get(0));
//		request.setAttribute("listP", list);
//		request.setAttribute("listC", listC);

		// TODO Auto-generated method stub
		request.getRequestDispatcher("/index.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
		request.getRequestDispatcher("index.jsp").forward(request, response);
    }
}
