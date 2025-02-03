
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css">
        <link rel="stylesheet" href="./asserts/css/base.css">
        <link rel="stylesheet" href="./asserts/css/main.css">
        <link rel="stylesheet" href="./asserts/fonts/fontawesome-free-6.0.0/css/all.min.css">
        <!-- jQuery library -->
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>

        <!-- Popper JS -->
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

        <!-- Latest compiled JavaScript -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

        <script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.3/dist/jquery.validate.min.js"></script>

        <script type="text/javascript"
        src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.13.1/jquery.validate.min.js"></script>

        <style>
            label.error {
                color: red;
                margin-left: 2%;
            }
        </style>
    </head>
    <body>     
        <form id="validate-register" action="register" method="post">
            <div class="auth-form">
                <div class="auth-form_header">
                    <h3 class="auth-form_heading">Đăng ký</h3>
                    <a href="login.jsp" class="auth-form_switch">
                        <span class="auth-form_switch-btn">Đăng nhập</span>
                    </a>
                </div>
                <div class="auth-form__form">
                    <div class="auth-form__group">
                        <input type="text" class="auth-form__input" placeholder=" Tên tài khoản của bạn " name="user" id="user">
                    </div>
                    <div class="auth-form__group">
                        <input type="password" class="auth-form__input" placeholder="Mật khẩu của bạn" name="pass" id="pass">
                    </div>
                    <div class="auth-form__group">
                        <input type="password" class="auth-form__input" placeholder="Nhập lại mật khẩu" name="repass" id="repass">
                    </div>
                </div>
                <div class="auth-form_aside">
                    <p class="auth-form__policy-text">
                        Bằng việc đăng kí,bạn đã đồng ý với Shopee về
                        <a href="" class="auth-form__text-link">Điều khoản dịch vụ</a> &
                        <a href="" class="auth-form__text-link">Chính sách bảo mật</a>
                    </p>
                </div>
                <div class="auth-form__controls">
                    <button class="btn " type="button" onclick="window.location.href = 'home.jsp';">TRỞ LẠI</button>
                    <button class="btn btn--primary" type="submit">ĐĂNG KÝ</button>
                </div>
                <div class="auth-form__socials">
                    <a href="" class=" auth-form__socials--facebook btn btn--size-s btn--with-icon">
                        <i class="auth-form__socials--icon fa-brands fa-facebook-square"></i>
                        Kết nối với Facebook
                    </a>
                    <a href="" class="auth-form__socials--google btn btn--size-s btn--with-icon">
                        <i class="auth-form__socials--icon fa-brands fa-google">
                        </i>  
                        Kết nối với Google
                    </a>
                </div>
            </div>
        </form>

        <script>
            $(document).ready(function () {
                $('#validate-register').validate({
                    rules: {
                        pass: {
                            required: true
                        },
                        repass: {
                            required: true,
                            equalTo: "#pass"
                        }
                    },
                    messages: {
                        pass: {
                            required: "Enter your pass - Don't leave it empty"
                        },
                        repass: {
                            required: "Enter your repass - Don't leave it empty",
                            equalTo: "The passwords do not match"
                        }
                    }
                });
            });

        </script>
    </body>



</html>
