package javaservlet.controller;

import javaservlet.entity.Cart;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

@WebServlet(name = "CartController", urlPatterns = {"/add-to-cart"})
public class CartController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
                    try(PrintWriter out = response.getWriter()) {
                        ArrayList<Cart> cartList = new ArrayList<>();
                        int id = Integer.parseInt(request.getParameter("id"));
                        Cart cm = new Cart();
                        cm.setId(id);
                        cm.setQuantity(1);

                        HttpSession session = request.getSession();
                        ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
                        out.println(cart_list);
                        if (cart_list == null) {
                            cartList.add(cm);
                            session.setAttribute("cart-list", cartList);
                            response.sendRedirect("listPages");
                        }else {
                            cartList = cart_list;
                            boolean exist = false;
                            for (Cart c: cartList) {
                                if (c.getId() == id) {
                                    exist = true;
                                }
                            }
                            if (!exist) {
                                cartList.add(cm);
                               response.sendRedirect("listPages");
                            }
                        }
                    }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
