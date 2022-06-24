<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 24/6/2022
  Time: 4:05 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/index.css" type="text/css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/detail.css" type="text/css">
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
<div class="onk">
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <div id="slider" class="owl-carousel product-slider">
                    <div class="item">
                        <img class="image-item-detail" src="${detail.image}" />
                    </div>
                </div>
            </div>
            <div class="col-md-6 mt-5">
                <div class="product-dtl">
                    <div class="product-info">
                        <div class="product-name">${detail.name}</div>
                        <div class="reviews-counter">
                            <div class="rate">
                                <input type="radio"  name="rate" value="5" checked />
                                <label for="star5" title="text">5 stars</label>
                                <input type="radio"  name="rate" value="4" checked />
                                <label for="star4" title="text">4 stars</label>
                                <input type="radio"  name="rate" value="3" checked />
                                <label for="star3" title="text">3 stars</label>
                                <input type="radio"  name="rate" value="2" />
                                <label for="star2" title="text">2 stars</label>
                                <input type="radio"  name="rate" value="1" />
                                <label for="star1" title="text">1 star</label>
                            </div>
                            <span>3 Reviews</span>
                        </div>
                        <div class="product-price-discount"><span>${detail.price}</span><span
                                class="line-through">700,000đ</span></div>
                    </div>
                    <p>Là một mẫu đồng hồ theo đuổi phong cách cổ điển, Ulysse Nardin Classico 3203-136-2/30 sở hữu
                        dáng vỏ tròn mềm mại đậm tính truyền thống – dáng vỏ đặc trưng chưa bao giờ lỗi thời. Đặc
                        biệt hơn, nhờ chất liệu thép không gỉ, bộ vỏ đồng hồ dường như trở nên sắc sảo và tinh tế
                        hơn.</p>
                    <div class="row">
                        <div class="col-md-6">
                            <label for="size">Chọn chất liệu dây</label>
                            <select id="size" name="size" class="form-control mt-3">
                                <option>Dây da</option>
                                <option>Dây kim loại</option>
                                <option>Dây vải Nato</option>
                                <option>Dây đá gốm Ceramic</option>
                            </select>
                        </div>
                        <div class="col-md-6">
                            <label for="color">Color</label>
                            <select id="color" name="color" class="form-control mt-3">
                                <option>Blue</option>
                                <option>Green</option>
                                <option>Red</option>
                            </select>
                        </div>
                    </div>
                    <div class="product-count">
                        <label for="size">Số lượng</label>
                        <form action="#" class="display-flex mt-3">
                            <div class="qtyminus">-</div>
                            <input type="text" name="quantity" value="1" class="qty">
                            <div class="qtyplus">+</div>
                        </form>
                        <a href="#" class="round-black-btn">Thêm vào giỏ hàng</a>
                    </div>
                </div>
            </div>
        </div>
        <div class="product-info-tabs">
            <ul class="nav nav-tabs" id="myTab" role="tablist">
                <li class="nav-item">
                    <a class="nav-link active" id="description-tab" data-toggle="tab" href="#description" role="tab"
                       aria-controls="description" aria-selected="true">Mô tả</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" id="review-tab" data-toggle="tab" href="#review" role="tab"
                       aria-controls="review" aria-selected="false">Đánh giá (0)</a>
                </li>
            </ul>
            <div class="tab-content" id="myTabContent">
                <div class="tab-pane fade show active" id="description" role="tabpanel"
                     aria-labelledby="description-tab">
                    Mỗi khi nhắc đến cái tên Ulysse Nardin, nhiều người trong chúng ta sẽ nghĩ ngay đến một trong
                    những thương hiệu đồng hồ đình đám hàng đầu thế giới và là đại diện tiêu biểu cho ngành hàng
                    hải. Nguyên nhân của danh xưng này cũng đến từ những mẫu đồng hồ độc đáo lấy cảm hứng từ biển cả
                    cũng như logo hình mỏ neo của thương hiệu này.

                    Tuy vậy, Ulysse Nardin không chỉ nổi bật với những sản phẩm đồng hồ biển đặc trưng, mà trong số
                    những bộ sưu tập đồ sộ của mình, nhà sản xuất này còn có cho mình dòng sản phẩm Classico – dòng
                    sản phẩm đồng hồ mang phong cách cổ điển vô cùng mới lạ và được nhiều khách hàng ưa chuộng.

                    Chính vì vậy, hôm nay Gia Bảo Luxury xin trân trọng giới thiệu với quý khách hàng một trong
                    những thiết kế đồng hồ cổ điển cực kỳ trang nhã và được đánh giá rất cao của nhà Ulysse Nardin -
                    Ulysse Nardin Classico 3203-900.
                </div>
                <div class="tab-pane fade" id="review" role="tabpanel" aria-labelledby="review-tab">
                    <div class="review-heading">Đánh giá</div>
                    <p class="mb-20">Hiện tại không có đánh giá nào.</p>
                    <form class="review-form">
                        <div class="form-group">
                            <label>Đánh giá của bạn</label>
                            <div class="reviews-counter">
                                <div class="rate">
                                    <input type="radio" id="star5" name="rate" value="5" />
                                    <label for="star5" title="text">5 stars</label>
                                    <input type="radio" id="star4" name="rate" value="4" />
                                    <label for="star4" title="text">4 stars</label>
                                    <input type="radio" id="star3" name="rate" value="3" />
                                    <label for="star3" title="text">3 stars</label>
                                    <input type="radio" id="star2" name="rate" value="2" />
                                    <label for="star2" title="text">2 stars</label>
                                    <input type="radio" id="star1" name="rate" value="1" />
                                    <label for="star1" title="text">1 star</label>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label>Your message</label>
                            <textarea class="form-control" rows="10"></textarea>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <input type="text" name="" class="form-control" placeholder="Name*">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <input type="text" name="" class="form-control" placeholder="Email Id*">
                                </div>
                            </div>
                        </div>
                        <button class="round-black-btn">Submit Review</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"
        integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
</body>
</html>
