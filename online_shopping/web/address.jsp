<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Địa chỉ của tôi</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css">
        <link rel="stylesheet" href="./asserts/css/base.css">
        <link rel="stylesheet" href="./asserts/css/main.css">
        <link rel="stylesheet" href="./asserts/css/footer.css">
        <link rel="stylesheet" href="./asserts/css/profile.css">
        <link rel="stylesheet" href="./asserts/fonts/fontawesome-free-6.0.0/css/all.min.css">
        <style>
            /* Bảng chính */
            .address-table {
                width: 100%;
                margin-top: 3rem;
                border-collapse: collapse; /* Làm cho các đường viền không bị chồng lên nhau */
                box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1); /* Thêm bóng cho bảng */
            }

            /* Tiêu đề bảng */
            .address-table th {
                background-color: #4CAF50; /* Màu nền của tiêu đề */
                color: white; /* Màu chữ trong tiêu đề */
                padding: 12px 15px;
                text-align: left;
                font-size: 1rem;
            }

            /* Dòng trong bảng */
            .address-table td {
                padding: 12px 15px;
                text-align: left;
                font-size: 1rem;
                border-bottom: 1px solid #ddd; /* Đường viền dưới các ô */
            }

            /* Màu nền của dòng khi di chuột */
            .address-table tr:hover {
                background-color: #f2f2f2; /* Đổi màu nền khi hover */
            }

            /* Các ô input */
            .address-table input {
                width: 100%;
                padding: 8px 12px;
                font-size: 1rem;
                border: 1px solid #ddd;
                border-radius: 4px;
                box-sizing: border-box;
                transition: border-color 0.3s ease;
            }

            /* Các ô input khi focus */
            .address-table input:focus {
                border-color: #4CAF50; /* Thay đổi màu đường viền khi focus */
                outline: none;
            }

            /* Nút Cập nhật */
            .address-table button {
                background-color: #4CAF50;
                color: white;
                padding: 8px 12px;
                font-size: 1rem;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                transition: background-color 0.3s ease;
            }

            /* Nút Cập nhật khi hover */
            .address-table button:hover {
                background-color: #45a049; /* Đổi màu khi hover vào nút */
            }

            /* Định dạng cho các ô input trong bảng */
            .address-table td input {
                border-radius: 4px;
            }

            /* Thêm khoảng cách cho bảng khi có nhiều hàng */
            .address-table tbody tr {
                transition: background-color 0.3s ease;
            }
            /* Các kiểu chung cho form */
            .main-profile-form {
                background-color: #f9f9f9;
                padding: 2rem;
                border-radius: 8px;
                box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            }

            /* Các label cho trường thông tin */
            .form-item__label {
                font-size: 1rem;
                font-weight: 600;
                color: #333;
                margin-bottom: 0.5rem;
                display: block;
            }

            /* Các input và select */
            .form-item__input {
                width: 100%;
                padding: 12px;
                border: 1px solid #ddd;
                border-radius: 4px;
                font-size: 1rem;
                color: #333;
                background-color: #fff;
                transition: border-color 0.3s ease;
                margin-bottom: 1rem;
            }

            /* Hiệu ứng khi focus vào các trường input */
            .form-item__input:focus {
                border-color: #4CAF50; /* Màu xanh khi focus */
                outline: none;
            }

            /* Nút Thêm mới */
            .form-submit button {
                background-color: #4CAF50;
                color: white;
                padding: 12px 18px;
                font-size: 1rem;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                transition: background-color 0.3s ease;
            }

            /* Hiệu ứng hover cho nút */
            .form-submit button:hover {
                background-color: #45a049;
            }


        </style>
        <script>
            // Danh sách các địa phương
            const locations = {
                "Hanoi": {
                    "Ba Đình": ["Kim Mã", "Ngọc Hà"],
                    "Hoàn Kiếm": ["Hàng Bài", "Hàng Mã"]
                },
                "HCM": {
                    "Quận 1": ["Bến Nghé", "Đa Kao"],
                    "Quận 3": ["Phường 1", "Phường 2"]
                },
                "DaNang": {
                    "Hải Châu": ["Hòa Thuận", "Thạch Thang"],
                    "Sơn Trà": ["Mân Thái", "Nại Hiên Đông"]
                }
            };

// Hàm cập nhật danh sách huyện khi chọn tỉnh
            function loadDistricts() {
                let province = document.getElementById("province").value;
                let districtSelect = document.getElementById("district");
                let wardSelect = document.getElementById("ward");

                // Xóa dữ liệu cũ
                districtSelect.innerHTML = '<option value="">Chọn huyện</option>';
                wardSelect.innerHTML = '<option value="">Chọn xã</option>';

                if (province in locations) {
                    for (let district in locations[province]) {
                        let option = document.createElement("option");
                        option.value = district;
                        option.text = district;
                        districtSelect.appendChild(option);
                    }
                }
            }

// Hàm cập nhật danh sách xã khi chọn huyện
            function loadWards() {
                let province = document.getElementById("province").value;
                let district = document.getElementById("district").value;
                let wardSelect = document.getElementById("ward");

                // Xóa dữ liệu cũ
                wardSelect.innerHTML = '<option value="">Chọn xã</option>';

                if (province in locations && district in locations[province]) {
                    for (let ward of locations[province][district]) {
                        let option = document.createElement("option");
                        option.value = ward;
                        option.text = ward;
                        wardSelect.appendChild(option);
                    }
                }
            }

// Hàm lưu địa chỉ đầy đủ vào trường input ẩn trước khi submit
            function saveFullAddress() {
                let province = document.getElementById("province").value;
                let district = document.getElementById("district").value;
                let ward = document.getElementById("ward").value;
                let addressInput = document.getElementById("fullAddress");

                if (ward && district && province) {
                    addressInput.value = ward + ` - ` + district + ` - ` + province;
                } else {
                    alert("Vui lòng chọn đầy đủ tỉnh, huyện, xã!");
                    return false; // Ngăn không cho form submit nếu thiếu dữ liệu
                }
            }

        </script>

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
                                    <img src="./${sessionScope.profile.image}"
                                         alt="" class="header__navbar-user-img">
                                    <span class="header__navbar-user-name">${sessionScope.cus.name}</span>
                                    <!--                                    <ul class="header__navbar-user-menu">
                                                                            <li class="header__navbar-user-item">
                                                                                <a href="profile">Tài khoản của tôi</a>
                                                                            </li>
                                                                            <li class="header__navbar-user-item">
                                                                                <a href="address">Địa chỉ của tôi</a>
                                                                            </li>
                                                                            <li class="header__navbar-user-item">
                                                                                <a href="adress">Đơn mua </a>
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
            <c:if test="${sessionScope.account!=null}">
                <!-- List category-->
                <div class="grid__row main-profile-category">
                    <div class="grid__column-2">
                        <div class="profile">
                            <div class="profile__heading">
                                <div class="profile__heading profile__heading-avatar">
                                    <img src="https://w7.pngwing.com/pngs/340/956/png-transparent-profile-user-icon-computer-icons-user-profile-head-ico-miscellaneous-black-desktop-wallpaper-thumbnail.png" alt="avatar">
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
                                <li class="profile-item ">
                                    <a href="profile" class="profile-item__link ">Hồ Sơ</a>
                                </li>
                                <li class="profile-item profile-item--active">
                                    <a href="address" class="profile-item__link ">Địa chỉ</a>
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
                    <!-- /* Home Information  */ -->
                    <div class="grid__column-10"  style="background-color: #fff; box-shadow: 0 0 2px #ccc; position: relative ; height:550px">
                        <!--<div class="profile__form">-->
                        <!-- heading form-->
                        <div class="profile__form--heading">
                            <div class="profile__form--heading profile__form--heading-title">
                                <h1 class="profile__form--heading profile__form--heading-title-content">
                                    Địa Chỉ Của Tôi
                                </h1>
                            </div>
                            <div class="profile__form--heading profile__form--heading-title-description">Quản lý thông tin hồ sơ để bảo mật tài khoản</div>

                        </div>
                        <!--Bodyform-->
                        <c:set var="cus" value="${sessionScope.cus}"/>
                        <c:set var="shop" value="${sessionScope.shop}"/> 
                        <form action="address?action=add" method="POST" onsubmit="return saveFullAddress()" class="container mt-4 p-4 bg-light rounded shadow">
                            <h3 class="mb-3">Thêm địa chỉ mới</h3>

                            <!-- Tên người nhận -->
                            <div class="row mb-3 align-items-center">
                                <label for="name" class="col-md-3 col-form-label fw-bold">Tên</label>
                                <div class="col-md-9">
                                    <input type="text" name="name" id="name" maxlength="255" class="form-control" placeholder="Nhập tên người nhận" required>
                                </div>
                            </div>

                            <!-- Số điện thoại -->
                            <div class="row mb-3 align-items-center">
                                <label for="phone" class="col-md-3 col-form-label fw-bold">Điện thoại</label>
                                <div class="col-md-9">
                                    <input type="text" name="phone" id="phone" maxlength="10" class="form-control" placeholder="Nhập số điện thoại" required oninput="validatePhoneNumber()">
                                    <span id="phoneError" style="color: red; font-size: 0.9rem;"></span>

                                </div>
                            </div>

                            <!-- Chọn tỉnh -->
                            <div class="row mb-3 align-items-center">
                                <label for="province" class="col-md-3 col-form-label fw-bold">Tỉnh</label>
                                <div class="col-md-9">
                                    <select name="province" id="province" class="form-select" required onchange="loadDistricts()">
                                        <option value="">Chọn tỉnh</option>
                                        <option value="Hanoi">Hà Nội</option>
                                        <option value="HCM">Hồ Chí Minh</option>
                                        <option value="DaNang">Đà Nẵng</option>
                                    </select>
                                </div>
                            </div>

                            <!-- Chọn huyện -->
                            <div class="row mb-3 align-items-center">
                                <label for="district" class="col-md-3 col-form-label fw-bold">Huyện</label>
                                <div class="col-md-9">
                                    <select name="district" id="district" class="form-select" required onchange="loadWards()">
                                        <option value="">Chọn huyện</option>
                                    </select>
                                </div>
                            </div>

                            <!-- Chọn xã -->
                            <div class="row mb-3 align-items-center">
                                <label for="ward" class="col-md-3 col-form-label fw-bold">Xã</label>
                                <div class="col-md-9">
                                    <select name="ward" id="ward" class="form-select" required>
                                        <option value="">Chọn xã</option>
                                    </select>
                                </div>
                            </div>

                            <!-- Input ẩn lưu địa chỉ đầy đủ -->
                            <input type="hidden" name="address" id="fullAddress">

                            <!-- Nút Thêm mới -->
                            <div class="row">
                                <div class="col-md-9 offset-md-3">
                                    <button type="submit" class="btn btn-success px-4">Thêm mới</button>
                                </div>
                            </div>
                        </form>

                        <form action="address?action=update" method="post">
                            <table style="width: 100%; margin-top: 3rem;" class="address-table">
                                <thead>
                                    <tr>
                                        <th>Tên</th>
                                        <th>Điện thoại</th>
                                        <th>Địa chỉ</th>
                                        <th>Thao tác</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="addr" items="${addresses}">
                                        <tr>
                                            <td>
                                                <input type="text" name="name" value="${addr.name}" maxlength="255" class="form-item__shopname-output--input" style="width: 100%">
                                                <input type="hidden" name="id" value="${addr.id}">
                                            </td>
                                            <td>
                                                <input type="text" name="phone" value="0${addr.phone}" maxlength="255" class="form-item__shopname-output--input" style="width: 100%">
                                            </td>
                                            <td>
                                                <input type="text" name="address" value="<c:out value='${addr.address}'/>" maxlength="255" class="form-item__shopname-output--input" style="width: 100%">
                                            </td>   
                                            <td>
                                                <button type="submit" class="btn__small btn__small--primary">Cập nhật</button>
                                                <button type="button" class="btn btn__small btn-danger" onclick="confirmDelete('${addr.id}')">Xóa</button>

                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </form>
                    </div>
                </div>
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
        </form>

    </c:if>
    <style>
        .profile__form {
            max-height: 500px; /* Giới hạn chiều cao để kích hoạt cuộn */
            overflow-y: auto; /* Cho phép cuộn theo chiều dọc */
            padding-right: 10px;
        }

    </style>

</div>
</body>

<script>
    function confirmDelete(addressId) {
        if (!addressId || addressId.trim() === "" || isNaN(addressId)) {
            alert("Lỗi: ID không hợp lệ!");
            return;
        }
        let confirmAction = confirm("Bạn có chắc chắn muốn xóa địa chỉ này?");
        if (confirmAction) {
            window.location.href = `address?action=delete&id=` + addressId;
        }
    }
    function validatePhoneNumber() {
        let phoneInput = document.getElementById("phone");
        let phoneError = document.getElementById("phoneError");
        let phoneNumber = phoneInput.value.trim();

        if (!/^\d{10}$/.test(phoneNumber)) {
            phoneError.innerText = "Số điện thoại phải có đúng 10 chữ số!";
            phoneInput.style.borderColor = "red";
        } else {
            phoneError.innerText = "";
            phoneInput.style.borderColor = "";
        }
    }


</script>

<%@ include file="footer.jsp" %>
</html>
