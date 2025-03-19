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
    <link rel="stylesheet" href="./asserts/css/main.css">
    <link rel="stylesheet" href="./asserts/css/profile.css">
    <link rel="stylesheet" href="./asserts/css/product.css">
    <link rel="stylesheet" href="./asserts/css/order__detail.css">
    <link rel="stylesheet" href="./asserts/css/order.css">
    <link rel="stylesheet" href="./asserts/css/profile.css">
    <link rel="stylesheet" href="./asserts/css/buy.css">
    <link rel="stylesheet" href="./asserts/fonts/fontawesome-free-6.0.0/css/all.min.css">
</head>

<body>
    <script src="./asserts/js/form.js"></script>
    <!-- Block Element Modifier -->
    <div class="app">
        <header class="header ">
            <div class="grid">
                <nav class="header__navbar">
                    <ul class="header__navbar-list">
                        <li class="header__navbar-item header__navbar-item--has-qr header__navbar-item--separate">
                            Vào cửa hàng Dung Bui shop
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
                            <span class="header__navbar-title--no-pointer" style="color: var(--while-color);">Kết nối</span>
                            <a href="" class="header__navbar-icon-link" style="color: var(--while-color);">
                                <i class="header__navbar-icon fa-brands fa-facebook " ></i>
                                <i class="header__navbar-icon fa-brands fa-instagram" ></i>
                            </a>
                        </li>
                    </ul>
                    <ul class="header__navbar-list">
                        <li class="header__navbar-item header__navbar-item--has-notify">
                            <a href="" class="header__navbar-item-link" style="color: var(--while-color); text-decoration: none;"><i
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
                            <a href="" class="header__navbar-item-link" style="color: var(--while-color); text-decoration: none;"><i
                                    class="header__navbar-icon fa-solid fa-circle-question"></i>
                                Trợ giúp</a>
                        </li>
                        <!--LOGED-->
                        <li class="header__navbar-item header__navbar-user">
                            <img src="
                            https://w7.pngwing.com/pngs/340/956/png-transparent-profile-user-icon-computer-icons-user-profile-head-ico-miscellaneous-black-desktop-wallpaper-thumbnail.png"
                                alt="" class="header__navbar-user-img">
                            <span class="header__navbar-user-name">Dũng Bùi</span>
                            <ul class="header__navbar-user-menu">
                                <li class="header__navbar-user-item">
                                    <a href="">Tài khoản của tôi</a>
                                </li>
                                <li class="header__navbar-user-item">
                                    <a href="">Địa chỉ của tôi</a>
                                </li>
                                <li class="header__navbar-user-item">
                                    <a href="">Đơn mua </a>
                                </li>

                                <li class="header__navbar-user-item">
                                    <a href="">Đăng xuất</a>
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
                            <span class="header__cart-notice">3</span>
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
                                <div class="auth-form__cart-btn">
                                    <button class="btn btn--primary btn--primary--viewcart">Xem giỏ hàng</button>
                                </div>

                            </div>
                        </div>

                    </div>



                </nav>
            </div>
        </header>
        <div class="app__container">
            <div class="grid">
                <div class="grid__row">
                    
<!--                   <form method="post" action="buy" id="order-product">-->
                   <form method="post" action="checkout" id="order-product">
                    <!-- /* Home sort+filter  */ -->
                    <div class="grid__column-10 " style="margin-bottom:20px">
                        <div class="orderdetail--navbar">
                            <div class="orderdetail--navbar orderdetail--navbar--content">
                                <div class="orderdetail--navbar--content orderdetail--navbar--item" onclick="window.location.href='cart.jsp'" style="cursor: pointer">
                                    <svg enable-background="new 0 0 11 11" viewBox="0 0 11 11" x="0" y="0"
                                        class="shopee-svg-icon icon-arrow-left">
                                        <g>
                                            <path
                                                d="m8.5 11c-.1 0-.2 0-.3-.1l-6-5c-.1-.1-.2-.3-.2-.4s.1-.3.2-.4l6-5c .2-.2.5-.1.7.1s.1.5-.1.7l-5.5 4.6 5.5 4.6c.2.2.2.5.1.7-.1.1-.3.2-.4.2z">
                                            </path>
                                        </g>
                                    </svg>
                                    <span >TRỞ LẠI</span>
                                </div>
                                <div>
                                    <span>ID ĐƠN HÀNG. 2203030ESASGE3</span><span
                                        class="orderdetail--navbar--item orderdetail--navbar--item__ID">|</span>
                                    <span class="orderdetail--navbar--item orderdetail--navbar--item__Status">Đơn hàng
                                        đang được xác nhận</span>
                                </div>
                            </div>
                        </div>
                        <!--Status-->
                        <div class="_2NJbNc">
                            <div class="stepper">
                                <div class="stepper__step stepper__step--finish">
                                    <div class="stepper__step-icon stepper__step-icon--finish">
                                        <svg enable-background="new 0 0 32 32" viewBox="0 0 32 32" x="0" y="0"
                                            class="shopee-svg-icon icon-order-order">
                                            <g>
                                                <path
                                                    d="m5 3.4v23.7c0 .4.3.7.7.7.2 0 .3 0 .3-.2.5-.4 1-.5 1.7-.5.9 0 1.7.4 2.2 1.1.2.2.3.4.5.4s.3-.2.5-.4c.5-.7 1.4-1.1 2.2-1.1s1.7.4 2.2 1.1c.2.2.3.4.5.4s.3-.2.5-.4c.5-.7 1.4-1.1 2.2-1.1.9 0 1.7.4 2.2 1.1.2.2.3.4.5.4s.3-.2.5-.4c.5-.7 1.4-1.1 2.2-1.1.7 0 1.2.2 1.7.5.2.2.3.2.3.2.3 0 .7-.4.7-.7v-23.7z"
                                                    fill="none" stroke-linecap="round" stroke-linejoin="round"
                                                    stroke-miterlimit="10" stroke-width="3"></path>
                                                <g>
                                                    <line fill="none" stroke-linecap="round" stroke-miterlimit="10"
                                                        stroke-width="3" x1="10" x2="22" y1="11.5" y2="11.5"></line>
                                                    <line fill="none" stroke-linecap="round" stroke-miterlimit="10"
                                                        stroke-width="3" x1="10" x2="22" y1="18.5" y2="18.5"></line>
                                                </g>
                                            </g>
                                        </svg>
                                    </div>
                                    <div class="stepper__step-text">Thời gian đặt</div>
                                    <div class="stepper__step-date">${date}
                                        <input type="text" name="orderdate" style="display: none"> 
                                    </div>
                                </div>
                                <div class="stepper__step stepper__step--finish">
                                    <div class="stepper__step-icon stepper__step-icon--finish">
                                        <svg enable-background="new 0 0 32 32" viewBox="0 0 32 32" x="0" y="0"
                                            class="shopee-svg-icon icon-order-problem">
                                            <g>
                                                <g>
                                                    <path
                                                        d="m5 3.4v23.7c0 .4.3.7.7.7.2 0 .3 0 .3-.2.5-.4 1-.5 1.7-.5.9 0 1.7.4 2.2 1.1.2.2.3.4.5.4s.3-.2.5-.4c.5-.7 1.4-1.1 2.2-1.1s1.7.4 2.2 1.1c.2.2.3.4.5.4s.3-.2.5-.4c.5-.7 1.4-1.1 2.2-1.1.9 0 1.7.4 2.2 1.1.2.2.3.4.5.4s.3-.2.5-.4c.5-.7 1.4-1.1 2.2-1.1.7 0 1.2.2 1.7.5.2.2.3.2.3.2.3 0 .7-.4.7-.7v-23.7z"
                                                        fill="none" stroke-linecap="round" stroke-linejoin="round"
                                                        stroke-miterlimit="10" stroke-width="3"></path>
                                                </g>
                                                <line fill="none" stroke-linecap="round" stroke-linejoin="round"
                                                    stroke-miterlimit="10" stroke-width="3" x1="16" x2="16" y1="9"
                                                    y2="15"></line>
                                                <circle cx="16" cy="20.5" r="2" stroke="none"></circle>
                                            </g>
                                        </svg>
                                    </div>
                                    <div class="stepper__step-text">Đang xác nhận</div>
                                    <div class="stepper__step-date"></div>
                                </div>
                                <div class="stepper__line">
                                    <div class="stepper__line-background" style="background: rgb(224, 224, 224);">
                                    </div>
                                    <div class="stepper__line-foreground"
                                        style="width: calc((100% - 140px) * 1); background: rgb(45, 194, 88);">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="_1umrlw">
                            <div class="_2c2kYQ"></div>
                            <div class="_2iv7q8">
                                <button class="stardust-button stardust-button--primary _2x5SvJ">Mua sau</button>
                            </div>
                        </div>
                        <div class="_1umrlw">
                            <div class="_2c2kYQ">
                            </div>
                            <div class="_2iv7q8">
                                <button class="stardust-button stardust-button--secondary _2x5SvJ">Liên hệ Người
                                    bán</button>
                            </div>
                        </div>
                        <div class="order__detail-information">
                            <div class="j7z7l_">
                                <div class="_1AsWWl"></div>
                            </div>
                            <div class="u-QNyq">
                                <div class="_2WaK8H">
                                    <div class="fE5sHM">Địa chỉ nhận hàng</div>
                                    <div class="_4KkgUa">
                                        <div>
                                            <div>Thông tin vận chuyển</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="_2wWOHm">
                                    <div class="_2jj5D3">
                                        <div class="_2_z46i">
                                            Tên: <input type="text" name="name" placeholder="${requestScope.cus.name}">
                                        </div>
                                        <div class="_1J2b7X">
                                            Số điện thoại:<input type="text" name="phone" value="${requestScope.cus.phone}" placeholder="${requestScope.cus.phone}"><br>
                                            Thành phố:<input type="text" name="shipcity" value="${requestScope.cus.city}" placeholder="${requestScope.cus.city}"/>
                                            <br>Địa chỉ <input type="text" name="shipaddress" value="${requestScope.cus.address}" placeholder="${requestScope.cus.address} "/>
                                            
                                        </div>
                                    </div>
                                    <div class="_3lh_J3">
                                        <div>
                                            <div class="_38-lLD">
                                                <select name="Shippervia" id="mySelect" onchange="ShipFunction()">
                                                    <c:forEach items="${requestScope.ship}" var="i">
                                                        <option value="${i.id}">${i.name}</option>>
                                                    </c:forEach>
                                                </select>
                                                    <p id="sname"></p>
                                                    <p id="sphone"></p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                           <!--Item-->
                           <c:set value="${0}" var="n"/>
                           <c:set value="${0}" var="i" />
                           <c:set value="${requestScope.t}" var="t" />
                           <ul class="home-product home-product-list " style="padding: 0;" >
                         <c:forEach items="${requestScope.list}" var="shop">
                            <li class="home-product-item" style="margin:0">
                                <div class="grid__column-12 main-product">
                                    <!--Heading-->
                              <div class="order-item oder-item-heading" style="padding-left: 36px;">
                                  <div class="order-item order-item__action">
                                      <svg class="order-item__action order-item__action-svg"
                                          xmlns="http://www.w3.org/2000/svg" width="62" height="16" fill="none">
                                          <path fill="#EE4D2D" fill-rule="evenodd"
                                              d="M0 2C0 .9.9 0 2 0h58a2 2 0 012 2v12a2 2 0 01-2 2H2a2 2 0 01-2-2V2z"
                                              clip-rule="evenodd"></path>
                                          <g clip-path="url(#clip0)">
                                              <path fill="#fff"
                                                  d="M8.7 13H7V8.7L5.6 6.3A828.9 828.9 0 004 4h2l2 3.3a1197.3 1197.3 0 002-3.3h1.6L8.7 8.7V13zm7.9-1.7h1.7c0 .3-.2.6-.5 1-.2.3-.5.5-1 .7l-.6.2h-.8c-.5 0-1 0-1.5-.2l-1-.8a4 4 0 01-.9-2.4c0-1 .3-1.9 1-2.6a3 3 0 012.4-1l.8.1a2.8 2.8 0 011.3.7l.4.6.3.8V10h-4.6l.2 1 .4.7.6.5.7.1c.4 0 .7 0 .9-.2l.2-.6v-.1zm0-2.3l-.1-1-.3-.3c0-.2-.1-.2-.2-.3l-.8-.2c-.3 0-.6.2-.9.5l-.3.5a4 4 0 00-.3.8h3zm-1.4-4.2l-.7.7h-1.4l1.5-2h1.1l1.5 2h-1.4l-.6-.7zm8.1 1.6H25V13h-1.7v-.5.1H23l-.7.5-.9.1-1-.1-.7-.4c-.3-.2-.4-.5-.6-.8l-.2-1.3V6.4h1.7v3.7c0 1 0 1.6.3 1.7.2.2.5.3.7.3h.4l.4-.2.3-.3.3-.5.2-1.4V6.4zM34.7 13a11.2 11.2 0 01-1.5.2 3.4 3.4 0 01-1.3-.2 2 2 0 01-.5-.3l-.3-.5-.2-.6V7.4h-1.2v-1h1.1V5h1.7v1.5h1.9v1h-2v3l.2 1.2.1.3.2.2h.3l.2.1c.2 0 .6 0 1.3-.3v1zm2.4 0h-1.7V3.5h1.7v3.4a3.7 3.7 0 01.2-.1 2.8 2.8 0 013.4 0l.4.4.2.7V13h-1.6V9.3 8.1l-.4-.6-.6-.2a1 1 0 00-.4.1 2 2 0 00-.4.2l-.3.3a3 3 0 00-.3.5l-.1.5-.1.9V13zm5.4-6.6H44V13h-1.6V6.4zm-.8-.9l1.8-2h1.8l-2.1 2h-1.5zm7.7 5.8H51v.5l-.4.5a2 2 0 01-.4.4l-.6.3-1.4.2c-.5 0-1 0-1.4-.2l-1-.7c-.3-.3-.5-.7-.6-1.2-.2-.4-.3-.9-.3-1.4 0-.5.1-1 .3-1.4a2.6 2.6 0 011.6-1.8c.4-.2.9-.3 1.4-.3.6 0 1 .1 1.5.3.4.1.7.4 1 .6l.2.5.1.5h-1.6c0-.3-.1-.5-.3-.6-.2-.2-.4-.3-.8-.3s-.8.2-1.2.6c-.3.4-.4 1-.4 2 0 .9.1 1.5.4 1.8.4.4.8.6 1.2.6h.5l.3-.2.2-.3v-.4zm4 1.7h-1.6V3.5h1.7v3.4a3.7 3.7 0 01.2-.1 2.8 2.8 0 013.4 0l.3.4.3.7V13h-1.6V9.3L56 8.1c-.1-.3-.2-.5-.4-.6l-.6-.2a1 1 0 00-.3.1 2 2 0 00-.4.2l-.3.3a3 3 0 00-.3.5l-.2.5V13z">
                                              </path>
                                          </g>
                                          <defs>
                                              <clipPath id="clip0">
                                                  <path fill="#fff" d="M0 0h55v16H0z" transform="translate(4)">
                                                  </path>
                                              </clipPath>
                                          </defs>
                                      </svg>
                                      <div class="order-item order-item__action order-item__name">${shop.name}</div>
                                      <div class="order-item order-item__action  order-item__action--chat">
                                          <button class="stardust-button stardust-button--primary">
                                              <svg viewBox="0 0 17 17" class="shopee-svg-icon icon-btn-chat"
                                                  style="fill: white;">
                                                  <g fill-rule="evenodd">
                                                      <path
                                                          d="M13.89 0C14.504 0 15 .512 15 1.144l-.003.088-.159 2.117.162.001c.79 0 1.46.558 1.618 1.346l.024.15.008.154v9.932a1.15 1.15 0 01-1.779.963l-.107-.08-1.882-1.567-7.962.002a1.653 1.653 0 01-1.587-1.21l-.036-.148-.021-.155-.071-.836h-.01L.91 13.868a.547.547 0 01-.26.124L.556 14a.56.56 0 01-.546-.47L0 13.429V1.144C0 .512.497 0 1.11 0h12.78zM15 4.65l-.259-.001-.461 6.197c-.045.596-.527 1.057-1.106 1.057L4.509 11.9l.058.69.01.08a.35.35 0 00.273.272l.07.007 8.434-.001 1.995 1.662.002-9.574-.003-.079a.35.35 0 00-.274-.3L15 4.65zM13.688 1.3H1.3v10.516l1.413-1.214h10.281l.694-9.302zM4.234 5.234a.8.8 0 011.042-.077l.187.164c.141.111.327.208.552.286.382.131.795.193 1.185.193s.803-.062 1.185-.193c.225-.078.41-.175.552-.286l.187-.164a.8.8 0 011.042 1.209c-.33.33-.753.579-1.26.753A5.211 5.211 0 017.2 7.4a5.211 5.211 0 01-1.706-.28c-.507-.175-.93-.424-1.26-.754a.8.8 0 010-1.132z"
                                                          fill-rule="nonzero">
                                                      </path>
                                                  </g>
                                              </svg>
                                              <span>chat</span>
                                          </button>
                                      </div>
                                      <a class="order-item order-item__action  order-item__action--viewshop">
                                          <button class="stardust-button">
                                              <svg enable-background="new 0 0 15 15" viewBox="0 0 15 15" x="0"
                                                  y="0" class="shopee-svg-icon icon-btn-shop">
                                                  <path
                                                      d="m15 4.8c-.1-1-.8-2-1.6-2.9-.4-.3-.7-.5-1-.8-.1-.1-.7-.5-.7-.5h-8.5s-1.4 1.4-1.6 1.6c-.4.4-.8 1-1.1 1.4-.1.4-.4.8-.4 1.1-.3 1.4 0 2.3.6 3.3l.3.3v3.5c0 1.5 1.1 2.6 2.6 2.6h8c1.5 0 2.5-1.1 2.5-2.6v-3.7c.1-.1.1-.3.3-.3.4-.8.7-1.7.6-3zm-3 7c0 .4-.1.5-.4.5h-8c-.3 0-.5-.1-.5-.5v-3.1c.3 0 .5-.1.8-.4.1 0 .3-.1.3-.1.4.4 1 .7 1.5.7.7 0 1.2-.1 1.6-.5.5.3 1.1.4 1.6.4.7 0 1.2-.3 1.8-.7.1.1.3.3.5.4.3.1.5.3.8.3zm.5-5.2c0 .1-.4.7-.3.5l-.1.1c-.1 0-.3 0-.4-.1s-.3-.3-.5-.5l-.5-1.1-.5 1.1c-.4.4-.8.7-1.4.7-.5 0-.7 0-1-.5l-.6-1.1-.5 1.1c-.3.5-.6.6-1.1.6-.3 0-.6-.2-.9-.8l-.5-1-.7 1c-.1.3-.3.4-.4.6-.1 0-.3.1-.3.1s-.4-.4-.4-.5c-.4-.5-.5-.9-.4-1.5 0-.1.1-.4.3-.5.3-.5.4-.8.8-1.2.7-.8.8-1 1-1h7s .3.1.8.7c.5.5 1.1 1.2 1.1 1.8-.1.7-.2 1.2-.5 1.5z">
                                                  </path>
                                              </svg>
                                              <span>xem shop</span>
                                          </button>
                                      </a>
                                  </div>
                              </div>
                                      <!--Body-->
                                      <ul>
                                          <c:forEach items="${sessionScope.cart.items}" var="p"> 
                                              <c:if test="${(p.product.shops.username).equalsIgnoreCase(shop.username)}">
                                                 <li>
                                      <div class="order-item-body" style="padding-left: 36px;">
                                          <div class="order-item order-item__product">
                                              <div class="order-item order-item__product-image"
                                                   style="background-image: url(${p.product.images1});">
                                              </div>
                                              <div class="order-item order-item__product-content">
                                                  <div>
                                                      <div class="order-item order-item__product-content order-item__product-content--name">
                                                          <span class="_30COVM">
                                                              ${p.product.productname}
                                                              <input type="text" name="pid" value="${p.product.id}" style="display: none"/>
                                                          </span>
                                                      </div>
                                                  </div>
                                                  <div class="order-item order-item__product-content order-item__product-content--attributes">
                                                      <div class="order-item__product-content--attributes order-item__product-content--type" style="height: 100%">
                                                          <div class="order-product-item order-product-type" style="margin-right: 139px;">Phân loại hàng: ${p.product.categories.name}</div>
                                                              <div class="order-product-item order-product-price">
                                                                  <div class="order-product-item__oldprice" >${p.product.oldPrice}đ</div>
                                                                  <div class="order-item__product-content--price">${p.product.currentPrice}</div>
                                                              </div>
                                                      </div>
                                                              <div class="order-item__product-content--attributes order-item__product-content--unit">
                                                                  X${p.quantity}
                                                                  <input clas="input-quantity" type="text" value="${p.quantity}" name="quantity"style="display: none">
                                                              </div>
                                                  </div>
                                              </div>
                                          </div>
                                      </div>
                                        </li>
                                             </c:if>
                                         </c:forEach>
                                      </ul> 
                                      <!--Bill-->
                                      <div class="_1l8TCL orderdetail-item-bill">
                                          <div class="_1FDuJg">
                                              <div class="_1bq31i"><span>Tổng tiền hàng</span></div>
                                              <div class="_2aXD4G">
                                                  <div>₫${t[i]}
                                                  </div>
                                                </div>
                                            </div>
                                            <div class="_1FDuJg">
                                                <div class="_1bq31i"><span>Phí vận chuyển</span></div>
                                                <div class="_2aXD4G">
                                                    <div>₫${requestScope.freight}</div>
                                                    <input type="text" name="freight" value="${requestScope.freight}" readonly style="display: none"/>
                                                </div>
                                            </div>
                                                <div class="_1FDuJg">
                                                    <div class="_1bq31i">
                                                        <span>Giảm giá phí vận chuyển </span>
                                                        <div class="stardust-popover _14Pkgq" id="stardust-popover5" tabindex="0">
                                                            <div role="button" class="stardust-popover__target">
                                                                <div>
                                                                    <svg width="16" height="16" fill="none" xmlns="http://www.w3.org/2000/svg"><path clip-rule="evenodd" d="M8 15A7 7 0 108 1a7 7 0 000 14z" stroke="#000" stroke-opacity=".54"></path><path fill-rule="evenodd" clip-rule="evenodd" d="M8 6a1 1 0 100-2 1 1 0 000 2zM7.25 7.932v3.636c0 .377.336.682.75.682s.75-.305.75-.682V7.932c0-.377-.336-.682-.75-.682s-.75.305-.75.682z" fill="#000" fill-opacity=".54"></path>
                                                                    </svg>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="_2aXD4G">
                                                        <div>-₫10.000</div>
                                                    </div></div>
                                                    <div class="_1FDuJg">
                                                        <div class="_1bq31i">
                                                            <span>Voucher từ Shopee</span>
                                                        </div>
                                                        <div class="_2aXD4G">
                                                            <div>-₫${requestScope.discount}</div>
                                                            <input style="display: none" value="${requestScope.discount}"  name="discount" readonly/>
                                                        </div>
                                                    </div>
                                                    <div class="_1FDuJg _3WktZ1">
                                                        <div class="_1bq31i _3zO_LL">
                                                            <span>Tổng số tiền</span>
                                                        </div>
                                                        <div class="_2aXD4G">
                                                            <div class="_1gMI9H">₫ ${(t[i])+requestScope.freight-10000-requestScope.discount}
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                                <c:set value="${i+1}" var="i" />
                                </li>
                               </c:forEach>
                               </ul>
                           <c:set value="${requestScope.k} " var="n"/>
                        <div class="_2iv7q8 total-order">
                            <div class="_1bq31i">
                                <span  class="total-item" style="margin-bottom: 5px">Tổng tiền hàng</span>
                                <div class="_1gMI9H">
                                    <span  style="margin-bottom: 20px" class="total-item">₫${requestScope.total+n*(requestScope.freight-10000-requestScope.discount)}</span>
                                    <input type="hidden" name="total" value="${requestScope.total+n*(requestScope.freight-10000-requestScope.discount)}">
                                </div>
                            </div>
                                
                            <button class="stardust-button stardust-button--primary _2x5SvJ" onclick="document.getElementById('order-product').submit();" >Đặt Hàng</button>
                        </div>
                    </div>
                   </form>
                </div>
            </div>
        </div>
    </div>
    </div>
    </div>
</body>
</html>