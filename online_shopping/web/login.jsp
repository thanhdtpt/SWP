
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css">
        <link rel="stylesheet" href="./asserts/css/base.css">
        <link rel="stylesheet" href="./asserts/css/main.css">
        <link rel="stylesheet" href="./asserts/fonts/fontawesome-free-6.0.0/css/all.min.css">
        <style>
            .success-message {
                color: green;
                font-size: 14px;
                font-weight: bold;
                text-align: center;
                margin-bottom: 10px;
                padding: 10px;
                background: #e6ffe6; /* Màu nền xanh nhạt */
                border-radius: 5px;
            }
        </style>
    </head>
    <body>
        <form action="LoginServlet" method="post">
            <div class="auth-form">
                <c:if test="${not empty sessionScope.successMessage}">
                    <div class="success-message">
                        ${sessionScope.successMessage}
                    </div>
                    <% session.removeAttribute("successMessage"); %> 
                </c:if>

                <div class="auth-form_header">
                    <h3 class="auth-form_heading">Đăng nhập</h3>
                    <span class="auth-form_switch-btn" onclick="window.location.href = 'register.jsp'">Đăng ký</span>
                </div>
                <c:set var="cookie" value="${pageContext.request.cookies}" />

                <h3 style="color: red">${requestScope.error}</h3>
                <div class="auth-form__form">
                    <div class="auth-form__group">
                        <input type="text" class="auth-form__input" name="user" placeholder="Email của bạn"
                               value="${enteredUser != null ? enteredUser : cookie.user.value}">
                    </div>
                    <div class="auth-form__group">
                        <input type="password" class="auth-form__input" name="pass" placeholder="Mật khẩu của bạn"
                               value="${cookie.pass.value}">
                    </div>

                </div>
                <div class="auth-form_aside">
                    <p class="auth-form__help">

                        <a href="forgot.jsp" class="auth-form__text-link">Quên mật khẩu?</a>
                    </p>
                </div>
                <div class="auth-form__controls">
                    <button class="btn " type="button" onclick="window.location.href = 'home'">TRỞ LẠI</button>
                    <button class="btn btn--primary" type="submit">ĐĂNG NHẬP</button>
                </div>
            </div>
        </div>
    </form>
</body>
<style>
    body {
        font-family: 'Roboto', sans-serif;
        margin: 0;
        padding: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        background-color: #f0f0f0; /* Nền xám nhạt */
    }

    .auth-form {
        background: white;
        padding: 30px;
        border-radius: 8px;
        box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        width: 350px;
        text-align: center;
    }

    .auth-form__group {
        margin-bottom: 15px;
    }

    .auth-form__input {
        width: 100%;
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 5px;
    }

    .auth-form__controls {
        display: flex;
        justify-content: space-between;
        margin-top: 15px;
    }

    .btn {
        padding: 10px 15px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
    }

    .btn--primary {
        background-color: #007bff;
        color: white;
    }

    .btn--primary:hover {
        background-color: #0056b3;
    }

</style>
</html>
