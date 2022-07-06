package javaservlet.controller;

import javaservlet.entity.Account;
import javaservlet.repository.ProductRepository;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "LoginController", urlPatterns = {"/login"})
public class LoginController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("user");
        String password = request.getParameter("pass");
        ProductRepository productRepository = new ProductRepository();
        Account a = productRepository.login(username, password);
        if (a == null) {
            request.getRequestDispatcher("login.jsp").forward(request, response);

        }else {
            request.getRequestDispatcher("listPages").forward(request, response);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
