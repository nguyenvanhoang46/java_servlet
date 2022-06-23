package javaservlet.controller;

import javaservlet.entity.Category;
import javaservlet.entity.Product;
import javaservlet.repository.CategoryRepository;
import javaservlet.repository.ProductRepository;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "CategoryController", urlPatterns = {"/pages"})
public class CategoryController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ProductRepository productRepository = new ProductRepository();
        CategoryRepository categoryRepository = new CategoryRepository();
        List<Product> list = productRepository.getAllProduct();
        List<Category> listC = categoryRepository.getAllCategory();
        Product last = productRepository.getLast();
        System.out.println();
        request.setAttribute("listP", list);
        request.setAttribute("listC", listC);
        request.setAttribute("p", last);

        // TODO Auto-generated method stub
        request.getRequestDispatcher("/product_pages.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
