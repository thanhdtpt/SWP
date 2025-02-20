<!DOCTYPE html>
<html lang="en">
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@page contentType="text/html" pageEncoding="UTF-8"%>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Giỏ hàng</title>


        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css">
        <link rel="stylesheet" href="./asserts/css/base.css">
        <link rel="stylesheet" href="./asserts/css/main.css">
        <link rel="stylesheet" href="./asserts/css/profile.css">
        <link rel="stylesheet" href="./asserts/css/order.css">
        <link rel="stylesheet" href="./asserts/css/cart.css">
        <link rel="stylesheet" href="./asserts/css/checkbox.css">
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
                                Vào cửa hàng shop
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
                                <a style="color:var(--white-color); text-decoration:none;" href="" class="header__navbar-icon-link">
                                    <i class="header__navbar-icon fa-brands fa-facebook"></i>
                                    <i class="header__navbar-icon fa-brands fa-instagram"></i>
                                </a>
                            </li>
                        </ul>
                        <ul class="header__navbar-list">
                            <li class="header__navbar-item header__navbar-item--has-notify">
                                <a style="color:var(--white-color); text-decoration:none;" href="" class="header__navbar-item-link"><i
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
                                <a style="color:var(--white-color); text-decoration:none;" href="" class="header__navbar-item-link"><i
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
                                <c:if test="${sessionScope.cart==null}">
                                    <span class="header__cart-notice">0</span>
                                </c:if>
                                <c:if test="${sessionScope.cart!=null}">
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
                                        <button class="btn btn--primary btn--primary--viewcart" onclick="window.location.href = 'cart.jsp'">Xem giỏ hàng</button>
                                    </div>

                                </div>
                            </div>

                        </div>



                    </nav>
                </div>

            </header>
            <div class="app__container">
                <div class="grid">
                    <div class="grid__row " style="font-size: 1.4rem;">
                        <div class="grid__column-2">

                        </div>
                        <!-- /* Home sort+filter  */ -->
                        <div class="grid__column-10 " style="margin-bottom:100px">
                            <div class="home-product">
                                <div class="grid__row">
                                    <!--Product-->

                                    <!-- navbart cart-->
                                    <div class="_1uP-hs">
                                        <svg height="12" viewBox="0 0 20 12" width="20"
                                             class="shopee-svg-icon _140gEP icon-free-shipping">
                                        <g fill="none" fill-rule="evenodd" transform="">
                                        <rect fill="#00bfa5" fill-rule="evenodd" height="9" rx="1" width="12" x="4">
                                        </rect>
                                        <rect height="8" rx="1" stroke="#00bfa5" width="11" x="4.5" y=".5"></rect>
                                        <rect fill="#00bfa5" fill-rule="evenodd" height="7" rx="1" width="7" x="13"
                                              y="2"></rect>
                                        <rect height="6" rx="1" stroke="#00bfa5" width="6" x="13.5" y="2.5"></rect>
                                        <circle cx="8" cy="10" fill="#00bfa5" r="2"></circle>
                                        <circle cx="15" cy="10" fill="#00bfa5" r="2"></circle>
                                        <path
                                            d="m6.7082481 6.7999878h-.7082481v-4.2275391h2.8488017v.5976563h-2.1405536v1.2978515h1.9603297v.5800782h-1.9603297zm2.6762505 0v-3.1904297h.6544972v.4892578h.0505892c.0980164-.3134765.4774351-.5419922.9264138-.5419922.0980165 0 .2276512.0087891.3003731.0263672v.6210938c-.053751-.0175782-.2624312-.038086-.3762568-.038086-.5122152 0-.8758247.3017578-.8758247.75v1.8837891zm3.608988-2.7158203c-.5027297 0-.8536919.328125-.8916338.8261719h1.7390022c-.0158092-.5009766-.3446386-.8261719-.8473684-.8261719zm.8442065 1.8544922h.6544972c-.1549293.571289-.7050863.9228515-1.49238.9228515-.9864885 0-1.5903965-.6269531-1.5903965-1.6464843 0-1.0195313.6165553-1.6669922 1.5872347-1.6669922.9580321 0 1.5366455.6064453 1.5366455 1.6083984v.2197266h-2.4314412v.0351562c.0221328.5595703.373095.9140625.9169284.9140625.4110369 0 .6924391-.1376953.8189119-.3867187zm2.6224996-1.8544922c-.5027297 0-.853692.328125-.8916339.8261719h1.7390022c-.0158091-.5009766-.3446386-.8261719-.8473683-.8261719zm.8442064 1.8544922h.6544972c-.1549293.571289-.7050863.9228515-1.49238.9228515-.9864885 0-1.5903965-.6269531-1.5903965-1.6464843 0-1.0195313.6165553-1.6669922 1.5872347-1.6669922.9580321 0 1.5366455.6064453 1.5366455 1.6083984v.2197266h-2.4314412v.0351562c.0221328.5595703.373095.9140625.9169284.9140625.4110369 0 .6924391-.1376953.8189119-.3867187z"
                                            fill="#fff"></path>
                                        <path d="m .5 8.5h3.5v1h-3.5z" fill="#00bfa5"></path>
                                        <path d="m0 10.15674h3.5v1h-3.5z" fill="#00bfa5"></path>
                                        <circle cx="8" cy="10" fill="#047565" r="1"></circle>
                                        <circle cx="15" cy="10" fill="#047565" r="1"></circle>
                                        </g>
                                        </svg>
                                        <span class="_1UxmZa">Nhấn vào mục Mã giảm giá ở cuối trang để hưởng miễn phí vận
                                            chuyển bạn nhé!</span>
                                    </div>

                                    <div class="_2eZQze">
                                        <div class="_35gBGg">
                                            <label class="stardust-checkbox">
                                                <input class="stardust-checkbox__input" type="checkbox">
                                                <div class="stardust-checkbox__box">
                                                </div>
                                            </label>
                                        </div>
                                        <div class="_2cHnzN">Sản phẩm

                                        </div>
                                        <div class="_2UJcxH">Đơn giá

                                        </div>
                                        <div class="_1SKeIp">Số lượng

                                        </div>
                                        <div class="_2LUhSC">Số tiền

                                        </div>
                                        <div class="HHdkhO">Thao tác
                                        </div>
                                    </div>

                                    <!--Item-->
                                    <c:set var="o" value="${sessionScope.cart}"/>
                                    <c:forEach items="${o.items}" var="i">
                                        <ul class="list__shop">
                                            <li class="st__shop list___shop--item">
                                                <div class="_1K9yK1 shop__item">
                                                    <!--Shop name-->
                                                    <div class="wijCjS shop__item--name">
                                                        <div class="_17ffUV">
                                                            <div class="_3o7bbN">
                                                                <div class="toggle-container">
                                                                    <input type="checkbox" id="all-checkbox" class="toggle" >
                                                                    <label for="all-checkbox" class="label">
                                                                    </label>
                                                                </div>
                                                            </div>
                                                            <!--Shop item-->
                                                            <a class="_7HTERg"
                                                               href="/denledhoangyen?categoryId=100636&amp;entryPoint=cart&amp;itemId=3006939972">
                                                                <div class="_1SpqQV">
                                                                    <svg xmlns="http://www.w3.org/2000/svg" width="62" height="16"
                                                                         fill="none">
                                                                    <path fill="#EE4D2D" fill-rule="evenodd"
                                                                          d="M0 2C0 .9.9 0 2 0h58a2 2 0 012 2v12a2 2 0 01-2 2H2a2 2 0 01-2-2V2z"
                                                                          clip-rule="evenodd">

                                                                    </path>
                                                                    <g clip-path="url(#clip0)">
                                                                    <path fill="#fff"
                                                                          d="M8.7 13H7V8.7L5.6 6.3A828.9 828.9 0 004 4h2l2 3.3a1197.3 1197.3 0 002-3.3h1.6L8.7 8.7V13zm7.9-1.7h1.7c0 .3-.2.6-.5 1-.2.3-.5.5-1 .7l-.6.2h-.8c-.5 0-1 0-1.5-.2l-1-.8a4 4 0 01-.9-2.4c0-1 .3-1.9 1-2.6a3 3 0 012.4-1l.8.1a2.8 2.8 0 011.3.7l.4.6.3.8V10h-4.6l.2 1 .4.7.6.5.7.1c.4 0 .7 0 .9-.2l.2-.6v-.1zm0-2.3l-.1-1-.3-.3c0-.2-.1-.2-.2-.3l-.8-.2c-.3 0-.6.2-.9.5l-.3.5a4 4 0 00-.3.8h3zm-1.4-4.2l-.7.7h-1.4l1.5-2h1.1l1.5 2h-1.4l-.6-.7zm8.1 1.6H25V13h-1.7v-.5.1H23l-.7.5-.9.1-1-.1-.7-.4c-.3-.2-.4-.5-.6-.8l-.2-1.3V6.4h1.7v3.7c0 1 0 1.6.3 1.7.2.2.5.3.7.3h.4l.4-.2.3-.3.3-.5.2-1.4V6.4zM34.7 13a11.2 11.2 0 01-1.5.2 3.4 3.4 0 01-1.3-.2 2 2 0 01-.5-.3l-.3-.5-.2-.6V7.4h-1.2v-1h1.1V5h1.7v1.5h1.9v1h-2v3l.2 1.2.1.3.2.2h.3l.2.1c.2 0 .6 0 1.3-.3v1zm2.4 0h-1.7V3.5h1.7v3.4a3.7 3.7 0 01.2-.1 2.8 2.8 0 013.4 0l.4.4.2.7V13h-1.6V9.3 8.1l-.4-.6-.6-.2a1 1 0 00-.4.1 2 2 0 00-.4.2l-.3.3a3 3 0 00-.3.5l-.1.5-.1.9V13zm5.4-6.6H44V13h-1.6V6.4zm-.8-.9l1.8-2h1.8l-2.1 2h-1.5zm7.7 5.8H51v.5l-.4.5a2 2 0 01-.4.4l-.6.3-1.4.2c-.5 0-1 0-1.4-.2l-1-.7c-.3-.3-.5-.7-.6-1.2-.2-.4-.3-.9-.3-1.4 0-.5.1-1 .3-1.4a2.6 2.6 0 011.6-1.8c.4-.2.9-.3 1.4-.3.6 0 1 .1 1.5.3.4.1.7.4 1 .6l.2.5.1.5h-1.6c0-.3-.1-.5-.3-.6-.2-.2-.4-.3-.8-.3s-.8.2-1.2.6c-.3.4-.4 1-.4 2 0 .9.1 1.5.4 1.8.4.4.8.6 1.2.6h.5l.3-.2.2-.3v-.4zm4 1.7h-1.6V3.5h1.7v3.4a3.7 3.7 0 01.2-.1 2.8 2.8 0 013.4 0l.3.4.3.7V13h-1.6V9.3L56 8.1c-.1-.3-.2-.5-.4-.6l-.6-.2a1 1 0 00-.3.1 2 2 0 00-.4.2l-.3.3a3 3 0 00-.3.5l-.2.5V13z">

                                                                    </path>
                                                                    </g>
                                                                    <defs>
                                                                    <clipPath id="clip0">
                                                                        <path fill="#fff" d="M0 0h55v16H0z"
                                                                              transform="translate(4)">

                                                                        </path>
                                                                    </clipPath>
                                                                    </defs>
                                                                    </svg>
                                                                </div>
                                                                <span style="margin-left: 10px; color: var(--text-color);">
                                                                    ${i.product.shops.name}
                                                                </span>
                                                            </a>
                                                            <button class="_1nS5uS">
                                                                <svg viewBox="0 0 16 16" class="shopee-svg-icon _3v3mkp">
                                                                <g fill-rule="evenodd">
                                                                <path
                                                                    d="M15 4a1 1 0 01.993.883L16 5v9.932a.5.5 0 01-.82.385l-2.061-1.718-8.199.001a1 1 0 01-.98-.8l-.016-.117-.108-1.284 8.058.001a2 2 0 001.976-1.692l.018-.155L14.293 4H15zm-2.48-4a1 1 0 011 1l-.003.077-.646 8.4a1 1 0 01-.997.923l-8.994-.001-2.06 1.718a.5.5 0 01-.233.108l-.087.007a.5.5 0 01-.492-.41L0 11.732V1a1 1 0 011-1h11.52zM3.646 4.246a.5.5 0 000 .708c.305.304.694.526 1.146.682A4.936 4.936 0 006.4 5.9c.464 0 1.02-.062 1.608-.264.452-.156.841-.378 1.146-.682a.5.5 0 10-.708-.708c-.185.186-.445.335-.764.444a4.004 4.004 0 01-2.564 0c-.319-.11-.579-.258-.764-.444a.5.5 0 00-.708 0z">

                                                                </path>
                                                                </g>
                                                                </svg>
                                                            </button>
                                                            <div class="_3txgB0">

                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!--shop__item--product-->
                                                    <ul class="shop__item--list">
                                                        <li class="shop__item--list--element">
                                                            <div class="_1glehh shop__item--product">
                                                                <div class="_1BehlF">
                                                                    <div class="_-0yJ2-">
                                                                        <div class="toggle-container">
                                                                            <input type="checkbox" id="cheap" class="toggle1" >
                                                                            <label for="cheap" class="label">
                                                                            </label>
                                                                        </div>
                                                                        <div class="_1Z2fe1">
                                                                            <div class="_3mceb9">
                                                                                <a title="${i.product.describe}"
                                                                                   href="/-Mã-LIFEXANH03-giảm-10-đơn-500K-LED-DÂY-RGB-7-MÀU-5050-5M-300LED-CUỘN-i.135862971.3006939972">
                                                                                    <div class="_25vezo"
                                                                                         style="background-image: url(&quot;${i.product.images1}&quot;);">
                                                                                    </div>
                                                                                </a>
                                                                                <div class="_1WfuBi">
                                                                                    <a style="color: var(--text-color); font-weight:400; font-size:1.5rem;" class="_3t5Sij"
                                                                                       title="[Mã LIFEXANH03 giảm 10% đơn 500K] LED DÂY RGB 7 MÀU 5050 5M/300LED/CUỘN"
                                                                                       href="/-Mã-LIFEXANH03-giảm-10-đơn-500K-LED-DÂY-RGB-7-MÀU-5050-5M-300LED-CUỘN-i.135862971.3006939972">
                                                                                        ${i.product.productname}
                                                                                    </a>
                                                                                    <div class="_21GC7u"
                                                                                         style="background-image: url(&quot;https://cf.shopee.vn/file/05d35f827db98589222baada5355b8df&quot;);">
                                                                                    </div>
                                                                                    <div class="fRkQR_">
                                                                                        <span>

                                                                                        </span>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="_34KJXV">

                                                                        </div>
                                                                        <div class="_1C6zuo">
                                                                            <div>
                                                                                <span class="_1E5-FE">
                                                                                    ₫${i.product.currentPrice}</span>
                                                                            </div>
                                                                        </div>
                                                                        <div class="_2vZsK0">
                                                                            <div class="_1knJ1D shopee-input-quantity">
                                                                                <button class="_2rGMck " id="creament" onclick="window.location.href = 'process?num=-1&id=${i.product.id}'">
                                                                                    <svg enable-background="new 0 0 10 10" viewBox="0 0 10 10"
                                                                                         x="0" y="0" class="shopee-svg-icon">
                                                                                    <polygon
                                                                                        points="4.5 4.5 3.5 4.5 0 4.5 0 5.5 3.5 5.5 4.5 5.5 10 5.5 10 4.5">

                                                                                    </polygon>
                                                                                    </svg>
                                                                                </button>
                                                                                <input class="_2rGMck _8rdz59" type="text" role="spinbutton"
                                                                                       value="${i.quantity}" name="quantity" id="text">
                                                                                <button class="_2rGMck " id="uncreament"  onclick="window.location.href = 'process?num=1&id=${i.product.id}'">
                                                                                    <svg enable-background="new 0 0 10 10" viewBox="0 0 10 10"
                                                                                         x="0" y="0" class="shopee-svg-icon icon-plus-sign">
                                                                                    <polygon
                                                                                        points="10 4.5 5.5 4.5 5.5 0 4.5 0 4.5 4.5 0 4.5 0 5.5 4.5 5.5 4.5 10 5.5 10 5.5 5.5 10 5.5">

                                                                                    </polygon>
                                                                                    </svg>
                                                                                </button>
                                                                            </div>
                                                                        </div>
                                                                        <div class="_2S6DJl">
                                                                            <span id="tienok">
                                                                                ${(i.product.currentPrice)*(i.quantity)}</span>
                                                                        </div>
                                                                        <div class="_1-z5aG _1AeN8q">
                                                                            <form action="process" method="post">
                                                                                <button class="Lur7Ey" type="submit">
                                                                                    Xóa
                                                                                </button>
                                                                                <input type="hidden" value="${i.product.id}"/>
                                                                            </form>   
                                                        
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                        </li>

                                                    </ul>
                                                </div>

                                            </li>
                                        </ul>

                                    </c:forEach>
                                    <div class="_1UHCH_ shop__item--voucher">

                                        <div id="tien" class="ZxTZV3"></div><span style="color: #ee4d2d;">₫</span></div>
                                    <button class="shopee-button" type="submit" >
                                        <span class="_3zK-FN">Mua hàng</span>
                                    </button
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--                           <div class="total-price">
                                                   <button class="shopee-button" type="button" onclick=" window.window.location.href='checkout'">
                                                                 <span class="_3zK-FN">Mua tất cả hàng</span>
                                                    </button
                                               </div>-->
                </div>
            </div>
        </div>
    </div>
</div>

</div>
<!--modal layout-->
<script  src="./asserts/js/handlercheckbox.js" />
</body>

</html>
<script>
                                                                                    let creament = document.getElementById("creament")
                                                                                    let uncreament = document.getElementById("uncreament")
                                                                                    let text = document.getElementById("text")
                                                                                    let click = document.getElementById("click")
                                                                                    let tien = document.getElementById("tien")
                                                                                    let tienok = document.getElementById("tienok")

                                                                                    let count = 1;

                                                                                    uncreament.addEventListener("click", () => {
                                                                                        text.value++;
                                                                                    })

                                                                                    creament.addEventListener("click", () => {


                                                                                        if (text.value > 1) {
                                                                                            text.value--;
                                                                                        }

                                                                                    })

                                                                                    click.addEventListener("change", (e) => {
                                                                                        if (e.target.checked === true) {
                                                                                            tien.innerHTML = parseInt(text.value) * parseInt(tienok.textContent)
                                                                                        }
                                                                                        if (e.target.checked === false) {
                                                                                            tien.innerHTML = '₫0'
                                                                                        }
                                                                                    })


</script>
