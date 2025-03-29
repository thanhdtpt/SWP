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
        <script src="./asserts/js/product.js"></script>
        <script src="./asserts/js/form.js"></script>
        <style>
            .footer img {
                width: 100%;
                height: auto;
                display: block;
            }
            .like-table {
                width: 100%; /* Tăng chiều rộng của bảng lên */
                margin: 20px auto; /* Căn giữa bảng */
                border-collapse: collapse;
                font-size: 1.5rem;
            }

            .like-table th, .like-table td {
                border: 1px solid #ddd;
                padding: 12px;
                text-align: center;
                /*white-space: nowrap;  Giữ văn bản trên cùng một dòng */
            }

            .like-table th {
                background-color: #f8f8f8;
                font-weight: bold;
            }

            .like-table img {
                width: 100px;
                height: 100px;
                object-fit: cover;
                border-radius: 8px;
            }

            .remove-btn {
                background-color: red;
                color: white;
                border: none;
                padding: 7px 12px;
                cursor: pointer;
                border-radius: 5px;
                transition: background 0.3s;
            }

            .remove-btn:hover {
                background-color: darkred;
            }

        </style>
    </head>

    <body>
        <div class="app">
            <header class="header ">
                <div class="grid">
                    <nav class="header__navbar">
                        <ul class="header__navbar-list">
                        </ul>
                        <ul class="header__navbar-list">
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
                                <img src="./${sessionScope.profile.image}"
                                     alt="" class="header__navbar-user-img">
                                <span class="header__navbar-user-name">${sessionScope.account.cusname}</span>
                                <!--                                <ul class="header__navbar-user-menu">
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
                                                                </ul>-->
                                <ul class="header__navbar-user-menu">
                                    <li class="header__navbar-user-item">
                                        <a href="profile">Tài khoản của tôi</a>
                                    </li>
                                    <li class="header__navbar-user-item">
                                        <a href="address?action=view">Địa chỉ của tôi</a>
                                    </li>
                                    <li class="header__navbar-user-item">
                                        <a href="order-history">Đơn mua </a>
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
                <div class="grid">
                    <div class="grid__row">
                        <div class="grid__column-10">
                            <h2>Danh sách sản phẩm yêu thích</h2>
                            <table class="like-table">
                                <thead>
                                    <tr>
                                        <th>Hình ảnh</th>
                                        <th>Tên sản phẩm</th>
                                        <th>Giá cũ</th>
                                        <th>Giá hiện tại</th>
                                        <th>Số lượng / Đơn vị</th>
                                        <th>Tồn kho</th>
                                        <th>Đã đặt</th>
                                        <th>Thương hiệu</th>
                                        <th>Xuất xứ</th>
                                        <th>Ngày thêm</th>
                                        <th>Hành động</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${likedProducts}" var="p">
                                        <tr>
                                            <td><img src="${p.images1}" alt="Sản phẩm"></td>
                                            <td>${p.productname}</td>
                                            <td><fmt:formatNumber value="${p.oldPrice}" type="number"/> đ</td>
                                            <td><fmt:formatNumber value="${p.currentPrice}" type="number"/> đ</td>
                                            <td>${p.quantityPerUnit}</td>
                                            <td>${p.unitInstock}</td>
                                            <td>${p.unitOnOrder}</td>
                                            <td>${p.brand}</td>
                                            <td>${p.origin}</td>
                                            <td>${p.createdDate}</td> <!-- Hiển thị ngày theo định dạng YYYY-MM-DD -->
                                            <td>
                                                <button class="remove-btn" onclick="toggleLike(${p.id})">Xóa</button>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>

                            </table>
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
            fetch("/online_shopping/like-product", {
                method: "POST",
                headers: {
                    "Content-Type": "application/json"
                },
                body: JSON.stringify({productId: productId})
            })
                    .then(response => response.json()) // Chuyển response thành JSON
                    .then(data => {
                        if (data.success) {
                            location.reload(); // Load lại trang để cập nhật trạng thái
                        } else {
                            alert("Lỗi khi thích/bỏ thích sản phẩm!");
                        }
                    })
                    .catch(error => console.error("Lỗi:", error));
        }
    </script>
</body>

</html>