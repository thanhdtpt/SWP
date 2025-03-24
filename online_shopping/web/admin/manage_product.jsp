<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Director | Simple Tables</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        <meta name="description" content="Developed By M Abdur Rokib Promy">
        <meta name="keywords" content="Admin, Bootstrap 3, Template, Theme, Responsive">
        <!-- bootstrap 3.0.2 -->
        <link href="seller/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <!-- font Awesome -->
        <link href="seller/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
        <!-- Ionicons -->
        <link href="seller/css/ionicons.min.css" rel="stylesheet" type="text/css" />
        <!-- google font -->
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
    </head>
    <body class="skin-black">
        <!-- header logo: style can be found in header.less -->
        <header class="header">
            <a href="seller/home.jsp" class="logo">
                <!-- Add the class icon to your logo image or logo icon to add the margining -->
                EZ Shop
            </a>
            <!-- Header Navbar: style can be found in header.less -->
            <nav class="navbar navbar-static-top" role="navigation">
                <!-- Sidebar toggle button-->

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
                                    <a href="<%= request.getContextPath()%>/logout><i class="fa fa-ban fa-fw pull-right"></i> Logout</a>
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
                            <img src="seller/img/26115.jpg" class="img-circle" alt="User Image" />
                        </div>
                        <div class="pull-left info">
                            <p>Hi, Admin </p>
                            <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
                        </div>
                    </div>

                    <ul class="sidebar-menu">
                        <li>
                            <a href="<%= request.getContextPath()%>/DashboarchAdminServlet">
                                <i class="fa fa-dashboard"></i> <span>Dashboard</span>
                            </a>
                        </li>
                        <li class="active">
                            <a href="<%= request.getContextPath()%>/admin-manage-product"">
                                <i class="fa fa-gavel"></i> <span>Manage Product</span>
                            </a>
                        </li>
                        <li>
                            <a href="<%= request.getContextPath()%>/manage-user"">
                                <i class="fa fa-users"></i> <span>Manage User</span>
                            </a>
                        </li>
                        <li><a href="<%= request.getContextPath()%>/manage-wallet"><i class="fa fa-money"></i> <span>Manage Wallet</span></a></li>


                    </ul>
                </section>
                <!-- /.sidebar -->
            </aside>

            <!-- Right side column. Contains the navbar and content of the page -->
            <aside class="right-side">
                <section class="content">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="panel">
                                <header class="panel-heading">
                                    Manage Products
                                </header>
                                <div class="panel-body table-responsive">
                                    <table class="table table-hover">
                                        <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th>Product Name</th>
                                                <th>Category</th>
                                                <th>Quantity</th>
                                                <th>Price</th>
                                                <th>Status</th>
                                                <th>Created Date</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <!-- Lặp qua danh sách sản phẩm -->
                                            <c:forEach var="product" items="${productList}">
                                                <tr>
                                                    <td>${product.id}</td>
                                                    <td>
                                                        ${product.productname}
                                                        <!-- Nếu muốn đánh dấu sản phẩm pending -->
                                                        <c:if test="${product.status == 'pending'}">
                                                            <span style="color:red;font-size: 15px;">*</span>
                                                        </c:if>
                                                    </td>
                                                    <td>${product.categories.name}</td>
                                                    <td>${product.quantityPerUnit}</td>
                                                    <td>${product.currentPrice}</td>
                                                    <td>
                                                        <!-- Hiển thị label màu tương ứng với status -->
                                                        <span class="label
                                                              ${product.status == 'approved' ? 'label-success'
                                                                : (product.status == 'pending' ? 'label-warning'
                                                                : (product.status == 'created' ? 'label-info' : 'label-default'))}">
                                                                  ${product.status}
                                                              </span>
                                                        </td>
                                                        <td>${product.createdDate}</td>
                                                        <td>
                                                            <!-- Nếu sản phẩm đang ở trạng thái 'created' thì hiện nút approve -->
                                                            <c:if test="${product.status == 'created'}">
                                                                <button class="btn btn-xs btn-success" 
                                                                        onclick="changeStatus(${product.id}, 'approve')">
                                                                    <i class="fa fa-check" style="color: white;"></i>
                                                                </button>
                                                            </c:if>
                                                            <!-- Nếu sản phẩm đang 'pending' thì hiện nút approve và cancel -->
                                                            <c:if test="${product.status == 'pending'}">
                                                                <button class="btn btn-xs btn-success" 
                                                                        onclick="changeStatus(${product.id}, 'approve')">
                                                                    <i class="fa fa-check" style="color: white;"></i>
                                                                </button>
                                                                <button class="btn btn-xs btn-danger" 
                                                                        onclick="changeStatus(${product.id}, 'cancel')">
                                                                    <i class="fa fa-times" style="color: white;"></i>
                                                                </button>
                                                            </c:if>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                        <div class="pagination">
                                            <c:if test="${currentPage > 1}">
                                                <a href="?page=${currentPage - 1}">Previous</a>
                                            </c:if>

                                            <c:forEach begin="1" end="${totalPages}" var="page">
                                                <c:choose>
                                                    <c:when test="${page == currentPage}">
                                                        <span>${page}</span>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <a href="?page=${page}">${page}</a>
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:forEach>

                                            <c:if test="${currentPage < totalPages}">
                                                <a href="?page=${currentPage + 1}">Next</a>
                                            </c:if>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>

                </aside>
<!--                <div class="footer-main">
                    Copyright &copy; EZ Shop, 2025
                </div>-->
            </div><!-- ./wrapper -->
            <script>
                function changeStatus(productId, action) {
                    var confirmationMessage = action === 'approve'
                            ? "Are you sure you want to approve this product for sale?"
                            : "Are you sure you want to cancel this product for sale?";

                    if (confirm(confirmationMessage)) {
                        // Gửi request AJAX (hoặc điều hướng sang servlet) để cập nhật status
                        $.ajax({
                            type: "POST",
                            url: "<%= request.getContextPath()%>/ChangeStatusProductAdminServlet",
                            data: {productId: productId, action: action},
                            success: function (response) {
                                // Reload lại trang hoặc xử lý cập nhật DOM
                                location.reload();
                            },
                            error: function (xhr, status, error) {
                                alert("Error: " + error);
                            }
                        });
                    }
                }
            </script>

            <!-- jQuery 2.0.2 -->
            <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
            <script src="js/jquery.min.js" type="text/javascript"></script>

            <!-- Bootstrap -->
            <script src="js/bootstrap.min.js" type="text/javascript"></script>
            <!-- Director App -->
            <script src="js/Director/app.js" type="text/javascript"></script>
        </body>
    </html>
