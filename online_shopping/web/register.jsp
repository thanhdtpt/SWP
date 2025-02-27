
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
            /*            body {
                            font-family: 'Roboto', sans-serif;
                            margin: 0;
                            padding: 0;
                            display: flex;
                            justify-content: center;
                            align-items: center;
                            height: 100vh;
                            background-color: #f0f0f0;  Nền xám nhạt 
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
                        .auth-form__group {
                            position: relative;
                            text-align: left;  Căn lỗi về bên trái 
                        }
                         Đảm bảo chữ trong ô input luôn màu đen 
                        .auth-form__input {
                            color: black !important;  Luôn giữ màu chữ là đen 
                        }
            
                         Chỉ đổi màu viền input khi có lỗi 
                        .auth-form__input.error {
                            border-color: red !important;  Viền input đỏ khi có lỗi 
                        }
            
                         Định dạng lại vị trí lỗi 
                        .error {
                            color: red;
                            font-size: 12px;
                            margin-top: 5px;
                            display: block;
                            position: relative;  Fix lỗi lỗi validation bị tràn 
                        }
            
                         Căn chỉnh lại ô nhập mật khẩu + icon 
                        .password-wrapper {
                            position: relative;
                            display: flex;
                            align-items: center;
                        }
            
                        .toggle-password {
                            position: absolute;
                            right: 15px;
                            cursor: pointer;
                            font-size: 16px;
                            color: #555;
                        }
                         Căn giữa lỗi 
                        .error {
                            text-align: left;
                        }*/
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
            .auth-form__group {
                position: relative;
                text-align: left; /* Căn lỗi về bên trái */
            }
            /* Đảm bảo chữ trong ô input luôn màu đen */
            .auth-form__input {
                color: black !important; /* Luôn giữ màu chữ là đen */
            }

            /* Chỉ đổi màu viền input khi có lỗi */
            .auth-form__input.error {
                border-color: red !important; /* Viền input đỏ khi có lỗi */
            }

            /* Định dạng lại vị trí lỗi */
            .error {
                color: red;
                font-size: 12px;
                margin-top: 5px;
                display: block;
                position: relative; /* Fix lỗi lỗi validation bị tràn */
            }

            /* Căn chỉnh lại ô nhập mật khẩu + icon */
            .password-wrapper {
                position: relative;
                display: flex;
                align-items: center;
            }

            .toggle-password {
                position: absolute;
                right: 15px;
                cursor: pointer;
                font-size: 16px;
                color: #555;
            }
            /* Căn giữa lỗi */
            .error {
                text-align: left;
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
                        <input type="email" class="auth-form__input" placeholder="Email của bạn " name="user" id="user" required>
                    </div>
                    <div class="auth-form__group">
                        <input type="text" class="auth-form__input" placeholder="Sđt của bạn " required name="phone" id="phone">
                    </div>
                    <div class="auth-form__group" style="display: flex; gap: 10px;">
                        <input type="text" class="auth-form__input" placeholder="Tên của bạn" name="fullname" style="width: 50%;">
                        <select class="auth-form__input" name="type" required style="width: 50%;">
                            <option value="2">Người mua</option>
                            <option value="3">Người bán</option>
                        </select>
                    </div>

                    <div class="auth-form__group" style="display: flex; gap: 10px;">
                        <select class="auth-form__input" name="gender" required style="width: 50%;">
                            <option value="male">Nam</option>
                            <option value="female">Nữ</option>
                        </select>
                        <input type="date" class="auth-form__input" name="dob" style="width: 50%;">
                    </div>
                    <div class="auth-form__group">
                        <div class="password-wrapper">
                            <input type="password" class="auth-form__input" placeholder="Mật khẩu của bạn" name="pass" id="pass">
                            <span class="toggle-password" onclick="togglePassword('pass')">
                                <i class="fa fa-eye"></i>
                            </span>
                        </div>
                    </div>
                    <label id="pass-error" class="error" for="pass"></label>

                    <div class="auth-form__group">
                        <div class="password-wrapper">
                            <input type="password" class="auth-form__input" placeholder="Nhập lại mật khẩu" name="repass" id="repass">
                            <span class="toggle-password" onclick="togglePassword('repass')">
                                <i class="fa fa-eye"></i>
                            </span>
                        </div>
                    </div>
                    <label id="repass-error" class="error" for="repass"></label>



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
                // Thêm method kiểm tra mật khẩu mạnh
                $.validator.addMethod("strongPassword", function (value, element) {
                    return this.optional(element) || /^(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/.test(value);
                }, "Mật khẩu phải có ít nhất 8 ký tự, bao gồm chữ hoa, số và ký tự đặc biệt.");

                // Thêm method kiểm tra số điện thoại
                $.validator.addMethod("validPhone", function (value, element) {
                    return this.optional(element) || /^(0\d{9}|\+84\d{9})$/.test(value);
                }, "Số điện thoại không hợp lệ. Phải bắt đầu bằng 0 hoặc +84 và có 10 số.");

                // Validate form
                $('#validate-register').validate({
                    rules: {
                        phone: {
                            required: true,
                            validPhone: true
                        },
                        pass: {
                            required: true,
                            strongPassword: true
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
                        phone: {
                            required: "Vui lòng nhập số điện thoại"
                        },
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
                    errorPlacement: function (error, element) {
                        error.appendTo(element.closest('.auth-form__group'));
                    }
                });

                // Hiển thị hoặc ẩn mật khẩu
                window.togglePassword = function (id) {
                    var input = document.getElementById(id);
                    var icon = input.nextElementSibling.querySelector("i");
                    if (input.type === "password") {
                        input.type = "text";
                        icon.classList.remove("fa-eye");
                        icon.classList.add("fa-eye-slash");
                    } else {
                        input.type = "password";
                        icon.classList.remove("fa-eye-slash");
                        icon.classList.add("fa-eye");
                    }
                };
            });
        </script>
        <script>
            $(document).ready(function () {
                // Tính ngày 10 năm trước từ ngày hiện tại
                var today = new Date();
                var tenYearsAgo = new Date(today.setFullYear(today.getFullYear() - 10));

                // Định dạng ngày dưới dạng yyyy-mm-dd
                var day = String(tenYearsAgo.getDate()).padStart(2, '0');
                var month = String(tenYearsAgo.getMonth() + 1).padStart(2, '0');
                var year = tenYearsAgo.getFullYear();

                // Cập nhật thuộc tính max cho input ngày sinh
                $('input[name="dob"]').attr('max', year + '-' + month + '-' + day);
            });
        </script>





    </body>



</html>