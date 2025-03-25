<!DOCTYPE html>
<html lang="en">

    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    <%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>


        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css">
        <link rel="stylesheet" href="./asserts/css/base.css">
        <link rel="stylesheet" href="./asserts/css/main1.css">
        <link rel="stylesheet" href="./asserts/css/footer.css">
        <link rel="stylesheet" href="./asserts/css/product.css">
        <link rel="stylesheet" href="./asserts/css/checkbox.css">
        <link rel="stylesheet" href="./asserts/fonts/fontawesome-free-6.0.0/css/all.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="./asserts/js/product.js"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jQuery-slimScroll/1.3.8/jquery.slimscroll.min.js"></script>
        <style>
            .heart-icon {
                display: inline-flex;
                align-items: center;
                justify-content: center;
                width: 40px;
                height: 40px;
                border-radius: 50%;
                background-color: rgba(255, 0, 0, 0.1); /* Màu nền nhạt */
                cursor: pointer;
                transition: all 0.3s ease;
                margin-left: 15px;
            }

            .heart-icon:hover {
                background-color: rgba(255, 0, 0, 0.2); /* Khi hover, màu đậm hơn */
            }

            .like-button {
                font-size: 22px;
                border: none;
                background: none;
                cursor: pointer;
                transition: transform 0.3s ease, color 0.3s ease;
            }

            .like-button.liked {
                color: red; /* Trái tim đỏ khi được thích */
                transform: scale(1.2); /* Phóng to nhẹ */
            }

            .like-button.unliked {
                color: gray; /* Trái tim xám khi chưa thích */
            }

            /* CSS cho modal */
            .modal {
                display: none ; 
                position: fixed;
                z-index: 1000;
                left: 0;
                top: 0;
                width: 100%;
                height: 100%;
                background-color: rgba(0, 0, 0, 0.4);
                display: flex;
                align-items: center;
                justify-content: center;
            }

            /* Nội dung modal */
            .modal-content {
                background-color: #fff;
                padding: 20px;
                border-radius: 8px;
                width: 350px; /* Thu nhỏ modal */
                box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
                text-align: center;
                animation: fadeIn 0.3s ease-in-out;
            }

            /* Chỉnh lại phần nhập mô tả */
            .modal textarea {
                width: 100%;
                height: 60px; /* Giảm chiều cao */
                padding: 5px;
                resize: none; /* Không cho kéo thả */
                font-size: 14px;
            }

            /* Nút đóng modal */
            .close {
                color: #aaa;
                float: right;
                font-size: 24px;
                font-weight: bold;
                cursor: pointer;
            }

            .close:hover {
                color: black;
            }

            /* Nút gửi đánh giá */
            .modal button {
                background-color: #007bff;
                color: white;
                border: none;
                padding: 10px;
                border-radius: 5px;
                cursor: pointer;
                width: 100%;
                font-size: 16px;
                transition: 0.3s;
            }

            .modal button:hover {
                background-color: #0056b3;
            }

            /* Animation xuất hiện */
            @keyframes fadeIn {
                from {
                    opacity: 0;
                    transform: scale(0.8);
                }
                to {
                    opacity: 1;
                    transform: scale(1);
                }
            }


        </style>
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
                        </ul>
                        <ul class="header__navbar-list">
                            <!--LOGED-->
                            <li class="header__navbar-item header__navbar-user">
                                <img src="./${sessionScope.profile.image}"
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
                                        <a href="like-product">yêu thích </a>
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
                                    <input type="hidden" name="leadTo" id="leadTo">
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

                                                    <div style="margin-top: 10px;" class="nav__bar__price">
                                                        <div class="flex flex-column">
                                                            <div class="flex flex-column _1900SS">
                                                                <div class="flex items-center">
                                                                    <div class="flex items-center _1V_Jxg">
                                                                        <div class="_2Csw3W old--price">
                                                                            <fmt:formatNumber value="${p.oldPrice}" type="number" groupingUsed="true"/>  đ
                                                                        </div>
                                                                        <div class="flex items-center">
                                                                            <div class="_2v0Hgx current--price">
                                                                                <fmt:formatNumber value="${p.currentPrice}" type="number" groupingUsed="true"/>  đ</div>
                                                                            <div class="_1kpF5Y item--discount">
                                                                                ${p.discount}%</div>
                                                                        </div>
                                                                        <div class="heart-icon">
                                                                            <button id="likeButton" 
                                                                                    class="like-button"
                                                                                    onclick="toggleLike(${p.id})">
                                                                                ${isLiked ? "❤️" : "🤍"}
                                                                            </button>
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

                                                                            </div>
                                                                            <div id="unit" data = ${p.unitInstock}>
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
                                                                        aria-disabled="false" onclick="submitForm('product')">
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
                                                                        aria-disabled="false" onclick="submitForm('cart')">
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
                                                <%-- Kiểm tra nếu user đã mua hàng và chưa feedback --%>
                                                <c:if test="${sessionScope.account != null}">
                                                    <c:if test="${hasPurchased}">
                                                    <!-- Kiểm tra có feedback chưa -->
                                                    <c:choose>
                                                        <c:when test="${myFeedback != null}">
                                                            <!-- Đã có feedback => nút cập nhật -->
                                                            <button class="btn-feedback" 
                                                                    onclick="openFeedbackModalForUpdate('${myFeedback.id}', '${myFeedback.rating}', '${myFeedback.description}')">
                                                                📝 Cập nhật đánh giá
                                                            </button>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <!-- Chưa có feedback => nút thêm -->
                                                            <button class="btn-feedback" onclick="openFeedbackModalForAdd()">📝 Thêm đánh giá</button>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </c:if>
                                            </c:if>

                                            <div class="Fo12Im">
                                                <div class="shopee-product-rating">
                                                    <div class="feedback-list">
                                                        <c:forEach items="${feedbackList}" var="fb">
                                                            <div class="feedback-item"
                                                                 style="
                                                                 display: flex;
                                                                 align-items: center;
                                                                 justify-content: space-between;  /* chia 2 cột: trái - phải */
                                                                 margin-bottom: 10px;             /* khoảng cách giữa các feedback */
                                                                 ">

                                                                <!-- Khối bên trái: userName, rating (sao), description -->
                                                                <div>
                                                                    <strong>${fb.userName}</strong>
                                                                    <!-- In ra fb.rating ngôi sao -->
                                                                    <c:forEach var="i" begin="1" end="${fb.rating}">
                                                                        <i class="fa fa-star" style="color: gold;"></i>
                                                                    </c:forEach>

                                                                    <p style="margin: 4px 0 0 0;">${fb.description}</p>
                                                                </div>

                                                                <!-- Khối bên phải: icon xóa (chỉ hiển thị nếu user hiện tại == fb.userName) -->
                                                                <c:if test="${fb.userName == sessionScope.account.username}">
                                                                    <span style="cursor:pointer; color:red; margin-left:90px;"
                                                                          onclick="deleteFeedback(${fb.id})"
                                                                          title="Xóa feedback">
                                                                        <i class="fa fa-trash"></i> Xóa
                                                                    </span>
                                                                </c:if>
                                                            </div>
                                                        </c:forEach>

                                                    </div>

                                                </div>
                                            </div>

                                        </div>

                                    </div>


                                </div>

                        </div>

                        </form>

                        <!-- Modal đánh giá -->
                        <!-- Modal đánh giá -->
                        <!-- Modal đánh giá -->
                        <div id="feedbackModal" class="modal">
                            <div class="modal-content">
                                <span class="close" onclick="closeFeedbackModal()">&times;</span>
                                <h2>Đánh giá sản phẩm</h2>

                                <form id="feedbackForm" action="${pageContext.request.contextPath}/feedback" method="POST">
                                    <!-- Ẩn -->
                                    <input type="hidden" id="productId" name="productId" value="${p.id}">
                                    <input type="hidden" id="feedbackAction" name="feedbackAction" value="add">

                                    <input type="hidden" id="feedbackId" name="feedbackId" value="">

                                    <label>Chọn số sao:</label>
                                    <select id="rating" name="rating">
                                        <option value="5">⭐⭐⭐⭐⭐</option>
                                        <option value="4">⭐⭐⭐⭐</option>
                                        <option value="3">⭐⭐⭐</option>
                                        <option value="2">⭐⭐</option>
                                        <option value="1">⭐</option>
                                    </select>

                                    <br><br>

                                    <label>Mô tả:</label><br>
                                    <textarea id="description" name="description"></textarea>

                                    <br><br>

                                    <button type="submit">Gửi</button>
                                    <div id="feedbackError" style="color:red;"></div>
                                </form>
                            </div>
                        </div>


                    </div>
                </div>

            </div>

        </div>

    </div>




    <%@ include file="footer.jsp" %>
</div>
<!--modal layout-->
<script>
    function toggleLike(productId) {
        fetch(`/online_shopping/like-product`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({productId: productId})
        })
                .then(response => response.text()) // Đọc dữ liệu dưới dạng text trước
                .then(text => {
                    console.log("Server response:", text); // In response ra console
                    return JSON.parse(text); // Chuyển đổi sang JSON nếu có thể
                })
                .then(data => {
                    if (data.success) {
                        let likeButton = document.getElementById('likeButton');
                        likeButton.innerHTML = data.isLiked ? "❤️" : "🤍";
                    } else {
                        alert("Lỗi khi thích/bỏ thích sản phẩm!");
                    }
                })
                .catch(error => console.error("Lỗi:", error));
    }

//    // Mở modal
//    function openFeedbackModal() {
//        console.log("Modal is opening");
//        document.getElementById("feedbackModal").style.display = "flex";
//    }
//
    // Đóng modal
    function closeFeedbackModal() {
        document.getElementById("feedbackModal").style.display = "none";
    }

// Đóng modal khi nhấp ra ngoài
    window.onclick = function (event) {
        let modal = document.getElementById("feedbackModal");
        if (event.target === modal) {
            modal.style.display = "none";
        }
    }

    document.getElementById("feedbackForm").addEventListener("submit", function (event) {
        event.preventDefault();  // Chặn submit mặc định
        let form = this;

        // Lấy dữ liệu
        let formData = new FormData(form);
        // Convert sang URLSearchParams để gửi dạng application/x-www-form-urlencoded
        let urlParams = new URLSearchParams(formData);

        // Gửi request
        fetch(form.action, {
            method: "POST",
            headers: {
                "Content-Type": "application/x-www-form-urlencoded"
            },
            body: urlParams
        })
                .then(response => {
                    // Kiểm tra HTTP status
                    if (!response.ok) {
                        // 400, 404, 500,...
                        throw new Error("HTTP status " + response.status);
                    }
                    return response.json(); // parse JSON
                })
                .then(data => {
                    if (data.success) {
                        alert("Đánh giá thành công!");
                        closeFeedbackModal();
                        location.reload();
                    } else {
                        // Hiển thị lỗi từ backend
                        document.getElementById("feedbackError").innerText = data.message;
                    }
                })
                .catch(error => {
                    console.error("Error:", error);
                    document.getElementById("feedbackError").innerText = "Có lỗi xảy ra!";
                });
    });
</script>
<script>
    function openFeedbackModalForAdd() {
        document.getElementById("feedbackForm").reset();
        // Gán value
        document.getElementById("feedbackAction").value = "add";
        document.getElementById("feedbackModal").style.display = "flex";
    }
</script>
<script>
    function openFeedbackModalForUpdate(feedbackId, rating, description) {
        document.getElementById("feedbackAction").value = "update";
        document.getElementById("feedbackId").value = feedbackId;
        document.getElementById("rating").value = rating;
        document.getElementById("description").value = description;
        document.getElementById("feedbackModal").style.display = "flex";
    }
</script>
<script>
    function deleteFeedback(fbId) {
        if (confirm("Bạn có muốn xóa comment này không?")) {
            // Gửi request xóa
            fetch('${pageContext.request.contextPath}/feedback?action=delete&feedbackId=' + fbId)
                    .then(response => response.json())
                    .then(data => {
                        if (data.success) {
                            alert("Xóa thành công!");
                            location.reload();
                        } else {
                            alert(data.message);
                        }
                    })
                    .catch(err => {
                        console.error(err);
                        alert("Có lỗi khi xóa feedback!");
                    });
        }
    }
</script>


</body>

</html>