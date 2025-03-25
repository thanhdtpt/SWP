<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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

        <link href='http://fonts.googleapis.com/css?family=Lato' rel='stylesheet' type='text/css'>
        <!-- Theme style -->
        <link href="seller/css/style.css" rel="stylesheet" type="text/css" />
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
          <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
        <![endif]-->
        <style>
            .form-actions {
                display: flex;
                align-items: center;
                justify-content: flex-start;
                margin-left: 210px;
                flex-direction: column;
                align-items: flex-start;
            }
        </style>
    </head>
    <body class="skin-black">
        <!-- header logo: style can be found in header.less -->
        <header class="header">
            <a href="home.jsp" class="logo">
                <!-- Add the class icon to your logo image or logo icon to add the margining -->
                EZ Shop
            </a>
            <!-- Header Navbar: style can be found in header.less -->
            <nav class="navbar navbar-static-top" role="navigation">
                <div class="navbar-right">
                    <ul class="nav navbar-nav">
                        <li class="dropdown user user-menu">

                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <i class="fa fa-user"></i>
                                <span>${sessionScope.shop.name} <i class="caret"></i></span>
                            </a>
                            <ul class="dropdown-menu dropdown-custom dropdown-menu-right">
                                <li class="dropdown-header text-center">Account</li>

                                <li class="divider"></li>

                                <li>
                                    <a href="#">
                                        <i class="fa fa-user fa-fw pull-right"></i>
                                        Profile
                                    </a>
                                    <a data-toggle="modal" href="#modal-user-settings">
                                        <i class="fa fa-cog fa-fw pull-right"></i>
                                        Settings
                                    </a>
                                </li>

                                <li class="divider"></li>

                                <li>
                                    <a href="<%= request.getContextPath() %>/logout"><i class="fa fa-ban fa-fw pull-right"></i> Logout</a>
                                </li>
                            </ul>

                        </li>
                    </ul>
                </div>
            </nav>
        </header>
        <div class="wrapper row-offcanvas row-offcanvas-left">
            <!-- Left side column. contains the logo and sidebar -->
            <aside class="left-side sidebar-offcanvas">
                <!-- sidebar: style can be found in sidebar.less -->
                <section class="sidebar">
                    <!-- Sidebar user panel -->
                    <div class="user-panel">
                        <div class="pull-left image">
                            <img src="${sessionScope.shop.avatar}" class="img-circle" alt="User Image" />
                        </div>
                        <div class="pull-left info">
                            <p>Hi, </p> <span>${sessionScope.shop.name}</span>
                            <br>
                            <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
                        </div>
                    </div>
                     <ul class="sidebar-menu">
                        <li>
                            <a href="seller/home.jsp">
                                <i class="fa fa-dashboard"></i> <span>Dashboard</span>
                            </a>
                        </li>
                        <li class="active">
                            <a href="<%= request.getContextPath() %>/manage-product">
                                <i class="fa fa-gavel"></i> <span>Manage Product</span>
                            </a>
                        </li>
                        <li><a href="<%= request.getContextPath() %>/manage-wallet"><i class="fa fa-money"></i> <span>Manage Wallet</span></a></li>
                        <li >
                            <a href="<%= request.getContextPath() %>/shop-profile">
                                <i class="fa fa-user"></i> <span>Shop Profile</span>
                            </a>
                        </li>
                        <li >
                            <a href="<%= request.getContextPath() %>/manage-orders">
                                <i class="fa fa-user"></i> <span>List Order</span>
                            </a>
                        </li>
                    </ul>
                </section>
                <!-- /.sidebar -->
            </aside>

            <!-- Right side column. Contains the navbar and content of the page -->
            <aside class="right-side">
                <!-- Content Header (Page header) -->


                <!-- Main content -->
                <section class="content">
                    <div class="row">
                        <div class="col-md-12">
                            <section class="panel">
                                <header class="panel-heading">
                                    Form Elements
                                </header>
                                <div class="panel-body">
                                    <form class="form-horizontal tasi-form" method="POST" action="create-product" onsubmit="return validateForm()" >
                                        <!-- Tên sản phẩm -->
                                        <c:if test="${not empty product}">
                                            <input type="hidden" name="id" value="${product.id}">
                                        </c:if> 

                                        <div class="form-group">
                                            <label class="col-sm-2 col-sm-2 control-label">Name</label>
                                            <div class="col-sm-4">
                                                <input type="text" class="form-control" name="productname" value="${product.productname}">
                                                <span id="nameError" class="text-danger"></span>
                                            </div>
                                        </div>

                                        <!-- Danh mục sản phẩm -->
                                        <div class="form-group">
                                            <label class="col-sm-2 col-sm-2 control-label">Category</label>
                                            <div class="col-lg-4">
                                                <select class="form-control m-b-4" name="category">
                                                    <option value="">Chọn danh mục</option>
                                                    <c:forEach var="category" items="${listC}">
                                                        <option value="${category.id}" ${product.categories.id == category.id ? 'selected' : ''}>${category.name}</option>
                                                    </c:forEach>
                                                </select>
                                                <span id="categoryError" class="text-danger"></span>
                                            </div>
                                        </div>

                                        <!-- Xuất xứ -->
                                        <div class="form-group">
                                            <label class="col-sm-2 col-sm-2 control-label">Origin</label>
                                            <div class="col-sm-4">
                                                <input type="text" class="form-control" name="origin" value="${product.origin}">
                                                <span id="originError" class="text-danger"></span>
                                            </div>
                                        </div>

                                        <!-- Thương hiệu -->
                                        <div class="form-group">
                                            <label class="col-sm-2 col-sm-2 control-label">Brand</label>
                                            <div class="col-sm-4">
                                                <input type="text" class="form-control" name="brand" value="${product.brand}">
                                                <span id="brandError" class="text-danger"></span>
                                            </div>
                                        </div>

                                        <!-- Ảnh sản phẩm -->
                                        <div class="form-group">
                                            <label class="col-lg-2 col-sm-2 control-label">Images</label>
                                            <div class="col-lg-4">
                                                <input type="file" id="imageInput" name="images1" accept="image/png, image/jpeg, image/jpg" onchange="validateImage()">
                                                <c:if test="${not empty product.images1}">
                                                    <img src="${product.images1}" alt="Product Image" width="100">
                                                </c:if>
                                                <span id="imageError" class="text-danger"></span>
                                            </div>
                                        </div>

                                        <!-- Mô tả sản phẩm -->
                                        <div class="form-group">
                                            <label class="col-sm-2 col-sm-2 control-label">Describe</label>
                                            <div class="col-sm-4">
                                                <input type="text" class="form-control" name="describe" value="${product.describe}">
                                                <span id="describeError" class="text-danger"></span>
                                            </div>
                                        </div>

                                        <!-- Giá cũ -->
                                        <div class="form-group">
                                            <label class="col-sm-2 col-sm-2 control-label">Old Price</label>
                                            <div class="col-sm-4">
                                                <input type="number" class="form-control" name="oldPrice" value="${product.oldPrice}">
                                                <span id="oldPriceError" class="text-danger"></span>
                                            </div>
                                        </div>

                                        <!-- Giá hiện tại -->
                                        <div class="form-group">
                                            <label class="col-sm-2 col-sm-2 control-label">Current Price</label>
                                            <div class="col-sm-4">
                                                <input type="number" class="form-control" name="currentPrice" value="${product.currentPrice}">
                                                <span id="currentPriceError" class="text-danger"></span>
                                            </div>
                                        </div>

                                        <!-- Số lượng mỗi đơn vị -->
                                        <div class="form-group">
                                            <label class="col-lg-2 col-sm-2 control-label">Quantity Per Unit</label>
                                            <div class="col-lg-4">
                                                <input type="number" class="form-control" name="quantityPerUnit" value="${product.quantityPerUnit}">
                                                <span id="quantityPerUnitError" class="text-danger"></span>
                                            </div>
                                        </div>

                                        <!-- Số lượng trong kho -->
                                        <div class="form-group">
                                            <label class="col-sm-2 col-sm-2 control-label">Unit In Stock</label>
                                            <div class="col-sm-4">
                                                <input type="number" class="form-control" name="unitInStock" value="${product.unitInstock}">
                                                <span id="unitInStockError" class="text-danger"></span>
                                            </div>
                                        </div>

                                        <!-- Đơn hàng tồn -->
                                        <div class="form-group">
                                            <label class="col-sm-2 col-sm-2 control-label">Unit On Order</label>
                                            <div class="col-sm-4">
                                                <input type="number" class="form-control" name="unitOnOrder" value="${product.unitOnOrder}">
                                                <span id="unitOnOrderError" class="text-danger"></span>
                                            </div>
                                        </div>

                                        <!-- Nút Submit -->
                                        <div class="form-actions">
                                            <button type="submit" class="btn btn-info">
                                                <c:choose>
                                                    <c:when test="${not empty product}">Cập Nhật</c:when>
                                                    <c:otherwise>Tạo</c:otherwise>
                                                </c:choose>
                                            </button>
                                        </div>

                                    </form>

                                    <c:if test="${not empty message}">
                                        <div class="alert alert-info" style="margin-top: 5px; width: 50%">
                                            <strong>${message}</strong>
                                        </div>
                                    </c:if>
                                </div>
                            </section
                        </div>
                    </div>

                </section><!-- /.content -->
            </aside><!-- /.right-side -->
        </div><!-- ./wrapper -->
        <!-- jQuery 2.0.2 -->
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
        <script src="js/jquery.min.js" type="text/javascript"></script>

        <!-- Bootstrap -->
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <!-- Director App -->
        <script src="js/Director/app.js" type="text/javascript"></script>
        <script>
                                                    function validateForm() {
                                                        let isValid = true;

                                                        // Lấy giá trị của input
                                                        let name = document.querySelector("input[name='productname']").value.trim();
                                                        let category = document.querySelector("select[name='category']").value;
                                                        let origin = document.querySelector("input[name='origin']").value.trim();
                                                        let brand = document.querySelector("input[name='brand']").value.trim();
                                                        let describe = document.querySelector("input[name='describe']").value.trim();
                                                        let oldPrice = document.querySelector("input[name='oldPrice']").value;
                                                        let currentPrice = document.querySelector("input[name='currentPrice']").value;
                                                        let quantity = document.querySelector("input[name='quantityPerUnit']").value;
                                                        let unitInStock = document.querySelector("input[name='unitInStock']").value;
                                                        let unitOnOrder = document.querySelector("input[name='unitOnOrder']").value;
                                                        let image = document.getElementById("imageInput").files[0];

                                                        // Xóa thông báo lỗi cũ
                                                        let errorFields = [
                                                            "nameError", "categoryError", "originError", "brandError", "imageError",
                                                            "describeError", "oldPriceError", "currentPriceError", "quantityPerUnitError",
                                                            "unitInStockError", "unitOnOrderError"
                                                        ];

                                                        errorFields.forEach(field => document.getElementById(field).innerText = "");

                                                        // Kiểm tra tên sản phẩm
                                                        if (name === "") {
                                                            document.getElementById("nameError").innerText = "Tên sản phẩm không được để trống!";
                                                            isValid = false;
                                                        }

                                                        // Kiểm tra danh mục
                                                        if (category === "") {
                                                            document.getElementById("categoryError").innerText = "Vui lòng chọn danh mục!";
                                                            isValid = false;
                                                        }

                                                        // Kiểm tra xuất xứ
                                                        if (origin === "") {
                                                            document.getElementById("originError").innerText = "Vui lòng nhập xuất xứ!";
                                                            isValid = false;
                                                        }

                                                        // Kiểm tra thương hiệu
                                                        if (brand === "") {
                                                            document.getElementById("brandError").innerText = "Vui lòng nhập thương hiệu!";
                                                            isValid = false;
                                                        }

                                                        // Kiểm tra mô tả
                                                        if (describe === "") {
                                                            document.getElementById("describeError").innerText = "Vui lòng nhập mô tả!";
                                                            isValid = false;
                                                        }

                                                        // Kiểm tra giá cũ (không bắt buộc nhưng phải >= 0 nếu nhập)
                                                        if (oldPrice !== "" && oldPrice < 0) {
                                                            document.getElementById("oldPriceError").innerText = "Giá cũ không được âm!";
                                                            isValid = false;
                                                        }

                                                        // Kiểm tra giá hiện tại
                                                        if (currentPrice === "" || currentPrice <= 0) {
                                                            document.getElementById("currentPriceError").innerText = "Giá phải lớn hơn 0!";
                                                            isValid = false;
                                                        }

                                                        // Kiểm tra số lượng mỗi đơn vị
                                                        if (quantity === "" || quantity <= 0) {
                                                            document.getElementById("quantityPerUnitError").innerText = "Số lượng phải lớn hơn 0!";
                                                            isValid = false;
                                                        }

                                                        // Kiểm tra số lượng trong kho
                                                        if (unitInStock === "" || unitInStock < 0) {
                                                            document.getElementById("unitInStockError").innerText = "Số lượng trong kho không được âm!";
                                                            isValid = false;
                                                        }

                                                        // Kiểm tra số lượng đơn hàng tồn
                                                        if (unitOnOrder === "" || unitOnOrder < 0) {
                                                            document.getElementById("unitOnOrderError").innerText = "Số lượng đơn hàng tồn không được âm!";
                                                            isValid = false;
                                                        }

                                                        // Kiểm tra ảnh đã được chọn chưa
                                                        if (!image) {
                                                            document.getElementById("imageError").innerText = "Vui lòng chọn ảnh sản phẩm!";
                                                            isValid = false;
                                                        }

                                                        return isValid;
                                                    }

        </script>
    </body>


</html>
