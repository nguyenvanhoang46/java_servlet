<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 25/6/2022
  Time: 3:07 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/login.css" type="text/css">
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
<div class="container-item-box">
    <div class="forms-container">
        <div class="signin-signup">
            <form action="login" method="post" class="sign-in-form" id="from-login">
                <h2 class="title">Đăng nhập</h2>
                <div class="input-field">
                    <i class="fas fa-user"></i>
                    <input id="inputEmail" name="username" type="text" placeholder="Tài khoản" required="" />
                </div>
                <div class="input-field">
                    <i class="fas fa-lock"></i>
                    <input id="inputPassword" name="password" type="password" placeholder="Mật khẩu" required="" />
                </div>

                <p class="text-danger" id="notifi-login"></p>
                <button class="btn btn-success btn-block" type="submit">Đăng nhập</button>

                <p class="social-text">Hoặc Đăng nhập bằng các nền tảng xã hội</p>

                <div class="social-media">
                    <a href="#" class="social-icon">
                        <i class="fab fa-facebook-f"></i>
                    </a>
                    <a href="#" class="social-icon">
                        <i class="fab fa-twitter"></i>
                    </a>
                    <a href="#" class="social-icon">
                        <i class="fab fa-google"></i>
                    </a>
                    <a href="#" class="social-icon">
                        <i class="fab fa-linkedin-in"></i>
                    </a>
                </div>
            </form>
            <form action="#" class="sign-up-form"  id="from-1">
                <h2 class="title">Đăng ký</h2>

                <div class="input-field">
                    <i class="fas fa-user"></i>
                    <input id="fullname" type="text" placeholder="Tài khoản" />
                </div>
                <div class="input-field">
                    <i class="fas fa-envelope"></i>
                    <input id="email" type="email" placeholder="Email" />
                </div>
                <div class="input-field">
                    <i class="fas fa-lock"></i>
                    <input id="password-sign" type="password" placeholder="Mật khẩu" />
                </div>
                <div class="input-field">
                    <i class="fas fa-lock"></i>
                    <input id="confirmpassword" type="password" placeholder="Xác nhận mật khẩu" />
                </div>
                <p class="text-danger" id="notification"></p>
                <input type="submit" class="btn login-product" onclick="registerNewUser()" value="Đăng ký" />
                <p class="social-text">Hoặc Đăng ký với các nền tảng xã hội</p>
                <div class="social-media">
                    <a href="#" class="social-icon">
                        <i class="fab fa-facebook-f"></i>
                    </a>
                    <a href="#" class="social-icon">
                        <i class="fab fa-twitter"></i>
                    </a>
                    <a href="#" class="social-icon">
                        <i class="fab fa-google"></i>
                    </a>
                    <a href="#" class="social-icon">
                        <i class="fab fa-linkedin-in"></i>
                    </a>
                </div>
            </form>
        </div>
    </div>

    <div class="panels-container">
        <div class="panel left-panel">
            <div class="content">
                <h3>Mới đây ?</h3>
                <p>
                    Lorem ipsum, dolor sit amet consectetur adipisicing elit. Debitis,
                    ex ratione. Aliquid!
                </p>
                <button class="btn text-light login-product transparent" id="sign-up-btn">
                    Đăng ký
                </button>
                <div class="mt-4">
                    <a href="index.html"> <img src="" alt="">
                    </a>
                </div>
            </div>
            <a href="listPages"><img src="http://mauweb.monamedia.net/donghohaitrieu/wp-content/uploads/2019/07/logo-mona-2.png" class="image" alt="" /></a>
        </div>
        <div class="panel right-panel">
            <div class="content">
                <h3>Một trong số chúng tôi ?</h3>
                <p>
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Nostrum
                    laboriosam ad deleniti.
                </p>
                <button class="btn transparent text-light login-product" id="sign-in-btn">
                    Đăng nhập
                </button>
                <div class="mt-4">
                    <a href="index.html"> <img src="" alt="">
                    </a>
                </div>
            </div>
            <img width="50%" src="http://mauweb.monamedia.net/donghohaitrieu/wp-content/uploads/2019/07/logo-mona-2.png" class="image" alt="" />

        </div>
    </div>
</div>


<script src="https://code.jquery.com/jquery-3.6.0.min.js"
        integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

<script>
    const sign_in_btn = document.querySelector("#sign-in-btn");
    const sign_up_btn = document.querySelector("#sign-up-btn");
    const container = document.querySelector(".container-item-box");
    let users = [];
    let userLogin = [];
    sign_up_btn.addEventListener("click", () => {
        container.classList.add("sign-up-mode");
    });

    sign_in_btn.addEventListener("click", () => {
        container.classList.remove("sign-up-mode");
    });
</script>
</body>
</html>
