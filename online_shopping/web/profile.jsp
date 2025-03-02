<%-- 
    Document   : home
    Created on : Feb 22, 2022, 7:26:52 PM
    Author     : win
--%>

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
        <link rel="stylesheet" href="./asserts/css/main1.css">
        <link rel="stylesheet" href="./asserts/css/footer.css">
        <link rel="stylesheet" href="./asserts/css/profile.css">
        <link rel="stylesheet" href="./asserts/fonts/fontawesome-free-6.0.0/css/all.min.css">
    </head>
    <body>
        <script src="asserts/js/form.js"></script>
        <!-- header  -->
        <div class="app">
            <header class="header">
                <div class="grid">
                    <nav class="header__navbar">
                        <ul class="header__navbar-list">
                            <li class="header__navbar-item header__navbar-item--has-qr header__navbar-item--separate">
                                Kênh người bán
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
                                <script>
                                    alert("Access denied");
                                    window.location.href = "login.jsp";
                                </script>
                            </c:if>

                            <c:if test="${sessionScope.account!=null}">
                                <!--LOGED-->
                                <li class="header__navbar-item header__navbar-user">
                                    <img src="
                                         https://w7.pngwing.com/pngs/340/956/png-transparent-profile-user-icon-computer-icons-user-profile-head-ico-miscellaneous-black-desktop-wallpaper-thumbnail.png"
                                         alt="" class="header__navbar-user-img">
                                    <span class="header__navbar-user-name">${sessionScope.account.cusname}</span>
                                    <ul class="header__navbar-user-menu">
                                        <li class="header__navbar-user-item">
                                            <a href="profile">Tài khoản của tôi</a>
                                        </li>
                                        <li class="header__navbar-user-item">
                                            <a href="address?action=view">Địa chỉ của tôi</a>
                                        </li>
                                        <li class="header__navbar-user-item">
                                            <a href="order">Đơn mua </a>
                                        </li>

                                        <li class="header__navbar-user-item">
                                            <a href="logout">Đăng xuất</a>
                                        </li>
                                    </ul>
                                </li> 
                            </c:if>
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

                                <c:if test="${sessionScope.size == null or sessionScope.size == 0}">
                                    <span class="header__cart-notice">0</span>
                                    <!--Has no cart-->
                                    <div class="header__cart-list header__cart-list--no-cart">
                                        <img src="./asserts/img/nocart.png" alt=""class="header__cart-list--no-cart-img">
                                        <p class="header__cart-list-no-cart-msg">
                                            Chưa có sản phẩm
                                        </p>
                                    </div> 
                                </c:if>

                                <c:if test="${sessionScope.size != null && sessionScope.size!=0}">
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
            <c:if test="${sessionScope.account!=null}">
                <!-- List category-->
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
                                    Tài khoản của tôi
                                </h>
                                <!-- <li class="profile-item profile-item">
                                   <a href="#" class="profile-item__link profile-item__link-main">Tài khoản của tôi</a>
                                   </li> -->
                                <li class="profile-item profile-item--active">
                                    <a href="profile" class="profile-item__link">Hồ Sơ</a>
                                </li>
                                <li class="profile-item">
                                    <a href="address.jsp" class="profile-item__link">Địa chỉ</a>
                                </li>
                                <li class="profile-item">
                                    <a href="repass.jsp" class="profile-item__link">Đổi mật khẩu</a>
                                </li>
                                <div class="profile-item__link-group">
                                    <img src="https://cf.shopee.vn/file/f0049e9df4e536bc3e7f140d071e9078" alt="" class="profile-item profile-item-img">
                                    <li class="profile-item">
                                        <a href="repass" class="profile-item__link">Đơn mua</a>
                                    </li>
                                </div>
                            </ul>
                        </div>
                    </div>
                    <!-- /* Home Information  */ -->
                    <div class="grid__column-10" style="background-color: #fff; box-shadow: 0 0 2px #ccc; position: relative ; height:700px">
                        <div class="profile__form">
                            <!-- heading form-->
                            <div class="profile__form--heading">
                                <div class="profile__form--heading profile__form--heading-title">
                                    <h1 class="profile__form--heading profile__form--heading-title-content">
                                        Hồ sơ của tôi
                                    </h1>
                                </div>
                                <div class="profile__form--heading profile__form--heading-title-description">
                                    Quản lý thông tin hồ sơ để bảo mật tài khoản
                                </div>
                            </div>

                            <!-- Body form -->
                            <div class="main-profile-form grid__column-8">
                                <div class="body-base columns">
                                    <form action="profile" method="POST" enctype="multipart/form-data" class="profile-update-form">
                                        <div class="avatar-section">
                                            <label for="avatarUpload" class="avatar-label">
                                                <img id="avatarPreview" src="./${profile.image}" alt="Avatar" class="avatar-img">
                                            </label>
                                            <input type="file" id="avatarUpload" name="avatar" accept="image/*">
                                        </div>

                                        <!-- Các thông tin khác -->
                                        <div class="form-group">
                                            <label for="email">Email</label>
                                            <input type="email" readonly id="email" name="email" value="${profile.username}" placeholder="Nhập email">
                                        </div>

                                        <div class="form-group">
                                            <label for="fullName">Họ và tên</label>
                                            <input type="text" id="fullName" name="fullName" value="${profile.name}" placeholder="Nhập họ và tên">
                                        </div>

                                        <div class="form-group">
                                            <label for="phone">Số điện thoại</label>
                                            <input type="text" id="phone" name="phone" value="${profile.phone}" placeholder="Nhập số điện thoại">
                                        </div>

                                        <div class="form-group">
                                            <label for="dob">Ngày sinh</label>
                                            <input type="date" id="dob" name="dob" value="${profile.dob}">
                                        </div>
                                        <div>${profile.gender}</div>
                                        <div class="form-group">
                                            <label for="gender">Giới tính</label>
                                            <select id="gender" name="gender">
                                                <option value="male" ${profile.gender == true ? "selected" : ""}>Nam</option>
                                                <option value="female" ${profile.gender == false ? "selected" : ""}>Nữ</option>
                                            </select>
                                        </div>

                                        <button type="submit" class="update-btn">Cập nhật</button>
                                    </form>

                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- CSS -->
                    <style>
                        .profile-update-form {
                            display: flex;
                            flex-direction: column;
                            gap: 15px;
                            padding: 20px;
                        }

                        .avatar-section {
                            display: flex;
                            justify-content: center;
                            margin-bottom: 15px;
                        }

                        .avatar-label {
                            cursor: pointer;
                            display: flex;
                            flex-direction: column;
                            align-items: center;
                        }

                        .avatar-img {
                            width: 120px;
                            height: 120px;
                            border-radius: 50%;
                            object-fit: cover;
                            border: 2px solid #ccc;
                        }

                        .form-group {
                            display: flex;
                            flex-direction: column;
                        }

                        .form-group label {
                            font-weight: bold;
                            margin-bottom: 5px;
                        }

                        .form-group input,
                        .form-group select {
                            padding: 8px;
                            border: 1px solid #ccc;
                            border-radius: 5px;
                        }

                        .update-btn {
                            background-color: #007bff;
                            color: white;
                            padding: 10px;
                            border: none;
                            border-radius: 5px;
                            cursor: pointer;
                            font-size: 16px;
                        }

                        .update-btn:hover {
                            background-color: #0056b3;
                        }
                    </style>

                    <!-- JavaScript -->
                    <script>
                        document.getElementById('avatarUpload').addEventListener('change', function (event) {
                            const file = event.target.files[0];
                            if (file) {
                                const reader = new FileReader();
                                reader.onload = function (e) {
                                    document.getElementById('avatarPreview').src = e.target.result;
                                };
                                reader.readAsDataURL(file);
                            }
                        });
                    </script>
                </div>
            </div>
        </c:if>
        <c:if test="${sessionScope.account==null}">
            <form action="login" method="get">
                <div class="auth-form">
                    <div class="auth-form_header">
                        <h3 class="auth-form_heading">Đăng nhập</h3>
                        <span class="auth-form_switch-btn" onclick="window.location.href = 'register.jsp'">Đăng ký</span>
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
                        <button class="btn " type="button" onclick="window.location.href = 'home.jsp'">TRỞ LẠI</button>
                        <button class="btn btn--primary" type="button" onclick="this.submit()">ĐĂNG NHẬP</button>
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

    </c:if>
</div>
</body>
<%@ include file="footer.jsp" %>
</html>
