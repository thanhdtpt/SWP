
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <!--<link rel="stylesheet" href="./asserts/css/main.css">-->
        <link rel="stylesheet" href="./asserts/css/main1.css">
        <link rel="stylesheet" href="./asserts/fonts/fontawesome-free-6.0.0/css/all.min.css">
    </head>
    <body
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
        <header class="header">
            <div class="grid">
                <nav class="header__navbar">
                    <ul class="header__navbar-list">
                        <li class="header__navbar-item header__navbar-item--has-qr header__navbar-item--separate" onclick="window.location.href = 'seller-product'" >
                            kênh người bán
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

                                <c:if test="${sessionScope.size==0}">
                                    <!--Has no cart-->
                                    <div class="header__cart-list header__cart-list--no-cart">
                                        <img src="./asserts/img/nocart.png" alt=""class="header__cart-list--no-cart-img">
                                        <p class="header__cart-list-no-cart-msg">
                                            Chưa có sản phẩm
                                        </p>
                                    </div> 
                                </c:if>

                                <c:if test="${sessionScope.size!=0}">
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
                                                            <span class="header__cart-item-delete">Xóa </span>
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
        <div class="app__container">
            <div class="grid">
                <div class="grid__row">
                    <div class="grid__column-2">
                        <div class="category">
                            <h3 class="category__heading">
                                <i class="category__heading-icon fas fa-list"></i> Danh mục
                            </h3>
                            <!--filter-->
                            <c:set var="cid" value="${requestScope.id}"/>

                            <ul class="category-list">
                                <li class="category-item ">
                                    <a href="home" class="category-item__link">Tất cả</a>
                                </li>
                                <c:forEach items="${requestScope.listC}" var="c">
                                    <c:if test="${c.id!=0}">
                                        <c:if test="${c.id==cid}">
                                            <li class="category-item category-item--active">
                                                <a href="tab?id=${c.id}" class="category-item__link " value="${c.id}">${c.name}</a>
                                            </li>
                                        </c:if>
                                        <c:if test="${c.id!=cid}">
                                            <li class="category-item ">
                                                <a href="tab?id=${c.id}" class="category-item__link" value="${c.id}">${c.name}</a>
                                            </li>
                                        </c:if>  

                                    </c:if>
                                </c:forEach>
                                <li class="category-item category-item">
                                    <a href="tab?id=0" class="category-item__link">${requestScope.listC[0].name}</a>
                                </li>

                            </ul>
                        </div>
                    </div>
                    <!-- /* Home sort+filter  */ -->
                    <div class="grid__column-10">
                        <div class="home-filter">
                            <span class="home-filter__label">Sắp xếp theo</span>
                            <button class="home-filter-btn btn" onclick="window.location.href = 'tab?id=${requestScope.id}&fid=1'">
                                <input type="checkbox" value="1" style="opacity: 0;">  Phổ biến</button>
                            <button class="home-filter-btn btn btn--primary" onclick="window.location.href = 'tab?id=${requestScope.id}&fid=2'">
                                <input type="checkbox" value="2" style="opacity: 0;">Mới nhất</button>
                            <button class="home-filter-btn btn"onclick="window.location.href = 'tab?id=${requestScope.id}&fid='3'">
                                <input type="checkbox" value="3" style="opacity: 0;">Bán chạy</button>
                            <div class="select-input">
                                <span class="select-input__label">Giá</span>
                                <i class='select-input__icon fa-solid fa-chevron-down'></i>
                                <div class="select-input-option">
                                    <ul class="select-input___list">
                                        <li class="select-input__item">
                                            <a href="tab?id=${requestScope.id}&fid=4" class="select-input__link">
                                                <input type="radio" value="4"style="opacity: 0;">Giá thấp đến cao</a>
                                            <a href="tab?id=${requestScope.id}&fid=5" class="select-input__link">
                                                <input type="radio" value="5"style="opacity: 0;">Giá cao đến thấp</a>
                                        </li>
                                    </ul>
                                </div>

                            </div>
                            <div class="home-filter__page">
                                <span class="home-filter__page-num">

                                    <span class="home-filter__page-num-curent">
                                        ${requestScope.page}
                                    </span> /${requestScope.num}
                                </span>
                                <div class="home-filter__page-control">
                                    <c:if test="${1==requestScope.page&&requestScope.num!=1}">
                                        <i class='home-filter__page-control--icon  fa-solid fa-chevron-left'></i>
                                        <div class="pagination">
                                            <c:forEach begin="${1}" end="${requestScope.num}" var="i">
                                                <a class="pagination ${i==page?"active":"" }" href="home?page=${i}"></a>  
                                            </c:forEach>
                                        </div>
                                        <i class='home-filter__page-control--icon home-filter__page-control--icon--active fa-solid fa-chevron-right' 
                                           onclick="window.location.href = 'home?page=${requestScope.page+1}'"></i>
                                    </c:if>
                                    <c:if test="${1==requestScope.page&&requestScope.num==1}">
                                        <i class='home-filter__page-control--icon  fa-solid fa-chevron-left'></i>
                                        <div class="pagination">
                                            <c:forEach begin="${1}" end="${requestScope.num}" var="i">
                                                <a class="pagination ${i==page?"active":"" }" href="home?page=${i}"></a>  
                                            </c:forEach>
                                        </div>
                                        <i class='home-filter__page-control--icon  fa-solid fa-chevron-right' ></i>
                                    </c:if>
                                    <c:if test="${1<requestScope.page&&requestScope.page<num}">
                                        <i class='home-filter__page-control--icon home-filter__page-control--icon--active fa-solid fa-chevron-left'
                                           onclick="window.location.href = 'home?page=${requestScope.page-1}'"></i>
                                        <div class="pagination">
                                            <c:forEach begin="${1}" end="${requestScope.num}" var="i">
                                                <a class="pagination ${i==page?"active":"" }" href="home?page=${i}"></a>  
                                            </c:forEach>
                                        </div>
                                        <i class='home-filter__page-control--icon home-filter__page-control--icon--active fa-solid fa-chevron-right'
                                           onclick="window.location.href = 'home?page=${requestScope.page+1}'"></i>
                                    </c:if>
                                    <c:if test="${requestScope.page==num&&requestScope.num>1}">
                                        <i class='home-filter__page-control--icon home-filter__page-control--icon--active fa-solid fa-chevron-left'
                                           onclick="window.location.href = 'home?page=${requestScope.page-1}'"></i>
                                        <div class="pagination">
                                            <c:forEach begin="${1}" end="${requestScope.num}" var="i">
                                                <a class="pagination ${i==page?"active":"" }" href="home?page=${i}"></a>  
                                            </c:forEach>
                                        </div>
                                        <i class='home-filter__page-control--icon  fa-solid fa-chevron-right' ></i>
                                    </c:if>
                                </div>
                            </div>

                        </div>
                        <div class="home-product">
                            <div class="grid__row">
                                <c:forEach items="${requestScope.data}" var="p">
                                    <div class="grid__column-2-4">
                                        <a class="home-product-item" href="product?id=${p.id}">
                                            <div class="home-product-item__img"
                                                 style="background-image: url(${p.images1});">
                                            </div>
                                            <h4 class="home-product-item__img-name">${p.productname} </h4>
                                            <div class="home-product-item__price">
                                                <span class="home-product-item__oldprice">${p.oldPrice} đ</span>
                                                <span class="home-product-item__current">${p.currentPrice} đ </span>
                                            </div>
                                            <div class="home-product-item__action">
                                                <span class="home-product-item__like home-product-item__like--liked">
                                                    <i class="home-product-item__like-icon-empty far fa-heart"></i>
                                                    <i class="home-product-item__like-icon-fill fas fa-heart"></i>
                                                </span>


                                                <div class="home-product-item__rating">
                                                    <i class="fas fa-star home-product-item__stargold"></i>
                                                    <i class="fas fa-star home-product-item__stargold"></i>
                                                    <i class="fas fa-star home-product-item__stargold"></i>
                                                    <i class="fas fa-star home-product-item__stargold"></i>
                                                    <i class="fas fa-star home-product-item__stargold"></i>
                                                </div>
                                                <span class="home-product-item__sold">${p.unitOnOrder}</span>
                                            </div>
                                            <div class="home-product-item__origin">
                                                <span class="home-product-item__brand">${p.brand}</span>
                                                <span class="home-product-item__origin-name">${p.origin}</span>
                                            </div>
                                            <div class="home-product-item__favourite">
                                                <span>
                                                    <i class="fas fa-check"></i> Yêu thích
                                                </span>
                                            </div>
                                            <div class="home-product-item__sale-off">
                                                <span class="home-product-item__sale-off-percent">${p.discount}%</span>
                                                <span class="home-product-item__sale-off-label">Giảm</span>
                                            </div>
                                        </a>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                        <!--Pagging-->
                        <div class="page">
                            <c:set var="page" value="${requestScope.page}" />

                            <div class="page page-control">
                                <c:if test="${1==requestScope.page&&requestScope.num!=1}">
                                    <i class='home-filter__page-control--icon  fa-solid fa-chevron-left'></i>
                                    <div class="pagination">
                                        <c:forEach begin="${1}" end="${requestScope.num}" var="i">
                                            <a class="pagination ${i==page?"active":"" }" href="home?page=${i}">${i}</a>  
                                        </c:forEach>
                                    </div>
                                    <i class='home-filter__page-control--icon home-filter__page-control--icon--active fa-solid fa-chevron-right' 
                                       onclick="window.location.href = 'home?page=${requestScope.page+1}'"></i>
                                </c:if>
                                <c:if test="${1==requestScope.page&&requestScope.num==1}">
                                    <i class='home-filter__page-control--icon  fa-solid fa-chevron-left'></i>
                                    <div class="pagination">
                                        <c:forEach begin="${1}" end="${requestScope.num}" var="i">
                                            <a class="pagination ${i==page?"active":"" }" href="home?page=${i}">${i}</a>  
                                        </c:forEach>
                                    </div>
                                    <i class='home-filter__page-control--icon  fa-solid fa-chevron-right' ></i>
                                </c:if>
                                <c:if test="${1<requestScope.page&&requestScope.page<num}">
                                    <i class='home-filter__page-control--icon home-filter__page-control--icon--active fa-solid fa-chevron-left'
                                       onclick="window.location.href = 'home?page=${requestScope.page-1}'"></i>
                                    <div class="pagination">
                                        <c:forEach begin="${1}" end="${requestScope.num}" var="i">
                                            <a class="pagination ${i==page?"active":"" }" href="home?page=${i}">${i}</a>  
                                        </c:forEach>
                                    </div>
                                    <i class='home-filter__page-control--icon home-filter__page-control--icon--active fa-solid fa-chevron-right'
                                       onclick="window.location.href = 'home?page=${requestScope.page+1}'"></i>
                                </c:if>
                                <c:if test="${requestScope.page==num&&requestScope.num>1}">
                                    <i class='home-filter__page-control--icon home-filter__page-control--icon--active fa-solid fa-chevron-left'
                                       onclick="window.location.href = 'home?page=${requestScope.page-1}'"></i>
                                    <div class="pagination">
                                        <c:forEach begin="${1}" end="${requestScope.num}" var="i">
                                            <a class="pagination ${i==page?"active":"" }" href="home?page=${i}">${i}</a>  
                                        </c:forEach>
                                    </div>
                                    <i class='home-filter__page-control--icon  fa-solid fa-chevron-right' ></i>
                                </c:if>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <footer class="footer">
            <img src="./asserts/img/footer-profile.jpg" alt="Qr code"/>
        </footer>
    </div>
    <!--modal layout-->
    <!--    <div class="modal" id="modal">
            <div class="modal__overlay"></div>
            <div class="modal__body">
    
                 Login form
                <div class="auth-form">
                    <div class="auth-form_header">
                        <h3 class="auth-form_heading">Đăng ký</h3>
                        <span class="auth-form_switch-btn">Đăng nhập</span>
                    </div>
                    <div class="auth-form__form">
                        <div class="auth-form__group">
                            <input type="text" class="auth-form__input" placeholder="Email của bạn ">
                        </div>
                        <div class="auth-form__group">
                            <input type="password" class="auth-form__input" placeholder="Mật khẩu của bạn">
                        </div>
                        <div class="auth-form__group">
                            <input type="password" class="auth-form__input" placeholder="Nhập lại mật khẩu">
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
                        <button class="btn ">TRỞ LẠI</button>
                        <button class="btn btn--primary">ĐĂNG KÝ</button>
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
    
                Register  form
                <div class="auth-form">
                    <div class="auth-form_header">
                        <h3 class="auth-form_heading">Đăng nhập</h3>
                        <span class="auth-form_switch-btn">Đăng ký</span>
                    </div>
                    <div class="auth-form__form">
                        <div class="auth-form__group">
                            <input type="text" class="auth-form__input" placeholder="Email của bạn ">
                        </div>
                        <div class="auth-form__group">
                            <input type="password" class="auth-form__input" placeholder="Mật khẩu của bạn">
                        </div>
    
                    </div>
                    <div class="auth-form_aside">
                        <p class="auth-form__help">
    
                            <a href="" class="auth-form__text-link">Quên mật khẩu</a>
                            <span class="auth-form__help-separate"></span>
                            <a href="" class="auth-form__text-link">Cần trợ giúp?</a>
                        </p>
                    </div>
                    <div class="auth-form__controls">
                        <button class="btn ">TRỞ LẠI</button>
                        <button class="btn btn--primary">ĐĂNG NHẬP</button>
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
        </div>-->
</body>
</html>
