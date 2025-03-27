
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
        <link rel="stylesheet" href="./asserts/css/footer.css">
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
        .select-input__link.selected {
            font-weight: bold;
            color: #10218a;
        }

        /* Định dạng cho bảng lịch sử mua hàng */
        .order-history-container {
            background: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
            margin-top: 20px;
        }

        .order-history-title {
            text-align: center;
            font-size: 24px;
            font-weight: bold;
            color: #333;
            margin-bottom: 20px;
        }

        .table-order {
            width: 100%;
            border-collapse: collapse;
        }

        .table-order thead {
            background: #007bff;
            color: white;
        }

        .table-order th,
        .table-order td {
            padding: 12px;
            text-align: center;
            border: 1px solid #ddd;
        }

        .table-order tr:nth-child(even) {
            background: #f9f9f9;
        }

        .table-order tr:hover {
            background: #e9ecef;
            transition: 0.3s;
        }

        /* Nút "Xem Chi Tiết" */
        .btn-info {
            background: #17a2b8;
            border: none;
            padding: 8px 15px;
            border-radius: 5px;
            color: white;
            text-decoration: none;
            transition: 0.3s;
        }

        .btn-info:hover {
            background: #138496;
            color: white;
            text-decoration: none;
        }

        /* Mobile Responsive */
        @media screen and (max-width: 768px) {
            .table-order th,
            .table-order td {
                padding: 8px;
                font-size: 14px;
            }

            .order-history-title {
                font-size: 20px;
            }
        }


    </style>
    <!-- Block Element Modifier -->
    <div class="app">

        <header class="header">
            <div class="grid">
                <nav class="header__navbar">
                    <ul class="header__navbar-list">
                    </ul>
                    <ul class="header__navbar-list">

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
                                <img src="./${sessionScope.profile.image}"
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
                                        <a href="like-product">yêu thích </a>
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
                        <c:if test="${sessionScope.account != null}">
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
                        </c:if>


                    </nav>
            </div>

        </header>
        <div class="app__container">
            <div class="grid">
                <div class="order-history-container">
                    <h2 class="order-history-title">📦 Lịch Sử Mua Hàng</h2>

                    <c:choose>
                        <c:when test="${empty orderList}">
                            <p class="text-center">❌ Bạn chưa có đơn hàng nào.</p>
                        </c:when>
                        <c:otherwise>
                            <table class="table-order">
                                <thead>
                                    <tr>
                                        <th>🆔 Mã Đơn</th>
                                        <th>📅 Ngày Đặt</th>
                                        <th>🚚 Ngày Giao</th>
                                        <th>📍 Địa Chỉ</th>
                                        <th>⚖ Cân Nặng</th>
                                        <th>💰 Tổng Tiền</th>
                                        <th>🔍 Chi Tiết</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="order" items="${orderList}">
                                        <tr>
                                            <td>#${order.id}</td>
                                            <td>${order.orderDate}</td>
                                            <td>${order.shippedDate}</td>
                                            <td>${order.shipaddress}</td>
                                            <td>${order.freight} KG</td>
                                            <td><b style="color: green;"><fmt:formatNumber value="${order.total}" type="number" groupingUsed="true"/> đ</b></td>
                                            <td>
                                                <a href="order-details?orderId=${order.id}" class="btn-info">Xem</a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </c:otherwise>
                    </c:choose>
                </div>

            </div>
        </div>

        <%@ include file="footer.jsp" %>
    </div>

</body>
</html>
