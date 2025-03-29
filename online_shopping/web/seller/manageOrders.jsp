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
            }
            .profile-heading {
                margin-bottom: 20px;
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
                            <img src="${sessionScope.shop.avatar}"  class="img-circle" alt="User Image" />
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
                        <li>
                            <a href="<%= request.getContextPath()%>/shop-profile">
                                <i class="fa fa-user"></i> <span>Shop Profile</span>
                            </a>
                        </li>
                        <li class="active">
                            <a href="<%= request.getContextPath()%>/manage-orders" href="shop-profile">
                                <i class="fa fa-user"></i> <span>List Order</span>
                            </a>
                        </li>
                    </ul>
                </section>
            </aside>

            <!-- Right side -->
            <aside class="right-side">
                <section class="content">
                    <h1>Orders of ${sessionScope.shop.name}</h1>
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th>Order ID</th>
                                <th>Product Name</th>
                                <th>Quantity</th>
                                <th>Price</th>
                                <th>Status</th>
<!--                                <th>Order Date</th>
                                <th>Shipped Date</th>
                                <th>Actions</th>-->
                            </tr>
                        </thead>
                        <tbody>
                            <!-- Lặp qua danh sách các chi tiết đơn hàng (orderDetails) của shop -->
                            <c:forEach var="orderDetail" items="${orderDetails}">
                                <tr>
                                    <td>${orderDetail.oid}</td> <!-- Order ID -->
                                    <td>${orderDetail.product.productname}</td> <!-- Tên sản phẩm -->
                                    <td>${orderDetail.quantity}</td> <!-- Số lượng -->
                                    <td>${orderDetail.product.currentPrice}</td> <!-- Giá sản phẩm -->
                                    <td><span class="label label-${orderDetail.status ? 'success' : 'warning'}">
                                            ${orderDetail.status ? 'Shipped' : 'Pending'}</span></td> <!-- Trạng thái -->
<!--                                    <td><fmt:formatDate value="${orderDetail.product.createdDate}" pattern="dd/MM/yyyy" /></td>  Ngày đặt 
                            <td><fmt:formatDate value="${orderDetail.product.updatedDate}" pattern="dd/MM/yyyy" /></td>  Ngày giao 
                            <td>
                                <a href="view-order-details?id=${orderDetail.oid}" class="btn btn-info btn-sm">View</a>  Xem chi tiết 
                            </td>-->
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </section>
            </aside>
        </div>

        <!-- Scripts -->
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
        <script src="seller/js/jquery.min.js" type="text/javascript"></script>
        <script src="seller/js/jquery-ui-1.10.3.min.js" type="text/javascript"></script>
        <script src="seller/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="seller/js/plugins/daterangepicker/daterangepicker.js" type="text/javascript"></script>
        <script src="seller/js/plugins/chart.js" type="text/javascript"></script>
        <script src="seller/js/plugins/iCheck/icheck.min.js" type="text/javascript"></script>
        <script src="seller/js/plugins/fullcalendar/fullcalendar.js" type="text/javascript"></script>
        <script src="seller/js/Director/app.js" type="text/javascript"></script>
        <script src="seller/js/Director/dashboard.js" type="text/javascript"></script>
    </body>
</html>
