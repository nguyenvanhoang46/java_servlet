<%@ page import="java.util.ArrayList" %>
<%@ page import="javaservlet.entity.Cart" %>
<%@ page import="java.util.List" %>
<%@ page import="javaservlet.repository.ProductRepository" %>
<%@ page import="javaservlet.connection.DBCon" %><%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 23/6/2022
  Time: 4:53 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
  <link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css" type="text/css">
</head>
<body>
<%
  ArrayList<Cart> cart_list =  (ArrayList<Cart>) session.getAttribute("cart-list");
  List<Cart> cartProduct = null;
  if (cart_list != null) {
    ProductRepository pRepository = new ProductRepository(DBCon.getConnection());
    cartProduct = pRepository.getCartProducts(cart_list);
    request.setAttribute("cart_list", cart_list);
  }
%>
<div class="top-bar">
  <div class="container">
    <div class="row row-top">
      <div class="col-5 mt-2">
                            <span class="row-top-address row-top text-light">
                                <span class="" style="font-size: 17px;"><img alt="govno" src="<%=request.getContextPath() + "/image/placeholder.png"%>"></span>
                                <span class="ms-2">319 - C16 Lý Th ường Kiệt, P.15, Q.Tp.HCM
                            </span>
        </span>
        <span class="text-light ps-3"><img alt="govno" src="<%=request.getContextPath() + "/image/telephone.png"%>"></span>
        <span class="text-light ps-1">076 922 0162</span>
      </div>
      <div class="col-5"></div>
      <div class="col-2  mt-2 row-top row-top-item text-light d-flex align-items-center">
        <div class=" row-top ">
          <img alt="govno" src="<%=request.getContextPath() + "/image/facebook.png"%>">
          <img alt="govno" class="ms-2" src="<%=request.getContextPath() + "/image/instagram.png"%>">
          <img alt="govno" class="ms-2" src="<%=request.getContextPath() + "/image/twitter.png"%>">
        </div>
        <div class="ms-3 mt-1 row-top2"></div>
        <div class="ms-2 row-top text-light">
<%--          <button class="btn text-light" id="logged"></button>--%>
        <a href="login" class="text-light text-decoration: none" >Đăng nhập</a>
        </div>
      </div>

    </div>
  </div>
  <div class="border-t mt-2"></div>
  <div class="top-conten container mt-2">
    <div class="row">
      <div class="col">
        <div class="logo">
          <a href="./Index.html">
            <img height="70" src="http://mauweb.monamedia.net/donghohaitrieu/wp-content/uploads/2019/07/logo-mona-2.png" alt="">
          </a>
        </div>
      </div>
      <div class="col">
        <div class="search pt-3">
          <form action="search" method="post" class="form-search ">
            <input type="text" name="txt" class="input-search" placeholder="Tìm kiếm...">
            <button type="submit" class="button-i button"><i
                    class="fa-solid fa-magnifying-glass"></i>
            </button>
          </form>
        </div>
      </div>
      <div class="col" style="margin-left: 100px;">
        <div class="cart mt-3 cart-item d-flex  pe-lg-5">
          <div>
            <a href="#" class="text-light cart-item-i " onclick="showLike()">
              <i class="fa-solid fa-heart"></i>
            </a>
          </div>
          <div class="haeder-navbar-item">
            <a href="cart.jsp" class="text-light ms-3" onclick="show()">
              <i class="fa-solid fa-bag-shopping"> ${cart_list.size()} </i>
            </a>
            <div class="header-item"></div>
<%--            <div class="header-nofify">--%>
<%--              <div class="mx-5 cart-shopping">--%>
<%--                <div class="p-4">--%>
<%--                  <div class="select-items">--%>
<%--                    <table class="">--%>
<%--                      <tbody>--%>
<%--                      <tr class="mt-5">--%>
<%--                        <td class="si-pic">--%>
<%--                          <img class="img-cart" src="hhttps://cdn3.dhht.vn/wp-content/uploads/2017/09/35_MTP-1302D-7A1VDF-399x399.jpg" alt="">--%>
<%--                        </td>--%>
<%--                        <td class="mx-4 si-text">--%>
<%--                          <div class="product-selected">--%>
<%--                            <p class="cart-price-item">₫60.00 x 1</p>--%>
<%--                            <h6>Kabino Bedside Table</h6>--%>
<%--                          </div>--%>
<%--                        </td>--%>
<%--                        <td class="si-close">--%>
<%--                          <i class="ti-close"></i>--%>
<%--                        </td>--%>
<%--                      </tr>--%>
<%--                      <tr class="mt-5">--%>
<%--                        <td class="si-pic"><img class="img-cart"--%>
<%--                                                src="http://127.0.0.1:5500/Template/img/products/product-1.jpg"--%>
<%--                                                alt="">--%>
<%--                        </td>--%>
<%--                        <td class="mx-4 si-text">--%>
<%--                          <div class="product-selected">--%>
<%--                            <p class="cart-price-item">₫60.00 x 1</p>--%>
<%--                            <h6>Kabino Bedside Table</h6>--%>
<%--                          </div>--%>
<%--                        </td>--%>
<%--                        <td class="si-close">--%>
<%--                          <i class="ti-close"></i>--%>
<%--                        </td>--%>
<%--                      </tr>--%>

<%--                      </tbody>--%>
<%--                    </table>--%>
<%--                  </div>--%>
<%--                  <div class="select-total d-flex">--%>
<%--                    <span>total:</span>--%>
<%--                    <h5>₫120.00</h5>--%>
<%--                  </div>--%>
<%--                  <div class="select-button">--%>
<%--                    <div><a href="#" class="primary-btn view-card">VIEW CARD</a></div>--%>
<%--                    <div><a href="#" class="primary-btn checkout-btn">CHECK OUT</a>--%>
<%--                    </div>--%>
<%--                  </div>--%>
<%--                </div>--%>
<%--              </div>--%>
<%--            </div>--%>
          </div>

        </div>
      </div>
      <div class="column-cart gio_hang" id="displayBlock">
        <div class="cart-total">
          <strong class="cart-total-title">Tổng Tiền: </strong>
          <span class="cart-total-price">0đ</span>
        </div>
      </div>
      <div class="column-cart gio_hang" id="displayBlock1">
        <div class="cart-total">
          <strong class="cart-total-title">Các sản phẩm yêu thích </strong>
        </div>
      </div>
      <div class="column-cart gio_hang">
        <div class="cart-total"><strong class="cart-total-title">Các sản phẩm yêu thích </strong>
        </div>

      </div>
    </div>
    <div class="border-t mt-2"></div>
    <div class="container mt-3 pb-3">
      <ul class="nav nav-bar justify-content-center">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="home">TRANG CHỦ</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="./introducepage.html">GIỚI THIỆU</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">ĐÔNG HỒ NAM</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">ĐÔNG HỒ NỮ</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="./blog.html">BLOG</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">LIÊN HỆ</a>
        </li>
      </ul>
    </div>
  </div>
</div>
</body>
</html>
