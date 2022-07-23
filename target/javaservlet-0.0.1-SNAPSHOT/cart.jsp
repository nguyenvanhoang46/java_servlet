<%@ page import="java.util.ArrayList" %>
<%@ page import="javaservlet.entity.Cart" %>
<%@ page import="java.util.List" %>
<%@ page import="javaservlet.repository.ProductRepository" %>
<%@ page import="javaservlet.connection.DBCon" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 27/6/2022
  Time: 8:05 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/cart.css" type="text/css">
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
<section class="mt-4 shopping-cart spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-7" id="list-cart">
                <div class="cart-table">
                    <table>
                        <thead>
                        <tr class="border-cart-item">
                            <th>Sản phẩm</th>
                            <th class="produtcto">Tên</th>
                            <th class="produtcto">Giá</th>
                            <th class="produtcto">Số lượng</th>
<%--                            <th class="produtcto">Tổng</th>--%>
                        </tr>

                        </thead>
                        <tbody>
                        <%
                            if (cart_list != null) {
                                for (Cart c : cartProduct) {
                        %>
                        <tr class="cart_item-form">
                            <td class="cart-pic first-row">
                                <img src="<%= c.getImage()%>" alt="">
                            </td>
                            <td class="cart-title first-row">
                                <h5 class="mt-2"><%= c.getName()%></h5>
                            </td>
                            <td class="p-price">
                                <span class="mt-2"><%= c.getPrice()%> ₫</span>
                            </td>
                            <td class="qua-col">
                                <form action="order-now" method="post" class="mt-2 form-inline quantity-list-cart">
                                    <input type="hidden" name="id" value="<%= c.getId()%>" class="form-input">
                                    <div class="form-group d-flex justify-content-between">
                                        <a class="btn btn-sm btn-decre" href="quantity-inc-dec?action=dec&id=<%=c.getId()%>"><i class="mt-2 fas fa-minus-square"></i></a>
                                        <input type="text" name="quantity" class="form-control " value="<%=c.getQuantity()%>" readonly>
                                        <a class="btn  bnt-sm btn-incre" href="quantity-inc-dec?action=inc&id=<%=c.getId()%>"><i class="mt-1 fas fa-plus-square"></i></a>
                                    </div>
                                    <%-- <button type="submit" class="btn btn-primary btn-sm">Buy</button>--%>
                                </form>
                            </td>
<%--                            <td class="total-price first-row">${total} ₫</td>--%>
                            <td class="close-td first-row me-5"><a href="remove-from-cart?id=<%=c.getId() %>"><i class="far fa-times-circle"></i></a></td>
                        </tr>
                        <%
                                }}%>
                        </tbody>
                    </table>
                </div>
                <div class="d-flex mt-5">
                    <div class="continue-shopping pull-left  text-left">
                        <a class=" button-continue-shopping button primary is-outline" href="listPages">← TIẾP TỤC XEM SẢN
                            PHẨM </a>
                    </div>
<%--                    <div class="ms-4 primary mt-0 update-cart pull-left small edit-all">--%>
<%--                        CẬP NHẬT GIỎ HÀNG--%>
<%--                    </div>--%>
                </div>
            </div>

            <div class="col-lg-5">

                <div class="">
                    <div class="cart-subtotal product-name-item">TỔNG SỐ LƯỢNG</div>
                    <div class="mt-2 cart-subtotal d-flex">
                        <div>Tổng Số lượng</div>
                        <div>12</div>
                    </div>
                    <div class="mt-1 cart-subtotal d-flex">
                        <div class="mt-4">Giao hàng</div>
                        <div class="">
                            <div class="">Giao hàng miễn phí</div>
                            <div class="">Ước tính cho Việt Nam</div>
                            <div class="">Đổi địa chỉ</div>
                        </div>
                    </div>
                    <div class="mt-1 cart-subtotal cart-subtotal-item d-flex">
                        <div class="">Tổng</div>
                        <div class="">$ ${ (total>0)?total:0 } </div>
                    </div>
                </div>
                <div class="wc-proceed-to-checkout">
                    <a href="checkout.jsp" class="mt-4 checkout-button button alt wc-forward">
                        TIẾN HÀNH THANH TOÁN
                    </a>
                </div>
            </div>
        </div>
    </div>
</section>
<jsp:include page="footer.jsp" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
        integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
</body>
</html>
