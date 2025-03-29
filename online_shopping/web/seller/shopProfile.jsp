<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Director | Dashboard</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        <meta name="description" content="Developed By M Abdur Rokib Promy">
        <meta name="keywords" content="Admin, Bootstrap 3, Template, Theme, Responsive">
        <!-- bootstrap 3.0.2 -->
        <link href="seller/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <!-- font Awesome -->
        <link href="seller/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
        <!-- Ionicons -->
        <link href="seller/css/ionicons.min.css" rel="stylesheet" type="text/css" />
        <!-- Morris chart -->
        <link href="seller/css/morris/morris.css" rel="stylesheet" type="text/css" />
        <!-- jvectormap -->
        <link href="seller/css/jvectormap/jquery-jvectormap-1.2.2.css" rel="stylesheet" type="text/css" />
        <!-- Date Picker -->
        <link href="seller/css/datepicker/datepicker3.css" rel="stylesheet" type="text/css" />
        <!-- Daterange picker -->
        <link href="seller/css/daterangepicker/daterangepicker-bs3.css" rel="stylesheet" type="text/css" />
        <!-- iCheck for checkboxes and radio inputs -->
        <link href="seller/css/iCheck/all.css" rel="stylesheet" type="text/css" />
        <!-- Theme style -->
        <link href="seller/css/style.css" rel="stylesheet" type="text/css" />

        <!-- Google Font -->
        <link href='http://fonts.googleapis.com/css?family=Lato' rel='stylesheet' type='text/css'>
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
          <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
        <![endif]-->

        <!-- Style tuỳ chỉnh riêng cho phần profile -->
        <style>
            .profile-container {
                background-color: #fff;
                padding: 20px;
                box-shadow: 0 0 2px #ccc;
                margin-top: 20px;
                margin-bottom: 20px;
            }
            .profile-heading {
                margin-bottom: 20px;
                padding-bottom: 10px;
                border-bottom: 1px solid #eee;
            }
            .avatar-preview {
                width: 120px;
                height: 120px;
                border-radius: 50%;
                object-fit: cover;
                margin-bottom: 10px;
                border: 2px solid #ccc;
            }
            .profile-form label {
                font-weight: bold;
            }
            .profile-form input {
                margin-bottom: 15px;
            }
            .profile-form button {
                margin-top: 10px;
                margin-right: 10px;
            }
            /* Style cho phần đổi mật khẩu */
            .password-container {
                background-color: #fff;
                padding: 20px;
                box-shadow: 0 0 2px #ccc;
                margin-bottom: 20px;
            }
            .password-heading {
                margin-bottom: 20px;
                padding-bottom: 10px;
                border-bottom: 1px solid #eee;
            }
            .password-form label {
                font-weight: bold;
            }
            .password-form input {
                margin-bottom: 15px;
            }
            .password-strength {
                height: 5px;
                margin-bottom: 15px;
                transition: all 0.3s;
            }
            .password-strength-text {
                font-size: 12px;
                margin-bottom: 15px;
            }
            .password-rules {
                font-size: 12px;
                color: #666;
                margin-bottom: 15px;
            }
            .weak {
                background-color: #ff4d4d;
                width: 33%;
            }
            .medium {
                background-color: #ffaa00;
                width: 66%;
            }
            .strong {
                background-color: #00cc44;
                width: 100%;
            }
            .nav-tabs {
                margin-bottom: 20px;
            }
            .error-message {
                color: #ff4d4d;
                font-size: 12px;
                display: block;
                margin-top: 5px;
            }
            .input-error {
                border-color: #ff4d4d !important;
            }
            .password-criteria {
                margin-top: 10px;
                padding: 10px;
                background-color: #f8f8f8;
                border-radius: 4px;
            }
            .criteria-item {
                display: flex;
                align-items: center;
                margin-bottom: 5px;
                font-size: 12px;
            }
            .criteria-item i {
                margin-right: 5px;
            }
            .criteria-valid {
                color: #00cc44;
            }
            .criteria-invalid {
                color: #999;
            }
            .toggle-password {
                cursor: pointer;
                position: absolute;
                right: 10px;
                top: 10px;
                z-index: 10;
            }
            .input-group {
                position: relative;
            }
        </style>
    </head>

    <body class="skin-black">
        <!-- Header -->
        <header class="header">
            <a href="home.jsp" class="logo">
                EZ Shop
            </a>
            <nav class="navbar navbar-static-top" role="navigation">
                <div class="navbar-right">
                    <ul class="nav navbar-nav">
                        <!-- User Account -->
                        <li class="dropdown user user-menu">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <i class="fa fa-user"></i>
                                <span>${sessionScope.shop.name} <i class="caret"></i></span>
                            </a>
                            <ul class="dropdown-menu dropdown-custom dropdown-menu-right">
                                <li class="dropdown-header text-center">Account</li>
                                <li class="divider"></li>
                                <li>
                                    <a href="shop-profile">
                                        <i class="fa fa-user fa-fw pull-right"></i>
                                        Profile
                                    </a>
                                </li>
                                <li class="divider"></li>
                                <li>
                                    <a href="<%= request.getContextPath()%>/logout">
                                        <i class="fa fa-ban fa-fw pull-right"></i> Logout
                                    </a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </nav>
        </header>

        <div class="wrapper row-offcanvas row-offcanvas-left">
            <!-- Left sidebar -->
            <aside class="left-side sidebar-offcanvas">
                <section class="sidebar">
                    <div class="user-panel">
                        <div class="pull-left image">
                            <img src="<c:out value='${shop.avatar}'/>"  class="img-circle" alt="User Image" />
                        </div>
                        <div class="pull-left info">
                            <p>Hi,</p>
                            <span>${sessionScope.shop.name}</span>
                            <br>
                            <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
                        </div>
                    </div>
                    <ul class="sidebar-menu">
                        <li>
                            <a href="<%= request.getContextPath()%>/DashboarchSellerServlet">
                                <i class="fa fa-dashboard"></i> <span>Dashboard</span>
                            </a>
                        </li>
                        <li>
                            <a href="<%= request.getContextPath()%>/manage-product">
                                <i class="fa fa-gavel"></i> <span>Manage Product</span>
                            </a>
                        </li>
                        <li>
                            <a href="<%= request.getContextPath()%>/manage-wallet">
                                <i class="fa fa-money"></i> <span>Manage Wallet</span>
                            </a>
                        </li>
                        <li class="active">
                            <a href="shop-profile">
                                <i class="fa fa-user"></i> <span>Shop Profile</span>
                            </a>
                        </li>
                        <li >
                            <a href="<%= request.getContextPath()%>/manage-orders">
                                <i class="fa fa-user"></i> <span>List Order</span>
                            </a>
                        </li>
                    </ul>
                </section>
            </aside>

            <!-- Right side -->
            <aside class="right-side">
                <section class="content">
                    <!-- Tabs Navigation -->
                    <ul class="nav nav-tabs">
                        <li class="active"><a href="#profile" data-toggle="tab"><i class="fa fa-user"></i> Thông tin Shop</a></li>
                        <li><a href="#password" data-toggle="tab"><i class="fa fa-lock"></i> Đổi mật khẩu</a></li>
                    </ul>

                    <!-- Tab Content -->
                    <div class="tab-content">
                        <!-- Profile Tab -->
                        <div class="tab-pane active" id="profile">
                            <div class="profile-container">
                                <h2 class="profile-heading">Thông tin hồ sơ Shop</h2>

                                <!-- Form cập nhật hồ sơ Shop -->
                                <form action="shop-profile" method="post" enctype="multipart/form-data" class="profile-form">
                                    <!-- Avatar hiển thị trước -->
                                    <img 
                                        id="avatarPreview" 
                                        class="avatar-preview" 
                                        src="<c:out value='${shop.avatar}'/>" 
                                        alt="Shop Avatar"
                                        >
                                    <br>
                                    <label for="avatar">Logo/Ảnh đại diện:</label>
                                    <input 
                                        type="file" 
                                        name="avatar" 
                                        id="avatar" 
                                        accept="image/*"
                                        />

                                    <label for="shopName">Tên Shop:</label>
                                    <input 
                                        type="text" 
                                        name="shopName" 
                                        id="shopName"
                                        value="${shop.name}" 
                                        class="form-control"
                                        />

                                    <label for="city">Thành phố:</label>
                                    <input 
                                        type="text" 
                                        name="city" 
                                        id="city"
                                        value="${shop.city}" 
                                        class="form-control"
                                        />

                                    <label for="address">Địa chỉ:</label>
                                    <input 
                                        type="text" 
                                        name="address" 
                                        id="address"
                                        value="${shop.address}" 
                                        class="form-control"
                                        />

                                    <label for="phone">Số điện thoại:</label>
                                    <input 
                                        type="text" 
                                        name="phone" 
                                        id="phone"
                                        value="${shop.phone}" 
                                        class="form-control"
                                        />

                                    <!-- Nếu muốn hiển thị Username (hoặc Email) liên kết account -->
                                    <label for="userName">Tài khoản:</label>
                                    <input 
                                        type="text" 
                                        name="userName" 
                                        id="userName" 
                                        value="${shop.username}" 
                                        class="form-control" 
                                        readonly
                                        />

                                    <!-- Thông báo lỗi/thành công nếu có -->
                                    <c:if test="${not empty message}">
                                        <p style="color: green;">${message}</p>
                                    </c:if>
                                    <c:if test="${not empty error}">
                                        <p style="color: red;">${error}</p>
                                    </c:if>

                                    <button type="submit" class="btn btn-primary">
                                        <i class="fa fa-save"></i> Cập nhật thông tin
                                    </button>
                                </form>
                            </div>
                        </div>

                        <!-- Password Tab -->
                        <div class="tab-pane" id="password">
                            <div class="password-container">
                                <h2 class="password-heading">Đổi mật khẩu</h2>

                                <!-- Form đổi mật khẩu -->
                                <form action="shop-change-password" method="post" class="password-form" id="passwordForm">

                                    <!-- Mật khẩu hiện tại -->
                                    <div class="form-item">
                                        <label for="currentPassword">Mật khẩu hiện tại</label>
                                        <div class="input-group">
                                            <input 
                                                type="password" 
                                                id="currentPassword" 
                                                name="currentPassword" 
                                                placeholder="Nhập mật khẩu hiện tại" 
                                                class="form-control" 
                                                required 
                                                />
                                            <i class="fa fa-eye toggle-password"></i>
                                            <span class="error-message"></span>
                                        </div>
                                    </div>

                                    <!-- Mật khẩu mới -->
                                    <div class="form-item">
                                        <label for="newPassword">Mật khẩu mới</label>
                                        <div class="input-group">
                                            <input 
                                                type="password" 
                                                id="newPassword" 
                                                name="newPassword" 
                                                placeholder="Nhập mật khẩu mới" 
                                                class="form-control" 
                                                required 
                                                />
                                            <i class="fa fa-eye toggle-password"></i>
                                            <span class="error-message"></span>
                                        </div>
                                        
                                        <!-- Thanh độ mạnh mật khẩu -->
                                        <div class="password-strength" id="passwordStrength"></div>
                                        <span class="password-strength-text" id="passwordStrengthText"></span>
                                        
                                        <!-- Các tiêu chí mật khẩu -->
                                        <div class="password-criteria">
                                            <div class="criteria-item" id="length-criteria">
                                                <i class="fa fa-circle-o"></i> Ít nhất 8 ký tự
                                            </div>
                                            <div class="criteria-item" id="uppercase-criteria">
                                                <i class="fa fa-circle-o"></i> Ít nhất 1 chữ cái in hoa
                                            </div>
                                            <div class="criteria-item" id="number-criteria">
                                                <i class="fa fa-circle-o"></i> Ít nhất 1 chữ số
                                            </div>
                                            <div class="criteria-item" id="special-criteria">
                                                <i class="fa fa-circle-o"></i> Ít nhất 1 ký tự đặc biệt
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Xác nhận mật khẩu mới -->
                                    <div class="form-item">
                                        <label for="confirmPassword">Nhập lại mật khẩu mới</label>
                                        <div class="input-group">
                                            <input 
                                                type="password" 
                                                id="confirmPassword" 
                                                name="confirmPassword" 
                                                placeholder="Nhập lại mật khẩu" 
                                                class="form-control" 
                                                required 
                                                />
                                            <i class="fa fa-eye toggle-password"></i>
                                            <span class="error-message"></span>
                                        </div>
                                    </div>

                                    <div class="form-submit">
                                        <button type="submit" class="btn btn-primary">
                                            <i class="fa fa-save"></i> Lưu thay đổi
                                        </button>
                                    </div>

                                    <c:if test="${not empty requestScope.passwordMessage}">
                                        <p class="success-message" style="color: green; font-size: 14px; margin-top: 15px;">
                                            <i class="fa fa-check-circle"></i> ${requestScope.passwordMessage}
                                        </p>
                                    </c:if>

                                    <c:if test="${not empty requestScope.passwordError}">
                                        <p class="error-message" style="color: red; font-size: 14px; margin-top: 15px;">
                                            <i class="fa fa-exclamation-circle"></i> ${requestScope.passwordError}
                                        </p>
                                    </c:if>
                                </form>
                            </div>
                        </div>
                    </div>
                </section>
            </aside>
        </div>

        <!-- jQuery 2.0.2 -->
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
        <!-- jQuery UI 1.10.3 -->
        <script src="seller/js/jquery-ui-1.10.3.min.js" type="text/javascript"></script>
        <!-- Bootstrap -->
        <script src="seller/js/bootstrap.min.js" type="text/javascript"></script>

        <script>
            document.addEventListener("DOMContentLoaded", function () {
                // Hiển thị ảnh đại diện khi upload
                document.getElementById('avatar').addEventListener('change', function(e) {
                    const file = e.target.files[0];
                    if (file) {
                        const reader = new FileReader();
                        reader.onload = function(event) {
                            document.getElementById('avatarPreview').src = event.target.result;
                        };
                        reader.readAsDataURL(file);
                    }
                });
                
                // Hàm hiển thị thông báo lỗi
                function showError(input, message) {
                    let errorSpan = input.parentNode.querySelector(".error-message");
                    if (!errorSpan) {
                        errorSpan = document.createElement("span");
                        errorSpan.classList.add("error-message");
                        input.parentNode.appendChild(errorSpan);
                    }
                    input.classList.add("input-error");
                    errorSpan.innerText = message;
                }

                // Hàm xóa thông báo lỗi
                function clearError(input) {
                    let errorSpan = input.parentNode.querySelector(".error-message");
                    if (errorSpan) {
                        errorSpan.innerText = "";
                    }
                    input.classList.remove("input-error");
                }

                // Kiểm tra độ mạnh mật khẩu và cập nhật trực quan
                function checkPasswordStrength(password) {
                    // Kiểm tra các tiêu chí
                    const hasLength = password.length >= 8;
                    const hasUpperCase = /[A-Z]/.test(password);
                    const hasNumber = /[0-9]/.test(password);
                    const hasSpecial = /[!@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?]/.test(password);
                    
                    // Cập nhật UI cho các tiêu chí
                    updateCriteriaUI('length-criteria', hasLength);
                    updateCriteriaUI('uppercase-criteria', hasUpperCase);
                    updateCriteriaUI('number-criteria', hasNumber);
                    updateCriteriaUI('special-criteria', hasSpecial);
                    
                    // Tính độ mạnh dựa trên số tiêu chí đạt được
                    let strength = 0;
                    if (hasLength) strength++;
                    if (hasUpperCase) strength++;
                    if (hasNumber) strength++;
                    if (hasSpecial) strength++;
                    
                    // Cập nhật thanh độ mạnh và thông báo
                    const strengthBar = document.getElementById('passwordStrength');
                    const strengthText = document.getElementById('passwordStrengthText');
                    
                    if (password.length === 0) {
                        strengthBar.className = 'password-strength';
                        strengthBar.style.width = '0';
                        strengthText.innerText = '';
                    } else if (strength <= 2) {
                        strengthBar.className = 'password-strength weak';
                        strengthText.innerText = 'Yếu';
                        strengthText.style.color = '#ff4d4d';
                    } else if (strength === 3) {
                        strengthBar.className = 'password-strength medium';
                        strengthText.innerText = 'Trung bình';
                        strengthText.style.color = '#ffaa00';
                    } else {
                        strengthBar.className = 'password-strength strong';
                        strengthText.innerText = 'Mạnh';
                        strengthText.style.color = '#00cc44';
                    }
                    
                    return strength;
                }
                
                // Cập nhật giao diện cho các tiêu chí
                function updateCriteriaUI(id, isValid) {
                    const element = document.getElementById(id);
                    const icon = element.querySelector('i');
                    
                    if (isValid) {
                        element.classList.add('criteria-valid');
                        element.classList.remove('criteria-invalid');
                        icon.className = 'fa fa-check-circle';
                    } else {
                        element.classList.add('criteria-invalid');
                        element.classList.remove('criteria-valid');
                        icon.className = 'fa fa-circle-o';
                    }
                }

                // Validate mật khẩu
                function validatePassword() {
                    let currentPassword = document.getElementById('currentPassword');
                    let newPassword = document.getElementById('newPassword');
                    let confirmPassword = document.getElementById('confirmPassword');
                    let isValid = true;

                    // Kiểm tra mật khẩu mới
                    const strength = checkPasswordStrength(newPassword.value);
                    
                    if (strength < 4) {
                        showError(newPassword, "Mật khẩu chưa đáp ứng đủ các yêu cầu an toàn");
                        isValid = false;
                    } else {
                        clearError(newPassword);
                    }

                    // Kiểm tra trùng với mật khẩu cũ
                    if (newPassword.value === currentPassword.value && newPassword.value !== '') {
                        showError(newPassword, "Mật khẩu mới không được trùng với mật khẩu hiện tại");
                        isValid = false;
                    }

                    // Kiểm tra xác nhận mật khẩu
                    if (newPassword.value !== confirmPassword.value) {
                        showError(confirmPassword, "Xác nhận mật khẩu không khớp");
                        isValid = false;
                    } else {
                        clearError(confirmPassword);
                    }

                    return isValid;
                }

                // Bật theo dõi sự kiện cho password strength khi nhập
                document.getElementById('newPassword').addEventListener('input', function() {
                    checkPasswordStrength(this.value);
                });

                // Kiểm tra validate khi blur từ input
                document.getElementById('newPassword').addEventListener('blur', validatePassword);
                document.getElementById('confirmPassword').addEventListener('blur', validatePassword);

                // Submit form
                document.getElementById('passwordForm').addEventListener('submit', function(e) {
                    if (!validatePassword()) {
                        e.preventDefault();
                    }
                });

                // Bật/tắt hiển thị mật khẩu
                document.querySelectorAll('.toggle-password').forEach(function(toggle) {
                    toggle.addEventListener('click', function() {
                        const input = this.previousElementSibling;
                        if (input.type === 'password') {
                            input.type = 'text';
                            this.classList.remove('fa-eye');
                            this.classList.add('fa-eye-slash');
                        } else {
                            input.type = 'password';
                            this.classList.remove('fa-eye-slash');
                            this.classList.add('fa-eye');
                        }
                    });
                });
            });
        </script>
    </body>
</html>