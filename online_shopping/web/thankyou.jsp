

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
    <!-- Basic -->

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">

        <!-- Mobile Metas -->
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- Site Metas -->
        <title>Shop</title>
        <meta name="keywords" content="">
        <meta name="description" content="">
        <meta name="author" content="">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css">
        <link rel="stylesheet" href="./asserts/css/base.css">
        <!--<link rel="stylesheet" href="./asserts/css/main.css">-->
        <link rel="stylesheet" href="./asserts/css/main1.css">
        <link rel="stylesheet" href="./asserts/css/footer.css">
        <link rel="stylesheet" href="./asserts/fonts/fontawesome-free-6.0.0/css/all.min.css">
        <!-- Site Icons -->
        <link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">
        <link rel="apple-touch-icon" href="images/apple-touch-icon.png">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <!-- Site CSS -->
        <link rel="stylesheet" href="css/style.css">
        <!-- Responsive CSS -->
        <link rel="stylesheet" href="css/responsive.css">
        <!-- Custom CSS -->
        <link rel="stylesheet" href="css/custom.css">

    </head>
    <body>


 <header class="header">
            <div class="grid">
                <nav class="header__navbar">
                    <ul class="header__navbar-list">
                        <li class="header__navbar-item header__navbar-item--has-qr header__navbar-item--separate" onclick="window.location.href = 'seller-product'" >
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
                            <li class="header__navbar-item  header__navbar-item--strong register-item" >
                                <a href="register.jsp" 
                                   class="header__navbar-item-link header__navbar-item--separate header__navbar-item--strong">Đăng
                                    kí</a>
                            </li>
                            <li class="header__navbar-item header__navbar-item--strong login-item" >
                                <a href="login.jsp" class="header__navbar-item-link header__navbar-item--strong">Đăng nhập</a>
                            </li>
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
                        </c:if>
                    </ul>
                </nav>
                <!-- header with search  -->
                <form action="search" method="get">
                    <nav class="header-with-search">
                        <div class="" onclick="window.location.href = 'home'">
                            <img src="./img/logo.png" width="70" style="
                                 margin-right: 6rem;
                                 ">
                        </div>
                        <c:set var="k" value="${requestScope.key}"/>
                        <div class="header__search">
                            <div class="header__search-input-wrap">
                                <input type="text" class="header__search-input" placeholder="Nhập để tìm kiếm sản phẩm" 
                                       value="${k}" name="key">
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
                            <button class="header__search-btn" onclick="this.form.submit()">
                                <i class="header__search-btn-icon fa-solid fa-magnifying-glass"></i>
                            </button>
                            </form>
                        </div>
                        <!-- Cart layout -->
                        <div class="header__cart">
                            <div class="header__cart-wrap">
                                <i class="header__cart-icon fa-solid fa-cart-shopping"></i>

                                <c:if test="${sessionScope.size == null or sessionScope.size==0}">
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
        <main>
            <div class="mb-4 pb-4"></div>
            <section class="cd-position-relative cd-z-index-1 cd-padding-y-2xl">
                <div class="cd-container cd-max-width-adaptive-sm cd-text-center">
                    <svg class="cd-icon thank-you__icon cd-margin-bottom-sm" viewBox="0 0 96 96" aria-hidden="true">
                    <g fill="currentColor">
                    <circle cx="48" cy="48" r="48" opacity=".1"></circle>
                    <circle cx="48" cy="48" r="31" opacity=".2"></circle>
                    <circle cx="48" cy="48" r="15" opacity=".3"></circle>
                    <path fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M40 48.5l5 5 11-11"></path>
                    <path transform="rotate(25.474 70.507 8.373)" opacity=".5" d="M68.926 4.12h3.159v8.506h-3.159z"></path>
                    <path transform="rotate(-52.869 17.081 41.485)" opacity=".5" d="M16.097 36.336h1.969v10.298h-1.969z"></path>
                    <path transform="rotate(82.271 75.128 61.041)" opacity=".5" d="M74.144 57.268h1.969v7.547h-1.969z"></path>
                    <circle cx="86.321" cy="41.45" r="2.946" opacity=".5"></circle>
                    <circle cx="26.171" cy="78.611" r="1.473" opacity=".5"></circle>
                    <circle cx="49.473" cy="9.847" r="1.473" opacity=".5"></circle>
                    <circle cx="10.283" cy="63" r="2.946" opacity=".2"></circle>
                    <path opacity=".4" d="M59.948 88.142l10.558-3.603-4.888-4.455-5.67 8.058z"></path>
                    <path opacity=".3" d="M18.512 19.236l5.667 1.456.519-8.738-6.186 7.282z"></path>
                    </g>
                    </svg>

                    <div>
                        <h1 class="cd-margin-bottom-xs">Thank you!</h1>
                        <p class="thank-you__paragraph cd-margin-bottom-xs">Cảm ơn đã ủng hộ</p>

                        <p><a class="cd-link" href="home">Tiếp tục shopping →</a></p>
                    </div>
                </div>
            </section>
        </main>
        <style>
            /* reset */
            *, *::after, *::before {
                box-sizing: border-box;
            }

            * {
                font: inherit;
                margin: 0;
                padding: 0;
                border: 0;
            }

            html {
                -webkit-font-smoothing: antialiased;
                -moz-osx-font-smoothing: grayscale;
            }

            body {
                background-color: hsl(0, 0%, 100%);
                font-family: system-ui, sans-serif;
                color: hsl(230, 7%, 23%);
                font-size: 1.125rem; /* 18px */
                line-height: 1.4;
            }

            h1, h2, h3, h4 {
                line-height: 1.2;
                color: hsl(230, 13%, 9%);
                font-weight: 700;
            }

            h1 {
                font-size: 2.5rem; /* 40px */
            }

            h2 {
                font-size: 2.125rem; /* 34px */
            }

            h3 {
                font-size: 1.75rem; /* 28px */
            }

            h4 {
                font-size: 1.375rem; /* 22px */
            }

            ol, ul, menu {
                list-style: none;
            }

            button, input, textarea, select {
                background-color: transparent;
                border-radius: 0;
                color: inherit;
                line-height: inherit;
                -webkit-appearance: none;
                appearance: none;
            }

            textarea {
                resize: vertical;
                overflow: auto;
                vertical-align: top;
            }

            a {
                color: hsl(250, 84%, 54%);
            }

            table {
                border-collapse: collapse;
                border-spacing: 0;
            }

            img, video, svg {
                display: block;
                max-width: 100%;
            }

            /* -------------------------------- 
            
            Icons 
            
            -------------------------------- */

            .cd-icon {
                --size: 1em;
                font-size: var(--size);
                height: 1em;
                width: 1em;
                display: inline-block;
                color: inherit;
                fill: currentColor;
                line-height: 1;
                flex-shrink: 0;
                max-width: initial;
            }

            /* --------------------------------
            
            Component 
            
            -------------------------------- */

            .thank-you__icon {
                --size: 96px;
                color: hsl(170, 78%, 36%);
            }

            .thank-you__paragraph {
                line-height: 1.4;
                color: hsl(225, 4%, 47%);
            }

            /* -------------------------------- 
            
            Utilities 
            
            -------------------------------- */

            .cd-position-relative {
                position: relative;
            }

            .cd-z-index-1 {
                z-index: 1;
            }

            .cd-margin-bottom-xs {
                margin-bottom: 1rem;
            }

            .cd-padding-y-2xl {
                padding-top: 7rem;
                padding-bottom: 7rem;
            }

            .cd-container {
                width: calc(100% - 3rem);
                margin-left: auto;
                margin-right: auto;
            }

            .cd-max-width-adaptive-sm {
                max-width: 32rem;
            }

            @media (min-width: 48rem) {
                .cd-max-width-adaptive-sm {
                    max-width: 48rem;
                }
            }

            .cd-text-center {
                text-align: center;
            }

            /* link */
            .cd-link {
                color: hsl(250, 84%, 54%);
                text-decoration: none;
                background-image: linear-gradient(to right, hsl(250, 84%, 54%) 50%, hsla(250, 84%, 54%, 0.2) 50%);
                background-size: 200% 1px;
                background-repeat: no-repeat;
                background-position: 100% 100%;
                transition: background-position 0.2s;
            }

            .cd-link:hover {
                background-position: 0% 100%;
            }

        </style>
        <div class="mb-5 pb-xl-5"></div>



       <!-- ALL JS FILES -->
        <script src="js/jquery-3.2.1.min.js"></script>
        <script src="js/popper.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <!-- ALL PLUGINS -->
        <script src="js/jquery.superslides.min.js"></script>
        <script src="js/bootstrap-select.js"></script>
        <script src="js/inewsticker.js"></script>
        <script src="js/bootsnav.js."></script>
        <script src="js/images-loded.min.js"></script>
        <script src="js/isotope.min.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/baguetteBox.min.js"></script>
        <script src="js/jquery-ui.js"></script>
        <script src="js/jquery.nicescroll.min.js"></script>
        <script src="js/form-validator.min.js"></script>
        <script src="js/contact-form-script.js"></script>
        <script src="js/custom.js"></script>
    </body>
    <%@ include file="footer.jsp" %>
</html>

