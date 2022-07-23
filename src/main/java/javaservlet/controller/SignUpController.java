package javaservlet.controller;

import javaservlet.entity.Account;
import javaservlet.repository.ProductRepository;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "SignUpController", urlPatterns = {"/signup"})
public class SignUpController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("signup.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String re_password = request.getParameter("repassword");

        if (!password.equals(re_password)) {
            response.sendRedirect("signup.jsp");
        }else {
            ProductRepository productRepository = new ProductRepository();
            Account a = productRepository.checkAccount(username);
            if (a == null) {
                productRepository.singup(username,password,email);
                response.sendRedirect("listPages");
            }else {
                response.sendRedirect("signup.jsp");
            }
        }
    }
}
