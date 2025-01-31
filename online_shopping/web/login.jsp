<%-- 
    Document   : login
    Created on : Feb 22, 2022, 7:52:51 PM
    Author     : win
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">+
     <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css">
    <link rel="stylesheet" href="./asserts/css/base.css">
    <link rel="stylesheet" href="./asserts/css/main.css">
    <link rel="stylesheet" href="./asserts/fonts/fontawesome-free-6.0.0/css/all.min.css">
    </head>
    <body>
        <form action="login" method="post">
                    <div class="auth-form">
                <div class="auth-form_header">
                    <h3 class="auth-form_heading">Đăng nhập</h3>
                    <span class="auth-form_switch-btn" onclick="window.location.href='register.jsp'">Đăng ký</span>
                </div>
                <c:set var="cookie" value="${pageContext.request.cookies}" />
               
                    <h3 style="color: red">${requestScope.error}</h3>
                <div class="auth-form__form">
                    <div class="auth-form__group">
                        <input type="text" class="auth-form__input" name="user" placeholder="Email của bạn "
                               value="${cookie.user.value}">
                    </div>
                    <div class="auth-form__group">
                        <input type="password" class="auth-form__input" name="pass" placeholder="Mật khẩu của bạn"
                               value="${cookie.pass.value}">
                    </div>
                    <input type="checkbox" name="rem" value="ON" ${cookie.rem.value eq 'ON' ?"checked":""}>Remember me

                </div>
                <div class="auth-form_aside">
                    <p class="auth-form__help">

                        <a href="" class="auth-form__text-link">Quên mật khẩu</a>
                        <span class="auth-form__help-separate"></span>
                        <a href="" class="auth-form__text-link">Cần trợ giúp?</a>
                    </p>
                </div>
                <div class="auth-form__controls">
                    <button class="btn " type="button" onclick="window.location.href='home.jsp'">TRỞ LẠI</button>
                    <button class="btn btn--primary" type="submit">ĐĂNG NHẬP</button>
                </div>
                <div class="auth-form__socials">
                    <a href="" class=" auth-form__socials--facebook btn btn--size-s btn--with-icon">
                        <i
                            class="auth-form__socials--icon fa-brands fa-facebook-square auth-form__socials--icon-facebook"></i>
                        Đăng nhập với Facebook
                    </a>
                    <a href="" class="auth-form__socials--google btn btn--size-s btn--with-icon">
                        <i class="auth-form__socials--icon fa-brands fa-google auth-form__socials--icon-google">

                        </i> Kết nối với Google
                    </a>
                </div>
            </div>
        </div>
        </form>
    </body>
</html>
