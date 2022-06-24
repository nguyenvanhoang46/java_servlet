<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 23/6/2022
  Time: 6:07 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/index.css" type="text/css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css" type="text/css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/product_pages.css" type="text/css">
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
<jsp:include page="header.jsp" />
<div class="container mt-5">
    <div class="row">
        <div class="col-3 ms-3 d-flex">
            <div class="pages-item homepages-item">TRANG CHỦ</div>
            <span class="ms-2 divider">/</span>
            <div class="ms-2 homepages-item grow-item">ĐỒNG HỒ</div>
        </div>
        <div class="col-8 d-flex form-item-select">
            <div class="mt-2">Hiển thị một kết quả duy nhất</div>
            <div class="ms-3">
                <form class="" method="get">
                    <select name="orderby" class="orderby-item">
                        <option value="menu_order" selected="selected">Thứ tự mặc định</option>
                        <option value="popularity">Thứ tự theo mức độ phổ biến</option>
                        <option value="rating">Thứ tự theo điểm đánh giá</option>
                        <option value="date">Mới nhất</option>
                        <option value="price">Thứ tự theo giá: thấp đến cao</option>
                        <option value="price-desc">Thứ tự theo giá: cao xuống thấp</option>
                    </select>

                </form>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-3">
            <form action="search" class="ms-3">
                <input type="text" placeholder="  Tìm kiếm..." class="form-search-item">
                <button type="submit" class="form_search-item">
                    <i class="fa-solid fa-magnifying-glass"></i>
                </button>
            </form>

            <h6 style="font-weight: 700;" class="ms-3 mt-4">SẢN PHẨM</h6>
            <ul class="ms-3 mt-4 is-divider ">

                <li class="recent-blog-posts-li ">
                    <div class="d-flex mt-3">
                        <div class="">
                            <img class="badge-inner-item" src="http://mauweb.monamedia.net/donghohaitrieu/wp-content/uploads/2019/07/product-16-100x100.jpg" alt="">
                        </div>
                        <div class="flex-col ms-5 flex-grow">
                            <div class="mt-">${cp.name}</div>
                            <div class="mt-3 grow-item">700,000 ₫</div>
                        </div>
                    </div>
                </li>

                <li class="recent-blog-posts-li mt-4">
                    <div class="d-flex mt-3">
                        <div>
                            <img class="badge-inner-item" src="http://mauweb.monamedia.net/donghohaitrieu/wp-content/uploads/2019/07/product-14-100x100.jpg" alt="">
                        </div>
                        <div class="flex-col ms-5 flex-grow">
                            <div>Simple 9</div>
                            <div class="grow-item mt-3">700,000 ₫</div>
                        </div>
                    </div>
                </li>
                <li class="recent-blog-posts-li mt-4">
                    <div class="d-flex mt-3">
                        <div>
                            <img class="badge-inner-item"
                                 src="http://mauweb.monamedia.net/donghohaitrieu/wp-content/uploads/2019/07/product-13-100x100.jpg"
                                 alt="">
                        </div>
                        <div class=" flex-col ms-5 flex-grow">
                            <div>Simple 8</div>
                            <div class="mt-3 grow-item">700,000 ₫</div>
                        </div>
                    </div>
                </li>
                <li class="recent-blog-posts-li mt-4">
                    <div class="d-flex mt-3">
                        <div>
                            <img class="badge-inner-item"
                                 src="http://mauweb.monamedia.net/donghohaitrieu/wp-content/uploads/2019/07/product-12-100x100.jpg"
                                 alt="">
                        </div>
                        <div class="flex-col ms-5 flex-grow">
                            <div>Simple 7</div>
                            <div class="mt-3 grow-item">700,000 ₫</div>
                        </div>
                    </div>
                </li>

            </ul>
            <h6 style="font-weight: 700;" class="ms-3 mt-4">BÀI VIẾT MỚI NHẤT</h6>
            <ul class="ms-3 mt-4  is-divider ">
                <li class="recent-blog-posts-li ">
                    <div>
                        <img class="badge-inner"
                             src="http://mauweb.monamedia.net/donghohaitrieu/wp-content/uploads/2019/07/new-4-150x150.jpg"
                             alt="">
                    </div>
                    <div class="flex-col ms-4 flex-grow">
                        <a href="http://mauweb.monamedia.net/donghohaitrieu/chiec-dong-ho-cua-nhung-ceo-quyen-luc-nhat-the-gioi/"
                           title="Chiếc đồng hồ của những CEO quyền lực nhất thế giới">Chiếc đồng hồ của những
                            CEO quyền lực nhất thế giới</a>
                    </div>
                </li>
                <li class="recent-blog-posts-li mt-4">
                    <div>
                        <img class="badge-inner"
                             src="http://mauweb.monamedia.net/donghohaitrieu/wp-content/uploads/2019/07/trend-2-150x150.jpg"
                             alt="">
                    </div>
                    <div class="flex-col ms-4 flex-grow">
                        <a href="http://mauweb.monamedia.net/donghohaitrieu/chiec-dong-ho-cua-nhung-ceo-quyen-luc-nhat-the-gioi/"
                           title="Chiếc đồng hồ của những CEO quyền lực nhất thế giới">Chiếc đồng hồ của những
                            CEO quyền lực nhất thế giới</a>
                    </div>
                </li>
                <li class="recent-blog-posts-li mt-4">
                    <div>
                        <img class="badge-inner"
                             src="http://mauweb.monamedia.net/donghohaitrieu/wp-content/uploads/2019/07/new-3-150x150.jpg"
                             alt="">
                    </div>
                    <div class="flex-col ms-4 flex-grow">
                        <a href="http://mauweb.monamedia.net/donghohaitrieu/chiec-dong-ho-cua-nhung-ceo-quyen-luc-nhat-the-gioi/"
                           title="Chiếc đồng hồ của những CEO quyền lực nhất thế giới">Chiếc đồng hồ của những
                            CEO quyền lực nhất thế giới</a>
                    </div>
                </li>
                <li class="recent-blog-posts-li mt-4">
                    <div>
                        <img class="badge-inner"
                             src="http://mauweb.monamedia.net/donghohaitrieu/wp-content/uploads/2019/07/photo-1-150x150.jpg"
                             alt="">
                    </div>
                    <div class="flex-col ms-4 flex-grow">
                        <a href="http://mauweb.monamedia.net/donghohaitrieu/chiec-dong-ho-cua-nhung-ceo-quyen-luc-nhat-the-gioi/"
                           title="Chiếc đồng hồ của những CEO quyền lực nhất thế giới">Chiếc đồng hồ của những
                            CEO quyền lực nhất thế giới</a>
                    </div>
                </li>
                <li class="recent-blog-posts-li mt-4">
                    <div>
                        <img class="badge-inner"
                             src="http://mauweb.monamedia.net/donghohaitrieu/wp-content/uploads/2019/07/news-1-150x150.jpg"
                             alt="">
                    </div>
                    <div class="flex-col ms-4 flex-grow">
                        <a href="http://mauweb.monamedia.net/donghohaitrieu/chiec-dong-ho-cua-nhung-ceo-quyen-luc-nhat-the-gioi/"
                           title="Chiếc đồng hồ của những CEO quyền lực nhất thế giới">Chiếc đồng hồ của những
                            CEO quyền lực nhất thế giới</a>
                    </div>
                </li>
            </ul>
        </div>
        <div class="col-9 border-left">
            <div class="tab-pane fade show active" id="pills-home" role="tabpanel"
                 aria-labelledby="pills-home-tab">
                <div id="rendenrProduct"
                     class="row  ms-1 large-columns-5 medium-columns-3 small-columns-2 row-normal">
                    <c:forEach items="${listP}" var="product">
                        <div class="col ">
                            <div class="mt-3 mb-4">
                                <div class="card" style="width: 14rem; height: 390px;">
                                        <span class="heart-icon-cart mt-2"><button
                                                class="btn fa-solid fa-heart icon add-like"></button></span>
                                    <img src="http://mauweb.monamedia.net/donghohaitrieu/wp-content/uploads/2019/07/product-16.jpg"
                                         class="card-img-top image image" alt="...">
                                    <div class="card-body">
                                        <div class="card-body-item ms-2">
                                            <h6 class="card-title ms-5 ten-item-column ">${product.name}</h6>
                                            <p class="card-text ms-3">
                                                <span class="strike"> <strike>700,000 <u>đ</u></strike> </span>
                                                <span class="span-price gia">${product.price}<u>đ</u></span>
                                            </p>
                                            <button class="btn text-light ms-4 cart-slider add-to-cart add-to-cart">Thêm vào giỏ</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>

                    <!-- rendenrProduct -->

                </div>
            </div>
        </div>
    </div>
</div>


<script src="https://code.jquery.com/jquery-3.6.0.min.js"
        integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
</body>
</html>
