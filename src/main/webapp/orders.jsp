<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List" %>
<%@ page import="javaservlet.entity.Product" %>
<%@ page import="javaservlet.repository.ProductRepository" %>
<%@ page import="javaservlet.connection.DBCon" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="javaservlet.entity.Cart" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 27/6/2022
  Time: 10:38 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
  ArrayList<Cart> cart_list =  (ArrayList<Cart>) session.getAttribute("cart-list");
  if (cart_list != null) {
    request.setAttribute("cart_list", cart_list);
  }
%>
</body>
</html>
