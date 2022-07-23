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
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        ProductRepository productRepository = new ProductRepository();
        Account a = productRepository.login(username, password);
        if (a == null) {
            request.setAttribute("mess","Sai mật khẩu vui lòng nhập lại!");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else {
            HttpSession session = request.getSession();
            session.setAttribute("acc", a);
            response.sendRedirect("listPages");
        }
    }
}
