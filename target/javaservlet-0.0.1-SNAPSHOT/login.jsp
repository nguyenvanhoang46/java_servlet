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
</head>
<body>
<div class="container-item-box">
    <div class="forms-container">
        <div class="signin-signup" id="id01">
            <form action="login" method="post" class="sign-in-form" id="from-login">
                <h2 class="title">Đăng nhập</h2>
                <div class="input-field">
                    <i class="fas fa-user"></i>
                    <input id="username" name="user" type="text" placeholder="Tài khoản" />
                </div>
                <div class="input-field">
                    <i class="fas fa-lock"></i>
                    <input id="passwork" name="pass" type="password" placeholder="Mật khẩu" />
                </div>

                <p class="text-danger" id="notifi-login"></p>
                <button type="submit" class="btn login-product">đăng nhập</button>

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
            <img src="http://mauweb.monamedia.net/donghohaitrieu/wp-content/uploads/2019/07/logo-mona-2.png" class="image" alt="" />
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
