
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
                        <input type="email" class="auth-form__input" placeholder="Email của bạn " name="user" id="user">
                    </div>
                    <div class="auth-form__group">
                        <input type="text" class="auth-form__input" placeholder="Tên của bạn " name="fullname" id="user">
                    </div>
                    <div class="auth-form__group">
                        <input type="number" class="auth-form__input" placeholder="Sđt của bạn " name="phone" id="user">
                    </div>
                    <div class="auth-form__group">
                        <input type="password" class="auth-form__input" placeholder="Mật khẩu của bạn" name="pass" id="pass">
                    </div>
                    <div class="auth-form__group">
                        <input type="password" class="auth-form__input" placeholder="Nhập lại mật khẩu" name="repass" id="repass">
                    </div>
                    <div class="auth-form__group">
                        <select class="auth-form__input" placeholder="Loại người dùng" name="type" id="repass">
                            <option value="1">Người mua</option>
                            <option value="2">Người bán</option>
                        </select>
                    </div>
                </div>
                <div class="auth-form_aside">
                    <p class="auth-form__policy-text">
                        Bằng việc đăng kí, bạn đã đồng ý với EZ Shop về
                        <a href="" class="auth-form__text-link">Điều khoản dịch vụ</a> & 
                        <a href="" class="auth-form__text-link">Chính sách bảo mật</a>
                    </p>
                    <div class="auth-form__checkbox">
                        <input type="checkbox" id="agree" name="agree" />
                        <label for="agree">Tôi đồng ý với Điều khoản dịch vụ và Chính sách bảo mật.</label>
                    </div>
                </div>

                <div class="auth-form__controls">
                    <button class="btn " type="button" onclick="window.location.href = 'home';">TRỞ LẠI</button>
                    <button class="btn btn--primary" type="submit">ĐĂNG KÝ</button>
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
                        },
                        agree: {
                            required: true
                        }
                    },
                    messages: {
                        pass: {
                            required: "Vui lòng nhập mật khẩu"
                        },
                        repass: {
                            required: "Vui lòng nhập lại mật khẩu",
                            equalTo: "Mật khẩu không khớp. Vui lòng nhập lại"
                        },
                        agree: {
                            required: "Bạn phải đồng ý với các điều khoản trước khi đăng ký"
                        }
                    },
                    // Tùy chỉnh cách hiển thị lỗi cho checkbox "agree"
                    errorPlacement: function (error, element) {
                        if (element.attr("name") === "agree") {
                            error.insertAfter(element.closest('div.auth-form_aside')); // Đặt lỗi ngay sau checkbox
                        } else {
                            error.insertAfter(element); // Đặt lỗi bình thường cho các trường còn lại
                        }
                    }
                });

                $('#validate-register').on('submit', function (e) {
                    // Kiểm tra nếu checkbox chưa được tick
                    if (!$('#agree').prop('checked')) {
                        e.preventDefault(); // Ngừng gửi form
                    }
                });
            });

        </script>
    </body>



</html>
