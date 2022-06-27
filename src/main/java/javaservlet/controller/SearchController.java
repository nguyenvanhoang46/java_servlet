package javaservlet.controller;

import javaservlet.entity.Product;
import javaservlet.repository.ProductRepository;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "SearchController", urlPatterns = {"/search"})
public class SearchController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//            String textSearch = request.getParameter("txt");
//            ProductRepository productRepository = new ProductRepository();
//            List<Product> list = productRepository.searchByName(textSearch);
//
//            request.setAttribute("listP", list);
//            request.getRequestDispatcher("index.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
