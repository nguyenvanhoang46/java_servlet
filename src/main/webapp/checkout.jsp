<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 22/7/2022
  Time: 7:02 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="javaservlet.entity.Cart" %>
<%@ page import="java.util.List" %>
<%@ page import="javaservlet.repository.ProductRepository" %>
<%@ page import="javaservlet.connection.DBCon" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/index.css" type="text/css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css" type="text/css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/glider.css" type="text/css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
        integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
        crossorigin="anonymous" referrerpolicy="no-referrer"/>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
  <link rel="stylesheet" href="./fonts/fontawesome-free-6.0.0/fontawesome-free-6.0.0-web/css/all.min.css">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
          integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
          crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
          crossorigin="anonymous"></script>
</head>
<style>
  .order-item-cart {
    width: 100% !important;
    background-color: #d26e4b!important;
    font-weight: 600;
    color: white !important;

  }
</style>
<body>
<%
  ArrayList<Cart> cart_list =  (ArrayList<Cart>) session.getAttribute("cart-list");
  List<Cart> cartProduct = null;
  if (cart_list != null) {
    ProductRepository pRepository = new ProductRepository(DBCon.getConnection());
    cartProduct = pRepository.getCartProducts(cart_list);
    double total= pRepository.getTotalCartPrice(cart_list);
    request.setAttribute("cart_list", cart_list);
    request.setAttribute("total", total);

  }
%>
<jsp:include page="header.jsp" />
<div class="container mt-5">
  <h5>THÔNG TIN THANH TOÁN</h5>
  <form action="" method="post">
    <div class="row">
      <div class="col-7">
        <div class="row">
          <div class="col-12">
            <label >Tên*</label>
            <input type="text" class="form-control" value="" placeholder="Tên" name="name" />
          </div>
        </div>
        <div class="row mt-3">
          <div class="col-12">
            <label >Địa chỉ*</label>
            <input type="text" class="form-control"  placeholder="Địa chỉ" name="address" />
          </div>
          <div class="col-12 mt-3">
            <label >Tỉnh/Thành phố*</label>
            <input type="text" class="form-control"  name="city" />
          </div>
          <div class="col-12 mt-3">
            <label >Số điện thoại*</label>
            <input type="text" class="form-control"  name="phone" />
          </div>
          <div class="col-12 mt-3">
            <label >Địa chỉ email*</label>
            <input type="text" class="form-control" value=""  name="email" />
          </div>
        </div>
      </div>
      <div class="col-5">
        <h3>ĐƠN HÀNG CỦA BẠN</h3>
        <table class="table table-striped ">
          <thead>
          <tr>
            <th>Name</th>
            <th class="text-center">Qty</th>
            <th class="text-center">Price</th>
          </tr>
          </thead>
          <tbody>
          <%
            if (cart_list != null) {
              for (Cart c : cartProduct) {
          %>
          <tr>
            <td><%= c.getName()%></td>
            <td class="text-center"><%=c.getQuantity()%></td>
            <td class="text-center"><%= c.getPrice()%> ₫</td>
          </tr>
          <%
              }}%>
          </tbody>
          <div class="">

          </div>
        </table>
        <hr>
        <button type="submit" class="btn order-item-cart btn-success float-end">
          <a class="text-white  text-decoration-none" href="cart-check-out">ĐẶT HÀNG</a>
        </button>
      </div>
    </div>
  </form>
</div>
<jsp:include page="footer.jsp" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
        integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
</body>
</html>
