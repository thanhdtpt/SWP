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
                <a href="#" class="navbar-btn sidebar-toggle" data-toggle="offcanvas" role="button">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </a>
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
                            <img src="seller/img/26115.jpg" class="img-circle" alt="User Image" />
                        </div>
                        <div class="pull-left info">
                            <p>Hi, </p> <span>${sessionScope.shop.name}</span>
                            <br>
                            <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
                        </div>
                    </div>
                    <!-- search form -->
                    <form action="manage-product" method="GET" class="sidebar-form">
                        <div class="input-group">
                            <input type="text" name="search" class="form-control" placeholder="Search" value="${param.search}"/>
                            <span class="input-group-btn">
                                <button type="submit" class="btn btn-flat"><i class="fa fa-search"></i></button>
                            </span>
                        </div>
                    </form>

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
<!--                        <li>
                            <a href="general.html">
                                <i class="fa fa-gavel"></i> <span>General</span>
                            </a>
                        </li>

                        <li>
                            <a href="basic_form.html">
                                <i class="fa fa-globe"></i> <span>Basic Elements</span>
                            </a>
                        </li>

                        <li >
                            <a href="simple.jsp">
                                <i class="fa fa-glass"></i> <span>Simple tables</span>
                            </a>
                        </li>-->

                    </ul>
                </section>
                <!-- /.sidebar -->
            </aside>

            <!-- Right side column. Contains the navbar and content of the page -->
            <aside class="right-side">

                <!-- Main content -->
                <section class="content">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="panel">
                                <header class="panel-heading">
                                    Product of ${sessionScope.shop.name}

                                </header>
                                <!-- <div class="box-header"> -->
                                <!-- <h3 class="box-title">Responsive Hover Table</h3> -->

                                <!-- </div> -->
                                <div class="panel-body table-responsive">
                                    <div class="box-tools m-b-15">
                                        <div class="input-group">
                                            <div class="input-group-btn">
                                                <button class="btn btn-sm btn-default pull-left" onclick="location.href = '<%= request.getContextPath() %>/create-product';">
                                                    Create Product
                                                </button>
                                            </div>
                                            <input type="text" name="table_search" class="form-control input-sm pull-right" style="width: 150px;" placeholder="Search"/>
                                            <div class="input-group-btn">
                                                <button class="btn btn-sm btn-default"><i class="fa fa-search"></i></button>
                                            </div>

                                        </div>
                                    </div>
                                    <table class="table table-hover">
                                        <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th>Name</th>
                                                <th>Category</th>
                                                <th>Origin</th>
                                                <th>Brand</th>
                                                <th>Images</th>
                                                <th>Old Price</th>
                                                <th>Current Price</th>
                                                <th>Quantity per Unit</th>
                                                <th>Unit in Stock</th>
                                                <th>Unit on Order</th>
                                                <th>describe</th>
                                                <th>Created Date</th>
                                                <th>Updated Date</th>
                                                <th>Status</th>
                                                <th colspan="2">Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="product" items="${productList}">
                                                <tr>
                                                    <td>${product.id}</td>
                                                    <td>${product.productname}</td>
                                                    <td>${product.categories.name}</td>
                                                    <td>${product.origin}</td>
                                                    <td>${product.brand}</td>
                                                    <td><img src="${product.images1}" alt="product image" width="50" height="50"></td>
                                                    <td>${product.oldPrice}</td>
                                                    <td>${product.currentPrice}</td>
                                                    <td>${product.quantityPerUnit}</td>
                                                    <td>${product.unitInstock}</td>
                                                    <td>${product.unitOnOrder}</td>
                                                    <td>${product.describe}</td>
                                                    <td>${product.createdDate}</td>
                                                    <td>${product.updatedDate}</td>
                                                    <td>
                                                        <span class="label
                                                              ${product.status == 'approved' ? 'label-success' 
                                                                : (product.status == 'pending' ? 'label-warning' 
                                                                : (product.status == 'created' ? 'label-info' : 'label-default'))}">
                                                                  ${product.status}
                                                              </span>
                                                        </td>

                                                        <td><a href="<%= request.getContextPath() %>/update-product?id=${product.id}">Update</a></td>
                                                        <td><a href="<%= request.getContextPath() %>/delete-product?id=${product.id}">Delete</a></td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>

                                        <div class="table-foot">
                                            <ul class="pagination pagination-sm no-margin pull-right">
                                                <c:if test="${currentPage > 1}">
                                                    <li><a href="?page=${currentPage - 1}&search=${param.search}">&laquo;</a></li>
                                                    </c:if>
                                                    <c:forEach var="i" begin="1" end="${totalPages}">
                                                    <li class="${i == currentPage ? 'active' : ''}">
                                                        <a href="?page=${i}&search=${param.search}">${i}</a>
                                                    </li>
                                                </c:forEach>
                                                <c:if test="${currentPage < totalPages}">
                                                    <li><a href="?page=${currentPage + 1}&search=${param.search}">&raquo;</a></li>
                                                    </c:if>
                                            </ul>
                                        </div>
                                    </div><!-- /.box-body -->
                                </div><!-- /.box -->
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
        </body>
    </html>
