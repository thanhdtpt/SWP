<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>

        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css">
        <link rel="stylesheet" href="./asserts/css/base.css">
        <link rel="stylesheet" href="./asserts/css/main.css">
        <link rel="stylesheet" href="./asserts/css/footer.css">
        <link rel="stylesheet" href="./asserts/css/profile.css">
        <link rel="stylesheet" href="./asserts/fonts/fontawesome-free-6.0.0/css/all.min.css">
        <style>
            /* Căn chỉnh label và input */
            .form-item {
                display: flex;
                align-items: flex-start;
                margin-bottom: 15px;
            }

            .form-item label {
                width: 150px;
                text-align: left;
                font-weight: bold;
                margin-top: 10px; /* Giúp căn chỉnh label với input */
            }

            /* Chỉnh sửa ô input */
            .input-group {
                position: relative;
                width: 100%;
                max-width: 300px;
                display: flex;
                flex-direction: column;
            }

            .input-group input {
                width: 100%;
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 5px;
                font-size: 14px;
            }

            /* Khi có lỗi, chỉ viền input màu đỏ */
            .input-error {
                border: 1px solid red !important;
            }

            /* Biểu tượng mắt nằm trong ô input */
            .toggle-password {
                position: absolute;
                right: 10px;
                top: 50%;
                transform: translateY(-50%);
                cursor: pointer;
                font-size: 16px;
                color: gray;
            }

            /* Hiển thị lỗi ngay dưới input, đẩy input bên dưới xuống */
            .error-message {
                color: red;
                font-size: 12px;
                margin-top: 5px;
                display: block;
                position: relative;
            }

            /* Đẩy nút "Lưu" thẳng hàng với label */
            .form-submit {
                display: flex;
                align-items: center;
                margin-left: 150px; /* Căn lề ngang với label */
            }
            .err {
                display: flex;
                padding-top: 15px;
                align-items: center;
                margin-left: 150px; /* Căn lề ngang với label */
            }

        </style>
    </head>
    <body>
        <script src="./asserts/js/form.js"></script>

        <!-- header  -->
        <div class="app">
            <style>
                .footer img {
                    width: 100%;
                    height: auto;
                    display: block;
                }

            </style>
            <header class="header">
                <div class="grid">
                    <nav class="header__navbar">
                        <ul class="header__navbar-list">
                            <li class="header__navbar-item header__navbar-item--has-qr header__navbar-item--separate">
                                <c:if test="${sessionScope.acount.username==null}">
                                    kênh người bán
                                </c:if>
                                <c:if test="${sessionScope.acount.username!=null}">
                                    Vào cửa hàng ${sessionScope.acount.username} shop
                                </c:if>
                                <!-- head qr code -->
                                <div class="header_qr">
                                    <img src="./asserts/img/Qr_code.png" alt="Qr code" class="header_qr-img">
                                    <div class="header__qr-apps">
                                        <a href="" class="header_qr-link">
                                            <img src="/asserts/img/GooglePlay.png" alt="Google Play"
                                                 class="header_qr-dowload-img">
                                        </a>
                                        <a href="" class="header_qr-link">
                                            <img src="/asserts/img/Appstore.png" alt="App Store"
                                                 class="header_qr-dowload-img">
                                        </a>
                                    </div>
                                </div>
                            </li>

                            <li class="header__navbar-item">
                                <span class="header__navbar-title--no-pointer">Kết nối</span>
                                <a href="" class="header__navbar-icon-link">
                                    <i class="header__navbar-icon fa-brands fa-facebook"></i>
                                    <i class="header__navbar-icon fa-brands fa-instagram"></i>
                                </a>
                            </li>
                        </ul>
                        <ul class="header__navbar-list">
                            <li class="header__navbar-item header__navbar-item--has-notify">
                                <a href="" class="header__navbar-item-link"><i
                                        class="header__navbar-icon fa-solid fa-bell"></i>
                                    Thông báo</a>
                                <div class="header__notify">
                                    <header class="header__notify-header">
                                        <h3>Thông báo mới nhận</h3>
                                    </header>
                                    <ul class="header__notify-list">
                                        <li class="header__notify-item header__notify-item--viewed">
                                            <a href="" class="header__notify-link">

                                                <img src="https://cdn.chanhtuoi.com/uploads/2021/06/w400/my-pham-truesky.jpg.webp"
                                                     alt="Mỹ phâm Ohui" class="header__notify-img">
                                                <div class="header__notify-info">
                                                    <span class="header__notify-name">Mỹ phẩm Ohui Chính Hãng</span>
                                                    <span class="header__notify-description">Mô tả mỹ phẩm Ohui Chính
                                                        Hãng</span>
                                                </div>
                                            </a>
                                        </li>
                                        <li class="header__notify-item">
                                            <a href="" class="header__notify-link header__notify-item--viewed">

                                                <img src="	https://cf.shopee.vn/file/6e28e2c12b39294ecfd4adcdfd03985d"
                                                     alt="Mỹ phâm Ohui" class="header__notify-img">
                                                <div class="header__notify-info">
                                                    <span class="header__notify-name">[FreeShip] [Giá hủy diệt] Giá đỡ
                                                        Laptop - Giá kê laptop / MacBook / Ultrabook điều chỉnh độ cao - đế
                                                        tản nhiệt</span>
                                                    <span class="header__notify-description">Giá đỡ laptop dành cho Macbook
                                                        Ipad Surface và các máy tính xách tay khác
                                                        Chất liệu: Nhựa ABS</span>
                                                </div>
                                            </a>
                                        </li>
                                        <li class="header__notify-item header__notify-item--viewed">
                                            <a href="" class="header__notify-link">

                                                <img src="https://cf.shopee.vn/file/f85c05df4b8c46cf5205d72055c766ff"
                                                     alt="Mỹ phâm Ohui" class="header__notify-img">
                                                <div class="header__notify-info">
                                                    <span class="header__notify-name">(HOT) 🌻 ĐẤT TRỘN TRỒNG SEN ĐÁ - XƯƠNG
                                                        RỒNG 🌻 15K/ 1KG - S30</span>
                                                    <span class="header__notify-description">
                                                        Đất trộn chuyên trồng sen đá - xương rồng</span>
                                                </div>
                                            </a>
                                        </li>
                                        <li class="header__notify-item header__notify-item--viewed">
                                            <a href="" class="header__notify-link">

                                                <img src="https://cf.shopee.vn/file/673f4dbfdd17548b58eab822a0d18ab3"
                                                     alt="Mỹ phâm Ohui" class="header__notify-img">
                                                <div class="header__notify-info">
                                                    <span class="header__notify-name">[Chính hãng] Đồng hồ decor ELEKSTUBE
                                                        V6 - Đồng hồ NIXIE phát sáng - có thể setup thay đổi hình ảnh tùy
                                                        ý</span>
                                                    <span class="header__notify-description">Elekstube IPs là sản phẩm đồng
                                                        hồ cao cấp chạy trên nền Led chuyên nghiệp đang là một trong những
                                                        đồng hồ hot nhất trên thế giới hiện nay.</span>
                                                </div>
                                            </a>
                                        </li>
                                    </ul>
                                    <footer class="header__notify-footer">
                                        <a href="" class="header__notify-footer-btn">Xem tất cả</a>
                                    </footer>
                                </div>
                            </li>
                            <li class="header__navbar-item">
                                <a href="" class="header__navbar-item-link"><i
                                        class="header__navbar-icon fa-solid fa-circle-question"></i>
                                    Trợ giúp</a>

                            </li>
                            <!--does not loggin-->
                            <c:if test="${sessionScope.account==null}">
                                <li class="header__navbar-item  header__navbar-item--strong register-item" >
                                    <a href="register.jsp"  
                                       class="header__navbar-item-link header__navbar-item--separate header__navbar-item--strong">Đăng
                                        kí</a>
                                </li>
                                <li class="header__navbar-item header__navbar-item--strong login-item">
                                    <a href="login.jsp" class="header__navbar-item-link header__navbar-item--strong">Đăng nhập</a>
                                </li>
                            </c:if>

                            <c:if test="${sessionScope.account!=null}">
                                <!--LOGED-->
                                <li class="header__navbar-item header__navbar-user">
                                    <img src="./${sessionScope.profile.image}"
                                         alt="" class="header__navbar-user-img">
                                    <span class="header__navbar-user-name">${sessionScope.cus.name}</span>
                                    <ul class="header__navbar-user-menu">
                                        <li class="header__navbar-user-item">
                                            <a href="profile">Tài khoản của tôi</a>
                                        </li>
                                        <li class="header__navbar-user-item">
                                            <a href="address?action=view">Địa chỉ của tôi</a>
                                        </li>
                                        <li class="header__navbar-user-item">
                                            <a href="adress">Đơn mua </a>
                                        </li>

                                        <li class="header__navbar-user-item">
                                            <a href="logout">Đăng xuất</a>
                                        </li>
                                    </ul>
                                </li> 
                            </c:if>
                        </ul>
                        </li>
                        </ul>
                    </nav>

                    <!-- header with search  -->
                    <nav class="header-with-search">
                        <div class="" onclick="window.location.href = 'home'">
                            <img src="./img/logo.png" width="70" style="
                                 margin-right: 6rem;
                                 ">
                        </div>
                        <div class="header__search">
                            <div class="header__search-input-wrap">
                                <input type="text" class="header__search-input" placeholder="Nhập để tìm kiếm sản phẩm">
                                <!-- Search history -->
                                <div class="header__search-history">
                                    <h3 class="header__search-history-heading">Lịch sử tìm kiếm</h3>
                                    <ul class="header__search-history-list">
                                        <li class="header__search-history-item">
                                            <a href="">Kem trị mụn</a>
                                        </li>
                                        <li class="header__search-history-item">
                                            <a href="">Kem dưỡng da</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>

                            <div class="header__search-select">
                                <span class="header__search-select-label">Trong shop</span>
                                <i class="header__search-select-icon fa-solid fa-chevron-down"></i>
                                <ul class="header__search-option">
                                    <li class="header__search-option-item header__search-option-item--active">
                                        <span>
                                            Trong shop
                                            <i class="fa-solid fa-check"></i>
                                        </span>
                                    </li>
                                    <li class="header__search-option-item">
                                        <span>
                                            Ngoài shop
                                            <i class="fa-solid fa-check"></i>
                                        </span>
                                    </li>
                                </ul>
                            </div>
                            <button class="header__search-btn">
                                <i class="header__search-btn-icon fa-solid fa-magnifying-glass"></i>
                            </button>
                        </div>
                        <!-- Cart layout -->
                        <div class="header__cart">
                            <div class="header__cart-wrap">
                                <i class="header__cart-icon fa-solid fa-cart-shopping"></i>

                                <c:if test="${sessionScope.size==0}">
                                    <span class="header__cart-notice">0</span>
                                    <!--Has no cart-->
                                    <div class="header__cart-list header__cart-list--no-cart">
                                        <img src="./asserts/img/nocart.png" alt=""class="header__cart-list--no-cart-img">
                                        <p class="header__cart-list-no-cart-msg">
                                            Chưa có sản phẩm
                                        </p>
                                    </div> 
                                </c:if>

                                <c:if test="${sessionScope.size!=0}">
                                    <span class="header__cart-notice">${sessionScope.size}</span>
                                    <div class="header__cart-list header__cart-list--have-cart ">
                                        <h4 class="header__cart-heading">Sản phẩm đã thêm</h4>
                                        <ul class="header__cart-list-item">
                                            <c:set var="o" value="${sessionScope.cart}"/>
                                            <c:forEach items="${o.items}" var="i">
                                                <li id="demo" class="header__cart-item" style="margin-bottom:20px ; cursor: pointer">
                                                    <img class="header__cart-item-img"
                                                         src="${i.product.images1}"
                                                         alt="">
                                                    <div class="header__cart-item-info">
                                                        <div class="header__cart-item-head">
                                                            <h5 class="header__cart-item-name">${i.product.productname}</h5>
                                                            <div class="header__cart-item-atributes-list">
                                                                <span
                                                                    class="header__cart-item-atribute header__cart-item-price">${i.product.currentPrice}</span>
                                                                <span
                                                                    class="header__cart-item-atribute header__cart-item-multiply">x</span>
                                                                <span
                                                                    class="header__cart-item-atribute header__cart-item-qnt">${i.quantity}</span>
                                                            </div>

                                                        </div>
                                                        <div class="header__cart-item-body ">
                                                            <span class="header__cart-item-description">Phân loại : Bạc </span>
                                                            
                                                        </div>
                                                    </div>
                                                </li>
                                            </c:forEach>

                                        </ul>
                                        <div class="auth-form__cart-btn" onclick="window.location.href = 'cart.jsp">
                                            <button type="button" class="btn btn--primary btn--primary--viewcart" onclick="document.location.href = 'cart.jsp'">Xem giỏ hàng</button>
                                        </div>

                                    </div>
                                </c:if>

                            </div>

                        </div>



                    </nav>
                </div>
            </header>
            <!-- List category-->
            <c:if test="${sessionScope.account==null}">
                <script>
                    alert("Access denied");
                    window.location.href = "login.jsp";
                </script>

                <!--                <script type=\"text/javascript\>
                                    alert('acess denied');
                                    window.location.href="login.jsp";
                                </script>-->
            </c:if>
            <c:if test="${sessionScope.account!=null}">


                <div class="grid__row main-profile-category">
                    <div class="grid__column-2">
                        <div class="profile">
                            <div class="profile__heading">
                                <div class="profile__heading profile__heading-avatar">
                                    <img src="https://cf.shopee.vn/file/e4b8614be265b210727bdef25190db23_tn" alt="avatar">
                                </div>
                                <div class="profile__heading profile__heading-content">
                                    <div class="profile__heading profile__heading-content profile__heading-content-acount">
                                        ${sessionScope.cus.name}
                                    </div>
                                    <div class="profile__heading profile__heading-content profile__heading-content-title">
                                        <i class="fa-solid fa-pen profile__heading-content-fix profile__heading-content-fix-icon"></i>
                                        <a class=" profile__heading profile__heading-content profile__heading-content-fix">
                                            sửa hồ sơ
                                        </a>
                                    </div>
                                </div>
                            </div>

                            <ul class="profile-list">
                                <h class="profile__heading-item"><i class="fa-solid fa-user profile__heading-item-icon "></i> 
                                    Tài khoản của tôi</h>
                                <!-- <li class="profile-item profile-item">
                                    <a href="#" class="profile-item__link profile-item__link-main">Tài khoản của tôi</a>
                                </li> -->
                                <li class="profile-item ">
                                    <a href="profile" class="profile-item__link">Hồ Sơ</a>
                                </li>
                                <li class="profile-item">
                                    <a href="address" class="profile-item__link">Địa chỉ</a>
                                </li>
                                <li class="profile-item profile-item--active">
                                    <a href="repass" class="profile-item__link">Đổi mật khẩu</a>
                                </li>
                                <div class="profile-item__link-group">
                                    <img src="https://cf.shopee.vn/file/f0049e9df4e536bc3e7f140d071e9078" alt="" class="profile-item profile-item-img">
                                    <li class="profile-item">
                                        <a href="order" class="profile-item__link">Đơn mua</a>
                                    </li>
                                </div>

                            </ul>
                        </div>
                    </div>

                    <!-- /* Home Information  */ -->
                    <div class="grid__column-7" style="background-color: #fff; box-shadow: 0 0 2px #ccc; position: relative ; height:500px">
                        <div class="profile__form">
                            <!-- heading form-->
                            <div class="profile__form--heading">
                                <div class="profile__form--heading profile__form--heading-title">
                                    <h1 class="profile__form--heading profile__form--heading-title-content">
                                        Đổi mật khẩu
                                    </h1>
                                </div>
                                <div class="profile__form--heading profile__form--heading-title-description">Quản lý thông tin hồ sơ để bảo mật tài khoản</div>

                            </div>
                            <!--Bodyform-->
                            <form action="repass" method="post" style="width: 100%">  
                                <div class=" main-profile-form grid__column-7">
                                    <div class="body-base columns"></div>
                                    <div class="form--body">
                                    </div>
                                    

                                    <div class="form-item">
                                        <label for="oldpass">Mật khẩu hiện tại</label>
                                        <div class="input-group">
                                            <input type="password" id="oldpass" name="oldpass" placeholder="Nhập mật khẩu hiện tại">
                                            <i class="fa fa-eye toggle-password"></i>
                                            <span class="error-message"></span>
                                        </div>
                                    </div>

                                    <div class="form-item">
                                        <label for="newpass">Mật khẩu mới</label>
                                        <div class="input-group">
                                            <input type="password" id="newpass" name="newpass" placeholder="Nhập mật khẩu mới">
                                            <i class="fa fa-eye toggle-password"></i>
                                            <span class="error-message"></span>
                                        </div>
                                    </div>

                                    <div class="form-item">
                                        <label for="renewpass">Nhập lại mật khẩu</label>
                                        <div class="input-group">
                                            <input type="password" id="renewpass" name="renewpass" placeholder="Nhập lại mật khẩu">
                                            <i class="fa fa-eye toggle-password"></i>
                                            <span class="error-message"></span>
                                        </div>
                                    </div>

                                    <div class="form-submit">
                                        <button type="submit" class="btn btn--primary">Lưu</button>
                                    </div>
                                    <c:if test="${not empty requestScope.success}">
                                        <p class="err" style="color: green; font-size: 1.3rem; font-weight: bold;">
                                            ${requestScope.success}
                                        </p>
                                    </c:if>

                                    <c:if test="${not empty requestScope.error}">
                                        <p class="err" style="color: red; font-size: 1.3rem; font-weight: bold;">
                                            ${requestScope.error}
                                        </p>
                                    </c:if>

                                </div>
                            </form>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </c:if>
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            function showError(input, message) {
                let errorSpan = input.parentNode.querySelector(".error-message");
                if (!errorSpan) {
                    errorSpan = document.createElement("span");
                    errorSpan.classList.add("error-message");
                    input.parentNode.appendChild(errorSpan);
                }
                input.classList.add("input-error");
                errorSpan.innerText = message;
                input.parentNode.style.marginBottom = "25px"; // Đẩy input bên dưới xuống
            }

            function clearError(input) {
                let errorSpan = input.parentNode.querySelector(".error-message");
                if (errorSpan) {
                    errorSpan.innerText = "";
                }
                input.classList.remove("input-error");
                input.parentNode.style.marginBottom = "10px"; // Reset khoảng cách khi không có lỗi
            }

            function validatePassword() {
                let oldPass = document.querySelector('input[name="oldpass"]');
                let newPass = document.querySelector('input[name="newpass"]');
                let confirmPass = document.querySelector('input[name="renewpass"]');

                let passwordRegex = /^(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;
                let isValid = true;

                if (!passwordRegex.test(newPass.value)) {
                    showError(newPass, "Mật khẩu ít nhất 8 ký tự, gồm chữ hoa, số, ký tự đặc biệt.");
                    isValid = false;
                } else {
                    clearError(newPass);
                }

                if (newPass.value === oldPass.value) {
                    showError(newPass, "Mật khẩu mới không được trùng với mật khẩu cũ.");
                    isValid = false;
                } else if (passwordRegex.test(newPass.value)) {
                    clearError(newPass);
                }

                if (newPass.value !== confirmPass.value) {
                    showError(confirmPass, "Nhập lại mật khẩu không khớp.");
                    isValid = false;
                } else {
                    clearError(confirmPass);
                }

                return isValid;
            }

            // Kiểm tra khi nhập xong và click ra ngoài ô input
            document.querySelector('input[name="newpass"]').addEventListener("blur", validatePassword);
            document.querySelector('input[name="renewpass"]').addEventListener("blur", validatePassword);

            // Khi nhấn submit
            document.querySelector("form").addEventListener("submit", function (event) {
                if (!validatePassword()) {
                    event.preventDefault(); // Ngăn form gửi nếu có lỗi
                }
            });

            // Bật/tắt hiển thị mật khẩu
            document.querySelectorAll(".toggle-password").forEach(function (icon) {
                icon.addEventListener("click", function () {
                    let input = this.previousElementSibling;
                    if (input.type === "password") {
                        input.type = "text";
                        this.classList.remove("fa-eye");
                        this.classList.add("fa-eye-slash");
                    } else {
                        input.type = "password";
                        this.classList.remove("fa-eye-slash");
                        this.classList.add("fa-eye");
                    }
                });
            });
        });

    </script>

</body>
<%@ include file="footer.jsp" %>
</html>
