package javaservlet.controller;

import javaservlet.entity.Product;
import javaservlet.repository.ProductRepository;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ListPagesController", urlPatterns = {"/listPages"})
public class ListPagesController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int page = 1;
        int recordsPerPage = 5;
        if (request.getParameter("page") != null)
            page = Integer.parseInt(request.getParameter("page"));
        ProductRepository productRepository = new ProductRepository();
        List<Product> list = productRepository.viewProduct((page-1)*recordsPerPage, recordsPerPage);
        int noOfRecords = productRepository.getNoOfRecords();
        int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / recordsPerPage);

        request.setAttribute("products", list);
        request.setAttribute("noOfPages", noOfPages);
        request.setAttribute("currentPage", page);
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
