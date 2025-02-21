<!DOCTYPE html>
<html lang="en">

    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@page contentType="text/html" pageEncoding="UTF-8"%>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>


        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css">
        <link rel="stylesheet" href="./asserts/css/base.css">
        <link rel="stylesheet" href="./asserts/css/main1.css">
        <link rel="stylesheet" href="./asserts/css/product.css">

        <link rel="stylesheet" href="./asserts/css/checkbox.css">
        <link rel="stylesheet" href="./asserts/fonts/fontawesome-free-6.0.0/css/all.min.css">
    </head>

    <body>
        <script src="./asserts/js/form.js"></script>
        <style>
            .footer img {
                width: 100%;
                height: auto;
                display: block;
            }

        </style>
        <!-- Block Element Modifier -->
        <div class="app">
            <header class="header ">
                <div class="grid">
                    <nav class="header__navbar">
                        <ul class="header__navbar-list">
                            <li class="header__navbar-item header__navbar-item--has-qr header__navbar-item--separate"onclick="window.location.href = 'seller-product'">
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
                                <a style="color:var(--white-color); text-decoration:none;" href=""
                                   class="header__navbar-icon-link">
                                    <i class="header__navbar-icon fa-brands fa-facebook"></i>
                                    <i class="header__navbar-icon fa-brands fa-instagram"></i>
                                </a>
                            </li>
                        </ul>
                        <ul class="header__navbar-list">
                            <li class="header__navbar-item header__navbar-item--has-notify">
                                <a style="color:var(--white-color); text-decoration:none;" href=""
                                   class="header__navbar-item-link"><i class="header__navbar-icon fa-solid fa-bell"></i>
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
                                <a style="color:var(--white-color); text-decoration:none;" href=""
                                   class="header__navbar-item-link"><i
                                        class="header__navbar-icon fa-solid fa-circle-question"></i>
                                    Trợ giúp</a>

                            </li>
                            <!-- <li class="header__navbar-item  header__navbar-item--strong register-item">
                                <h3 href="" onclick="registerform()"
                                    class="header__navbar-item-link header__navbar-item--separate header__navbar-item--strong">
                                    Đăng
                                    kí</h3>
                            </li>
                            <li class="header__navbar-item header__navbar-item--strong login-item" onclick="loginform()">
                                <a href="" class="header__navbar-item-link header__navbar-item--strong">Đăng nhập</a>
                            </li> -->


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
                                        <a href="address">Địa chỉ của tôi</a>
                                    </li>
                                    <li class="header__navbar-user-item">
                                        <a href="order">Đơn mua </a>
                                    </li>

                                    <li class="header__navbar-user-item">
                                        <a href="logout">Đăng xuất</a>
                                    </li>
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
                                <c:if test="${sessionScope.size == null or sessionScope.size==0}">
                                    <span class="header__cart-notice">0</span>
                                </c:if>
                                <c:if test="${sessionScope.size != null && sessionScope.size!=0}">
                                    <span class="header__cart-notice">${sessionScope.size}</span>
                                </c:if>
                                <!--Has no cart-->
                                <!-- <div class="header__cart-list header__cart-list--no-cart">
                                    <img src="./asserts/img/nocart.png" alt=""class="header__cart-list--no-cart-img">
                                    <p class="header__cart-list-no-cart-msg">
                                        Chưa có sản phẩm
                                    </p>
                                
    
                                </div> -->
                                <div class="header__cart-list header__cart-list--have-cart ">
                                    <h4 class="header__cart-heading">Sản phẩm đã thêm</h4>
                                    <ul class="header__cart-list-item">
                                        <li class="header__cart-item">
                                            <img class="header__cart-item-img"
                                                 src="https://vn-live-05.slatic.net/shop/828c4f87798f23cdef55058a30ed0a14.jpeg_2200x2200q80.jpg_.webp"
                                                 alt="Bàn phím cơ Fuhlen">
                                            <div class="header__cart-item-info">
                                                <div class="header__cart-item-head">
                                                    <h5 class="header__cart-item-name">KHÔ CÁ DỨA LOẠI 1 ĐẶC SẢN MINH TRIẾT
                                                    </h5>
                                                    <div class="header__cart-item-atributes-list">
                                                        <span
                                                            class="header__cart-item-atribute header__cart-item-price">1.000.000đ</span>
                                                        <span
                                                            class="header__cart-item-atribute header__cart-item-multiply">x</span>
                                                        <span
                                                            class="header__cart-item-atribute header__cart-item-qnt">1</span>
                                                    </div>

                                                </div>
                                                <div class="header__cart-item-body ">
                                                    <span class="header__cart-item-description">Phân loại : Bạc </span>
                                                    <span class="header__cart-item-delete">Xóa </span>
                                                </div>
                                            </div>
                                        </li>
                                        <li class="header__cart-item">
                                            <img class="header__cart-item-img"
                                                 src="https://prooffice.vn/wp-content/uploads/2020/05/Chu%E1%BB%99t-Logitech-G102.jpg"
                                                 alt="Bàn phím cơ Fuhlen">
                                            <div class="header__cart-item-info">
                                                <div class="header__cart-item-head">
                                                    <h5 class="header__cart-item-name">Chuột không dây cao cấp 1</h5>
                                                    <div class="header__cart-item-atributes-list">
                                                        <span
                                                            class="header__cart-item-atribute header__cart-item-price">1.269.000đ</span>
                                                        <span
                                                            class="header__cart-item-atribute header__cart-item-multiply">x</span>
                                                        <span
                                                            class="header__cart-item-atribute header__cart-item-qnt">1</span>
                                                    </div>

                                                </div>
                                                <div class="header__cart-item-body ">
                                                    <span class="header__cart-item-description">Phân loại : Bạc </span>
                                                    <span class="header__cart-item-delete">Xóa </span>
                                                </div>
                                            </div>
                                        </li>
                                        <li class="header__cart-item">
                                            <img class="header__cart-item-img"
                                                 src="https://img.websosanh.vn/v2/users/dclimg/images/rrrez1bs7mmr1.jpg?compress=85"
                                                 alt="Bàn phím cơ Fuhlen">
                                            <div class="header__cart-item-info">
                                                <div class="header__cart-item-head">
                                                    <h5 class="header__cart-item-name"> Loa sony XB32 cá tính</h5>
                                                    <div class="header__cart-item-atributes-list">
                                                        <span
                                                            class="header__cart-item-atribute header__cart-item-price">1.269.000đ</span>
                                                        <span
                                                            class="header__cart-item-atribute header__cart-item-multiply">x</span>
                                                        <span
                                                            class="header__cart-item-atribute header__cart-item-qnt">1</span>
                                                    </div>

                                                </div>
                                                <div class="header__cart-item-body ">
                                                    <span class="header__cart-item-description">Phân loại : Bạc </span>
                                                    <span class="header__cart-item-delete">Xóa </span>
                                                </div>
                                            </div>
                                        </li>
                                    </ul>
                                    <div class="auth-form__cart-btn" onclick="window.location.href = 'cart.jsp'">
                                        <button class="btn btn--primary btn--primary--viewcart" >Xem giỏ hàng</button>
                                    </div>

                                </div>
                            </div>

                        </div>



                    </nav>
                </div>

            </header>
            <div class="app__container">
                <c:set var="p" value="${requestScope.pro}"></c:set>
                <c:set var="c" value="${requestScope.ca}"></c:set>
                <c:set var="shop" value="${requestScope.shop}"></c:set>
                    <div class="grid">

                        <div class="grid__row " style="font-size: 1.4rem;">
                            <div class="grid__column-2">
                            </div>
                            <div class="grid__column-10  " style="margin-bottom:100px; background-color:var(--white-color);">
                                <form action="addToCart" method="post" id="form-product" onsubmit="return false">
                                    <!--<form action="buy" method="get" id="form-product" onsubmit="return false">-->
                                    <div class="home-product">
                                        <div class="grid__row">

                                            <!--NavBar category-->
                                            <div class="flex items-center _3bDXqx page-product__breadcrumb category--navbar">
                                                <a class=" category--navbar _2572CL" href="/">
                                                    EZshop</a>
                                                <svg enable-background="new 0 0 11 11" viewBox="0 0 11 11" x="0" y="0"
                                                     class=" category--navbar shopee-svg-icon _2m4lrt icon-arrow-right">
                                                <path
                                                    d="m2.5 11c .1 0 .2 0 .3-.1l6-5c .1-.1.2-.3.2-.4s-.1-.3-.2-.4l-6-5c-.2-.2-.5-.1-.7.1s-.1.5.1.7l5.5 4.6-5.5 4.6c-.2.2-.2.5-.1.7.1.1.3.2.4.2z">
                                                </path>
                                                </svg>
                                                <span class="category--navbar _1w3mKA">
                                                ${c.name}</span>
                                        </div>
                                        <!--Body product-->
                                        <div class="product-briefing flex card _1j7uGn product-container">
                                            <div class="product-img">
                                                <div class="_3rslob _1vc1W7"
                                                     style="background-image: url(${p.images1}); background-size: contain; background-repeat: no-repeat;">
                                                </div>

                                            </div>
                                            <div class="flex flex-auto _3qq4y7 product-order">
                                                <div class="flex-auto flex-column  _4QIZZo">
                                                    <div class="_3g8My- product--order--title">
                                                        <span>
                                                            ${p.productname}</span>
                                                    </div>
                                                    <div class="flex _28iFbX rating--icon">
                                                        <div class="flex _1GknPu star--icon rating--icon">
                                                            <div class="_3uBhVI URjL1D rating--icon">
                                                                5.0</div>
                                                            <div class="oMTlt6">
                                                                <div class="shopee-rating-stars rating--icon">
                                                                    <div class="shopee-rating-stars__stars rating--icon">
                                                                        <div
                                                                            class="shopee-rating-stars__star-wrapper rating--icon">
                                                                            <div class="shopee-rating-stars__lit rating--icon"
                                                                                 style="width: 100%;">
                                                                                <svg enable-background="new 0 0 15 15"
                                                                                     viewBox="0 0 15 15" x="0" y="0"
                                                                                     class="shopee-svg-icon shopee-rating-stars__primary-star icon-rating-solid rating--icon">
                                                                                <polygon
                                                                                    points="7.5 .8 9.7 5.4 14.5 5.9 10.7 9.1 11.8 14.2 7.5 11.6 3.2 14.2 4.3 9.1 .5 5.9 5.3 5.4"
                                                                                    stroke-linecap="round"
                                                                                    stroke-linejoin="round"
                                                                                    stroke-miterlimit="10">

                                                                                </polygon>
                                                                                </svg>
                                                                            </div>
                                                                            <svg enable-background="new 0 0 15 15"
                                                                                 viewBox="0 0 15 15" x="0" y="0"
                                                                                 class="shopee-svg-icon shopee-rating-stars__hollow-star icon-rating rating--icon">
                                                                            <polygon fill="none"
                                                                                     points="7.5 .8 9.7 5.4 14.5 5.9 10.7 9.1 11.8 14.2 7.5 11.6 3.2 14.2 4.3 9.1 .5 5.9 5.3 5.4"
                                                                                     stroke-linecap="round"
                                                                                     stroke-linejoin="round"
                                                                                     stroke-miterlimit="10">

                                                                            </polygon>
                                                                            </svg>
                                                                        </div>
                                                                        <div
                                                                            class="shopee-rating-stars__star-wrapper rating--icon">
                                                                            <div class="shopee-rating-stars__lit rating--icon"
                                                                                 style="width: 100%;">
                                                                                <svg enable-background="new 0 0 15 15 rating--icon"
                                                                                     viewBox="0 0 15 15" x="0" y="0"
                                                                                     class="shopee-svg-icon shopee-rating-stars__primary-star icon-rating-solid rating--icon">
                                                                                <polygon
                                                                                    points="7.5 .8 9.7 5.4 14.5 5.9 10.7 9.1 11.8 14.2 7.5 11.6 3.2 14.2 4.3 9.1 .5 5.9 5.3 5.4"
                                                                                    stroke-linecap="round"
                                                                                    stroke-linejoin="round"
                                                                                    stroke-miterlimit="10">

                                                                                </polygon>
                                                                                </svg>
                                                                            </div>
                                                                            <svg enable-background="new 0 0 15 15"
                                                                                 viewBox="0 0 15 15" x="0" y="0"
                                                                                 class="shopee-svg-icon shopee-rating-stars__hollow-star icon-rating rating--icon">
                                                                            <polygon fill="none"
                                                                                     points="7.5 .8 9.7 5.4 14.5 5.9 10.7 9.1 11.8 14.2 7.5 11.6 3.2 14.2 4.3 9.1 .5 5.9 5.3 5.4"
                                                                                     stroke-linecap="round"
                                                                                     stroke-linejoin="round"
                                                                                     stroke-miterlimit="10">

                                                                            </polygon>
                                                                            </svg>
                                                                        </div>
                                                                        <div class="shopee-rating-stars__star-wrapper">
                                                                            <div class="shopee-rating-stars__lit"
                                                                                 style="width: 100%;">
                                                                                <svg enable-background="new 0 0 15 15"
                                                                                     viewBox="0 0 15 15" x="0" y="0"
                                                                                     class="shopee-svg-icon shopee-rating-stars__primary-star icon-rating-solid">
                                                                                <polygon
                                                                                    points="7.5 .8 9.7 5.4 14.5 5.9 10.7 9.1 11.8 14.2 7.5 11.6 3.2 14.2 4.3 9.1 .5 5.9 5.3 5.4"
                                                                                    stroke-linecap="round"
                                                                                    stroke-linejoin="round"
                                                                                    stroke-miterlimit="10">

                                                                                </polygon>
                                                                                </svg>
                                                                            </div>
                                                                            <svg enable-background="new 0 0 15 15"
                                                                                 viewBox="0 0 15 15" x="0" y="0"
                                                                                 class="shopee-svg-icon shopee-rating-stars__hollow-star icon-rating">
                                                                            <polygon fill="none"
                                                                                     points="7.5 .8 9.7 5.4 14.5 5.9 10.7 9.1 11.8 14.2 7.5 11.6 3.2 14.2 4.3 9.1 .5 5.9 5.3 5.4"
                                                                                     stroke-linecap="round"
                                                                                     stroke-linejoin="round"
                                                                                     stroke-miterlimit="10">

                                                                            </polygon>
                                                                            </svg>
                                                                        </div>
                                                                        <div class="shopee-rating-stars__star-wrapper">
                                                                            <div class="shopee-rating-stars__lit"
                                                                                 style="width: 100%;">
                                                                                <svg enable-background="new 0 0 15 15"
                                                                                     viewBox="0 0 15 15" x="0" y="0"
                                                                                     class="shopee-svg-icon shopee-rating-stars__primary-star icon-rating-solid">
                                                                                <polygon
                                                                                    points="7.5 .8 9.7 5.4 14.5 5.9 10.7 9.1 11.8 14.2 7.5 11.6 3.2 14.2 4.3 9.1 .5 5.9 5.3 5.4"
                                                                                    stroke-linecap="round"
                                                                                    stroke-linejoin="round"
                                                                                    stroke-miterlimit="10">

                                                                                </polygon>
                                                                                </svg>
                                                                            </div>
                                                                            <svg enable-background="new 0 0 15 15"
                                                                                 viewBox="0 0 15 15" x="0" y="0"
                                                                                 class="shopee-svg-icon shopee-rating-stars__hollow-star icon-rating">
                                                                            <polygon fill="none"
                                                                                     points="7.5 .8 9.7 5.4 14.5 5.9 10.7 9.1 11.8 14.2 7.5 11.6 3.2 14.2 4.3 9.1 .5 5.9 5.3 5.4"
                                                                                     stroke-linecap="round"
                                                                                     stroke-linejoin="round"
                                                                                     stroke-miterlimit="10">

                                                                            </polygon>
                                                                            </svg>
                                                                        </div>
                                                                        <div class="shopee-rating-stars__star-wrapper">
                                                                            <div class="shopee-rating-stars__lit"
                                                                                 style="width: 96.6667%;">
                                                                                <svg enable-background="new 0 0 15 15"
                                                                                     viewBox="0 0 15 15" x="0" y="0"
                                                                                     class="shopee-svg-icon shopee-rating-stars__primary-star icon-rating-solid">
                                                                                <polygon
                                                                                    points="7.5 .8 9.7 5.4 14.5 5.9 10.7 9.1 11.8 14.2 7.5 11.6 3.2 14.2 4.3 9.1 .5 5.9 5.3 5.4"
                                                                                    stroke-linecap="round"
                                                                                    stroke-linejoin="round"
                                                                                    stroke-miterlimit="10">

                                                                                </polygon>
                                                                                </svg>
                                                                            </div>
                                                                            <svg enable-background="new 0 0 15 15"
                                                                                 viewBox="0 0 15 15" x="0" y="0"
                                                                                 class="shopee-svg-icon shopee-rating-stars__hollow-star icon-rating">
                                                                            <polygon fill="none"
                                                                                     points="7.5 .8 9.7 5.4 14.5 5.9 10.7 9.1 11.8 14.2 7.5 11.6 3.2 14.2 4.3 9.1 .5 5.9 5.3 5.4"
                                                                                     stroke-linecap="round"
                                                                                     stroke-linejoin="round"
                                                                                     stroke-miterlimit="10">

                                                                            </polygon>
                                                                            </svg>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="flex _1GknPu">
                                                            <div class="_3uBhVI">
                                                                60</div>
                                                            <div class="oMTlt6">
                                                                đánh giá</div>
                                                        </div>
                                                        <div class="flex voPlNU">
                                                            <div class="_3b2Btx">
                                                                ${p.unitOnOrder}</div>
                                                            <div class="_3hic1u">
                                                                đã bán</div>
                                                        </div>
                                                    </div>
                                                    <div style="margin-top: 10px;" class="nav__bar__price">
                                                        <div class="flex flex-column">
                                                            <div class="flex flex-column _1900SS">
                                                                <div class="flex items-center">
                                                                    <div class="flex items-center _1V_Jxg">
                                                                        <div class="_2Csw3W old--price">
                                                                            ${p.oldPrice}</div>
                                                                        <div class="flex items-center">
                                                                            <div class="_2v0Hgx current--price">
                                                                                ${p.currentPrice}</div>
                                                                            <div class="_1kpF5Y item--discount">
                                                                                ${p.discount}%</div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="_7c-I_e">
                                                        <div class="flex flex-column">
                                                            <div class="flex _3qYU_y _1W8scW">
                                                                <label class="koZBMj">
                                                                    Vận chuyển</label>
                                                                <div class="_2pq-2z k2VzJg">
                                                                    <div class="_395uFd">
                                                                        <div class="_39gnVH">
                                                                            <img src="https://deo.shopeemobile.com/shopee/shopee-pcmall-live-sg/pdp/1cdd37339544d858f4d0ade5723cd477.png"
                                                                                 width="25" height="15" class="_1gtfJo">
                                                                            Miễn phí vận chuyển
                                                                        </div>
                                                                        <div class="_2HB1lm">
                                                                            Miễn phí vận chuyển cho đơn hàng trên ₫300.000</div>
                                                                    </div>
                                                                    <div class="flex flex-row">
                                                                        <div class="_3RF-NF">
                                                                            <svg enable-background="new 0 0 15 15"
                                                                                 viewBox="0 0 15 15" x="0" y="0"
                                                                                 class="shopee-svg-icon icon-free-shipping-line">
                                                                            <g>
                                                                            <line fill="none" stroke-linejoin="round"
                                                                                  stroke-miterlimit="10" x1="8.6" x2="4.2"
                                                                                  y1="9.8" y2="9.8">

                                                                            </line>
                                                                            <circle cx="3" cy="11.2" fill="none" r="2"
                                                                                    stroke-miterlimit="10">

                                                                            </circle>
                                                                            <circle cx="10" cy="11.2" fill="none" r="2"
                                                                                    stroke-miterlimit="10">

                                                                            </circle>
                                                                            <line fill="none" stroke-miterlimit="10"
                                                                                  x1="10.5" x2="14.4" y1="7.3" y2="7.3">

                                                                            </line>
                                                                            <polyline fill="none"
                                                                                      points="1.5 9.8 .5 9.8 .5 1.8 10 1.8 10 9.1"
                                                                                      stroke-linejoin="round"
                                                                                      stroke-miterlimit="10">

                                                                            </polyline>
                                                                            <polyline fill="none"
                                                                                      points="9.9 3.8 14 3.8 14.5 10.2 11.9 10.2"
                                                                                      stroke-linejoin="round"
                                                                                      stroke-miterlimit="10">

                                                                            </polyline>
                                                                            </g>
                                                                            </svg>
                                                                        </div>
                                                                        <div class="flex flex-column">
                                                                            <div class="flex items-center vJ8y-b">
                                                                                <div class="_2Dz7kG">
                                                                                    Vận chuyển tới</div>
                                                                                <div class="flex">
                                                                                    <div class="flex items-center">
                                                                                        <div class="_1R7LAU">
                                                                                            <div class="flex items-center">
                                                                                                <span class="_1uIhvN">
                                                                                                    ${shop.address}
                                                                                                </span>
                                                                                                <svg enable-background="new 0 0 11 11"
                                                                                                     viewBox="0 0 11 11" x="0"
                                                                                                     y="0"
                                                                                                     class="shopee-svg-icon icon-arrow-down">
                                                                                                <g>
                                                                                                <path
                                                                                                    d="m11 2.5c0 .1 0 .2-.1.3l-5 6c-.1.1-.3.2-.4.2s-.3-.1-.4-.2l-5-6c-.2-.2-.1-.5.1-.7s.5-.1.7.1l4.6 5.5 4.6-5.5c.2-.2.5-.2.7-.1.1.1.2.3.2.4z">

                                                                                                </path>
                                                                                                </g>
                                                                                                </svg>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="vJ8y-b">
                                                                                <div class="_2Dz7kG">
                                                                                    phí vận chuyển</div>
                                                                                <div>
                                                                                    <div class="shopee-drawer"
                                                                                         id="pc-drawer-id-0" tabindex="0">
                                                                                        <div class="flex items-center _-3xNiX">
                                                                                            ₫33.000<svg
                                                                                                enable-background="new 0 0 11 11"
                                                                                                viewBox="0 0 11 11" x="0" y="0"
                                                                                                class="shopee-svg-icon icon-arrow-down">
                                                                                            <g>
                                                                                            <path
                                                                                                d="m11 2.5c0 .1 0 .2-.1.3l-5 6c-.1.1-.3.2-.4.2s-.3-.1-.4-.2l-5-6c-.2-.2-.1-.5.1-.7s.5-.1.7.1l4.6 5.5 4.6-5.5c.2-.2.5-.2.7-.1.1.1.2.3.2.4z">

                                                                                            </path>
                                                                                            </g>
                                                                                            </svg>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                            <div class="flex _3qYU_y _6Orsg5">
                                                                <div class="flex flex-column">
                                                                    <div class="flex items-center L6Jueq">
                                                                        <div class="koZBMj">
                                                                            Số lượng</div>
                                                                        <div class="flex items-center">
                                                                            <div style="margin-right: 15px;">
                                                                                <div class="_28qt-B shopee-input-quantity">
                                                                                    <button class="_14flVw" id="creament">
                                                                                        <svg enable-background="new 0 0 10 10"
                                                                                             viewBox="0 0 10 10" x="0" y="0"
                                                                                             class="shopee-svg-icon">
                                                                                        <polygon
                                                                                            points="4.5 4.5 3.5 4.5 0 4.5 0 5.5 3.5 5.5 4.5 5.5 10 5.5 10 4.5">

                                                                                        </polygon>
                                                                                        </svg>
                                                                                    </button>
                                                                                    <input class="_14flVw z4c5Da" type="text"
                                                                                           role="spinbutton" aria-valuenow="1"
                                                                                           value="1" name="quantity" id="text">
                                                                                    <button class="_14flVw" id="uncreament">
                                                                                        <svg enable-background="new 0 0 10 10"
                                                                                             viewBox="0 0 10 10" x="0" y="0"
                                                                                             class="shopee-svg-icon icon-plus-sign">
                                                                                        <polygon
                                                                                            points="10 4.5 5.5 4.5 5.5 0 4.5 0 4.5 4.5 0 4.5 0 5.5 4.5 5.5 4.5 10 5.5 10 5.5 5.5 10 5.5">

                                                                                        </polygon>
                                                                                        </svg>
                                                                                    </button>
                                                                                </div>
                                                                                <script>
                                                                                    let creament = document.getElementById("creament")
                                                                                    let uncreament = document.getElementById("uncreament")
                                                                                    let text = document.getElementById("text")
                                                                                    let click = document.getElementById("click")
                                                                                    uncreament.addEventListener("click", () => {
                                                                                        text.value++
                                                                                    })
                                                                                    creament.addEventListener("click", () => {
                                                                                        if (text.value > 1) {
                                                                                            text.value--
                                                                                        }
                                                                                    })
                                                                                </script>
                                                                            </div>
                                                                            <div>
                                                                                ${p.unitInstock} sản phẩm có sẵn</div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div style="margin-top: 15px;">
                                                        <div class="j1JSoD">
                                                            <div class="QcT1pP">
                                                                <button type="button"
                                                                        class="btn btn-tinted btn--l rvHxix _3t_iHy btn--add"
                                                                        aria-disabled="false" onclick="document.getElementById('form-product').submit()">
                                                                    <svg enable-background="new 0 0 15 15" viewBox="0 0 15 15"
                                                                         x="0" y="0"
                                                                         class="shopee-svg-icon _32Ho0Q icon-add-to-cart">
                                                                    <g>
                                                                    <g>
                                                                    <polyline fill="none"
                                                                              points=".5 .5 2.7 .5 5.2 11 12.4 11 14.5 3.5 3.7 3.5"
                                                                              stroke-linecap="round"
                                                                              stroke-linejoin="round"
                                                                              stroke-miterlimit="10">

                                                                    </polyline>
                                                                    <circle cx="6" cy="13.5" r="1" stroke="none">

                                                                    </circle>
                                                                    <circle cx="11.5" cy="13.5" r="1" stroke="none">

                                                                    </circle>
                                                                    </g>
                                                                    <line fill="none" stroke-linecap="round"
                                                                          stroke-miterlimit="10" x1="7.5" x2="10.5" y1="7"
                                                                          y2="7">

                                                                    </line>
                                                                    <line fill="none" stroke-linecap="round"
                                                                          stroke-miterlimit="10" x1="9" x2="9" y1="8.5"
                                                                          y2="5.5">

                                                                    </line>
                                                                    </g>
                                                                    </svg>
                                                                    <span>
                                                                        thêm vào giỏ hàng</span>
                                                                </button>
                                                                <button type="button"
                                                                        class="btn btn-solid-primary btn--l rvHxix"
                                                                        aria-disabled="false" onclick="document.getElementById('form-product').submit()">
                                                                    Mua ngay</button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div style="margin-top: 30px; border-top: 1px solid rgba(0, 0, 0, 0.05);">
                                                    </div>
                                                </div>
                                            </div>

                                        </div>

                                    </div>
                                </div>
                                <div class="home-product">
                                    <div class="grid__row">
                                        <div class="describe--container ">
                                            <div class="_1Qm7yD">
                                                Mô tả sản phẩm</div>
                                            <div class="Fo12Im">
                                                <div class="Mhqp_x">
                                                    <p>
                                                        <input type="text"  value="${p.id}" name="id" readonly="" style="display: none"><br>
                                                        ${p.describe} 
                                                    </p>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="describe--container ">
                                            <div class="_1Qm7yD">
                                                Đánh giá sản phẩm</div>
                                            <div class="Fo12Im">
                                                <div class="shopee-product-rating">
                                                    <a class="shopee-product-rating__avatar" href="/shop/616362665">
                                                        <div class="shopee-avatar">
                                                            <div class="shopee-avatar__placeholder">
                                                                <svg enable-background="new 0 0 15 15" viewBox="0 0 15 15" x="0"
                                                                     y="0" class="shopee-svg-icon icon-headshot">
                                                                <g>
                                                                <circle cx="7.5" cy="4.5" fill="none" r="3.8"
                                                                        stroke-miterlimit="10">

                                                                </circle>
                                                                <path d="m1.5 14.2c0-3.3 2.7-6 6-6s6 2.7 6 6"
                                                                      fill="none" stroke-linecap="round"
                                                                      stroke-miterlimit="10">

                                                                </path>
                                                                </g>
                                                                </svg>
                                                            </div>
                                                            <img class="shopee-avatar__img"
                                                                 src="https://cf.shopee.vn/file/0640b218223302dd5fa3297e108b82b7_tn">
                                                        </div>
                                                    </a>
                                                    <div class="shopee-product-rating__main">
                                                        <a class="shopee-product-rating__author-name" href="/shop/616362665">
                                                            namun612</a>
                                                        <div class="repeat-purchase-con">
                                                            <div class="shopee-product-rating__rating">
                                                                <svg enable-background="new 0 0 15 15" viewBox="0 0 15 15" x="0"
                                                                     y="0"
                                                                     class="shopee-svg-icon icon-rating-solid--active icon-rating-solid">
                                                                <polygon
                                                                    points="7.5 .8 9.7 5.4 14.5 5.9 10.7 9.1 11.8 14.2 7.5 11.6 3.2 14.2 4.3 9.1 .5 5.9 5.3 5.4"
                                                                    stroke-linecap="round" stroke-linejoin="round"
                                                                    stroke-miterlimit="10">

                                                                </polygon>
                                                                </svg>
                                                                <svg enable-background="new 0 0 15 15" viewBox="0 0 15 15" x="0"
                                                                     y="0"
                                                                     class="shopee-svg-icon icon-rating-solid--active icon-rating-solid">
                                                                <polygon
                                                                    points="7.5 .8 9.7 5.4 14.5 5.9 10.7 9.1 11.8 14.2 7.5 11.6 3.2 14.2 4.3 9.1 .5 5.9 5.3 5.4"
                                                                    stroke-linecap="round" stroke-linejoin="round"
                                                                    stroke-miterlimit="10">

                                                                </polygon>
                                                                </svg>
                                                                <svg enable-background="new 0 0 15 15" viewBox="0 0 15 15" x="0"
                                                                     y="0"
                                                                     class="shopee-svg-icon icon-rating-solid--active icon-rating-solid">
                                                                <polygon
                                                                    points="7.5 .8 9.7 5.4 14.5 5.9 10.7 9.1 11.8 14.2 7.5 11.6 3.2 14.2 4.3 9.1 .5 5.9 5.3 5.4"
                                                                    stroke-linecap="round" stroke-linejoin="round"
                                                                    stroke-miterlimit="10">

                                                                </polygon>
                                                                </svg>
                                                                <svg enable-background="new 0 0 15 15" viewBox="0 0 15 15" x="0"
                                                                     y="0"
                                                                     class="shopee-svg-icon icon-rating-solid--active icon-rating-solid">
                                                                <polygon
                                                                    points="7.5 .8 9.7 5.4 14.5 5.9 10.7 9.1 11.8 14.2 7.5 11.6 3.2 14.2 4.3 9.1 .5 5.9 5.3 5.4"
                                                                    stroke-linecap="round" stroke-linejoin="round"
                                                                    stroke-miterlimit="10">

                                                                </polygon>
                                                                </svg>
                                                                <svg enable-background="new 0 0 15 15" viewBox="0 0 15 15" x="0"
                                                                     y="0"
                                                                     class="shopee-svg-icon icon-rating-solid--active icon-rating-solid">
                                                                <polygon
                                                                    points="7.5 .8 9.7 5.4 14.5 5.9 10.7 9.1 11.8 14.2 7.5 11.6 3.2 14.2 4.3 9.1 .5 5.9 5.3 5.4"
                                                                    stroke-linecap="round" stroke-linejoin="round"
                                                                    stroke-miterlimit="10">

                                                                </polygon>
                                                                </svg>
                                                            </div>
                                                        </div>
                                                        <div class="shopee-product-rating__time">
                                                            2022-03-04 10:01 </div>
                                                        <div class="_3NrdYc">
                                                            Ok</div>
                                                        <div class="shopee-product-rating__image-list-wrapper">
                                                            <div class="rating-media-list">
                                                                <div class="rating-media-list__container">
                                                                    <div
                                                                        class="rating-media-list__image-wrapper rating-media-list__image-wrapper--inactive">
                                                                        <div class="shopee-rating-media-list-image__wrapper">
                                                                            <div
                                                                                class="shopee-rating-media-list-image__place-holder">
                                                                                <svg enable-background="new 0 0 15 15"
                                                                                     viewBox="0 0 15 15" x="0" y="0"
                                                                                     class="shopee-svg-icon icon-loading-image">
                                                                                <g>
                                                                                <rect fill="none" height="8"
                                                                                      stroke-linecap="round"
                                                                                      stroke-linejoin="round"
                                                                                      stroke-miterlimit="10" width="10"
                                                                                      x="1" y="4.5">

                                                                                </rect>
                                                                                <line fill="none" stroke-linecap="round"
                                                                                      stroke-linejoin="round"
                                                                                      stroke-miterlimit="10" x1="1"
                                                                                      x2="11" y1="6.5" y2="6.5">

                                                                                </line>
                                                                                <rect fill="none" height="3"
                                                                                      stroke-linecap="round"
                                                                                      stroke-linejoin="round"
                                                                                      stroke-miterlimit="10" width="3"
                                                                                      x="11" y="6.5">

                                                                                </rect>
                                                                                <line fill="none" stroke-linecap="round"
                                                                                      stroke-linejoin="round"
                                                                                      stroke-miterlimit="10" x1="1"
                                                                                      x2="11" y1="14.5" y2="14.5">

                                                                                </line>
                                                                                <line fill="none" stroke-linecap="round"
                                                                                      stroke-linejoin="round"
                                                                                      stroke-miterlimit="10" x1="6" x2="6"
                                                                                      y1=".5" y2="3">

                                                                                </line>
                                                                                <line fill="none" stroke-linecap="round"
                                                                                      stroke-linejoin="round"
                                                                                      stroke-miterlimit="10" x1="3.5"
                                                                                      x2="3.5" y1="1" y2="3">

                                                                                </line>
                                                                                <line fill="none" stroke-linecap="round"
                                                                                      stroke-linejoin="round"
                                                                                      stroke-miterlimit="10" x1="8.5"
                                                                                      x2="8.5" y1="1" y2="3">

                                                                                </line>
                                                                                </g>
                                                                                </svg>
                                                                            </div>
                                                                            <div class="shopee-rating-media-list-image__content"
                                                                                 style="background-image: url(&quot;https://cf.shopee.vn/file/819b65930a5026759e3e4d1e2f6f42f0_tn&quot;);">
                                                                                <div
                                                                                    class="shopee-rating-media-list-image__content--blur">
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="rating-media-list__zoomed-image">
                                                                    <div class="rating-media-list-image-carousel"
                                                                         style="transition: all 0ms ease 0s;">
                                                                        <div
                                                                            class="rating-media-list-image-carousel__item-list-wrapper">
                                                                            <ul
                                                                                class="rating-media-list-image-carousel__item-list">
                                                                                <li class="rating-media-list-image-carousel__item rating-media-list-image-carousel__item--fluid"
                                                                                    style="padding: 0px 0.625rem;">
                                                                                    <img class="rating-media-list__zoomed-image-item"
                                                                                         src="https://cf.shopee.vn/file/819b65930a5026759e3e4d1e2f6f42f0">
                                                                                </li>
                                                                            </ul>
                                                                        </div>
                                                                        <div class="rating-media-list-carousel-arrow rating-media-list-carousel-arrow--prev rating-media-list-carousel-arrow--hint rating-media-list-carousel-arrow--hidden"
                                                                             role="button" tabindex="0"
                                                                             style="opacity: 1; visibility: hidden; transform: translateX(calc(-50% + 0px));">
                                                                            <svg enable-background="new 0 0 13 20"
                                                                                 viewBox="0 0 13 20" x="0" y="0"
                                                                                 class="shopee-svg-icon icon-arrow-left-bold">
                                                                            <polygon
                                                                                points="4.2 10 12.1 2.1 10 -.1 1 8.9 -.1 10 1 11 10 20 12.1 17.9">

                                                                            </polygon>
                                                                            </svg>
                                                                        </div>
                                                                        <div class="rating-media-list-carousel-arrow rating-media-list-carousel-arrow--next rating-media-list-carousel-arrow--hint rating-media-list-carousel-arrow--hidden"
                                                                             role="button" tabindex="0"
                                                                             style="opacity: 1; visibility: hidden; transform: translateX(calc(50% - 0px));">
                                                                            <svg enable-background="new 0 0 13 21"
                                                                                 viewBox="0 0 13 21" x="0" y="0"
                                                                                 class="shopee-svg-icon icon-arrow-right-bold">
                                                                            <polygon
                                                                                points="11.1 9.9 2.1 .9 -.1 3.1 7.9 11 -.1 18.9 2.1 21 11.1 12 12.1 11">

                                                                            </polygon>
                                                                            </svg>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="shopee-product-rating__actions"
                                                             style="justify-content: space-between;">
                                                            <div style="display: flex;">
                                                                <div class="shopee-product-rating__like-button">
                                                                    <svg width="14px" height="13px" viewBox="0 0 14 13"
                                                                         version="1.1" xmlns="http://www.w3.org/2000/svg">
                                                                    <defs>

                                                                    </defs>
                                                                    <g stroke="none" stroke-width="1" fill-rule="evenodd">
                                                                    <g id="Product-Ratings-Working"
                                                                       transform="translate(-245.000000, -855.000000)"
                                                                       fill-rule="nonzero">
                                                                    <g transform="translate(155.000000, 92.000000)">
                                                                    <g
                                                                        transform="translate(40.000000, 184.000000)">
                                                                    <g
                                                                        transform="translate(0.000000, 326.000000)">
                                                                    <g
                                                                        transform="translate(50.000000, 253.000000)">
                                                                    <g>
                                                                    <path
                                                                        d="M0,12.7272727 L2.54545455,12.7272727 L2.54545455,5.09090909 L0,5.09090909 L0,12.7272727 Z M14,5.72727273 C14,5.02727273 13.4272727,4.45454545 12.7272727,4.45454545 L8.71818182,4.45454545 L9.35454545,1.52727273 L9.35454545,1.33636364 C9.35454545,1.08181818 9.22727273,0.827272727 9.1,0.636363636 L8.4,0 L4.2,4.2 C3.94545455,4.39090909 3.81818182,4.70909091 3.81818182,5.09090909 L3.81818182,11.4545455 C3.81818182,12.1545455 4.39090909,12.7272727 5.09090909,12.7272727 L10.8181818,12.7272727 C11.3272727,12.7272727 11.7727273,12.4090909 11.9636364,11.9636364 L13.8727273,7.44545455 C13.9363636,7.31818182 13.9363636,7.12727273 13.9363636,7 L13.9363636,5.72727273 L14,5.72727273 C14,5.79090909 14,5.72727273 14,5.72727273 Z">

                                                                    </path>
                                                                    </g>
                                                                    </g>
                                                                    </g>
                                                                    </g>
                                                                    </g>
                                                                    </g>
                                                                    </g>
                                                                    </svg>
                                                                </div>
                                                                <div class="shopee-product-rating__like-count">
                                                                    hữu ích?</div>
                                                            </div>
                                                            <div style="display: flex;">
                                                                <div class="shopee-product-rating__report-menu-button">
                                                                    <div class="stardust-dropdown">
                                                                        <div class="stardust-dropdown__item-header">
                                                                            <div>
                                                                                <svg width="4px" height="16px"
                                                                                     viewBox="0 0 4 16" version="1.1"
                                                                                     xmlns="http://www.w3.org/2000/svg">
                                                                                <defs>

                                                                                </defs>
                                                                                <g stroke="none" stroke-width="1"
                                                                                   fill-rule="evenodd">
                                                                                <g transform="translate(-1301.000000, -550.000000)"
                                                                                   fill="#CCCCCC">
                                                                                <g
                                                                                    transform="translate(155.000000, 92.000000)">
                                                                                <g
                                                                                    transform="translate(40.000000, 184.000000)">
                                                                                <g
                                                                                    transform="translate(0.000000, 161.000000)">
                                                                                <g>
                                                                                <g
                                                                                    transform="translate(50.000000, 2.000000)">
                                                                                <path
                                                                                    d="M1058,122.2 C1056.895,122.2 1056,123.096 1056,124.2 C1056,125.306 1056.895,126.202 1058,126.202 C1059.104,126.202 1060,125.306 1060,124.2 C1060,123.096 1059.104,122.2 1058,122.2 M1058,116.6 C1056.895,116.6 1056,117.496 1056,118.6 C1056,119.706 1056.895,120.602 1058,120.602 C1059.104,120.602 1060,119.706 1060,118.6 C1060,117.496 1059.104,116.6 1058,116.6 M1058,111 C1056.895,111 1056,111.896 1056,113 C1056,114.106 1056.895,115.002 1058,115.002 C1059.104,115.002 1060,114.106 1060,113 C1060,111.896 1059.104,111 1058,111">

                                                                                </path>
                                                                                </g>
                                                                                </g>
                                                                                </g>
                                                                                </g>
                                                                                </g>
                                                                                </g>
                                                                                </g>
                                                                                </svg>
                                                                            </div>
                                                                        </div>
                                                                        <div class="stardust-dropdown__item-body">
                                                                            <div
                                                                                class="shopee-product-rating__report-menu-dropdown">
                                                                                báo cáo</div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                            </div>

                                        </div>


                                    </div>

                                </div>

                            </form>
                        </div>
                    </div>

                </div>

            </div>

        </div>


    </div>
    <!--modal layout-->

</body>

</html>