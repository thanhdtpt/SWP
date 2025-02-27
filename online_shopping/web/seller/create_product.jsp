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
                    <form action="#" method="get" class="sidebar-form">
                        <div class="input-group">
                            <input type="text" name="q" class="form-control" placeholder="Search..."/>
                            <span class="input-group-btn">
                                <button type='submit' name='seach' id='search-btn' class="btn btn-flat"><i class="fa fa-search"></i></button>
                            </span>
                        </div>
                    </form>
                    <ul class="sidebar-menu">
                        <li>
                            <a href="home.jsp">
                                <i class="fa fa-dashboard"></i> <span>Dashboard</span>
                            </a>
                        </li>
                        <li class="active">
                            <a href="<%= request.getContextPath() %>/manage-product">
                                <i class="fa fa-gavel"></i> <span>Manage Product</span>
                            </a>
                        </li>
                        <li>
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
                                    <form class="form-horizontal tasi-form" method="POST" action="create-product">
                                        <div class="form-group">
                                            <label class="col-sm-2 col-sm-2 control-label">Name</label>
                                            <div class="col-sm-4">
                                                <input type="text" class="form-control" name="productname">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 col-sm-2 control-label">Category</label>
                                            <div class="col-lg-4">
                                                <select class="form-control m-b-4" name="category">
                                                    <c:forEach var="category" items="${listC}">
                                                        <option value="${category.id}" >${category.name}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-sm-2 col-sm-2 control-label">Origin</label>
                                            <div class="col-sm-4">
                                                <input type="text" class="form-control round-input" name="origin">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 col-sm-2 control-label">Brand</label>
                                            <div class="col-sm-4">
                                                <input class="form-control" id="focusedInput" type="text" name="brand">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-lg-2 col-sm-2 control-label" for="exampleInputFile">Images</label>
                                            <div class="col-lg-4">
                                                <input type="file" id="exampleInputFile" name="images1"> 
                                                <p class="help-block">Example block-level help text here.</p>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 col-sm-2 control-label">Describe</label>
                                            <div class="col-sm-4">
                                                <input type="text" class="form-control" placeholder="describe" name="describe" >
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 col-sm-2 control-label">Old_Price</label>
                                            <div class="col-sm-4">
                                                <input type="number" class="form-control" placeholder="0" name="oldPrice">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 col-sm-2 control-label">Current_Price</label>
                                            <div class="col-sm-4">
                                                <input type="number" class="form-control" placeholder="0" step="1000" min="0" name="currentPrice">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-lg-2 col-sm-2 control-label">quantity_Per_Unit</label>
                                            <div class="col-lg-4">
                                                <input type="number" class="form-control" placeholder="0" step="1" min="0" name="quantityPerUnit">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 col-sm-2 control-label">Unit_In_Stock</label>
                                            <div class="col-sm-4">
                                                <input type="number" class="form-control" placeholder="0" step="1" min="0" name="unitInStock">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 col-sm-2 control-label">Unit_On_Order</label>
                                            <div class="col-sm-4">
                                                <input type="number" class="form-control" placeholder="0" step="1" min="0" name="unitOnOrder">
                                            </div>
                                        </div>
<!--                                        <div class="form-group">
                                            <label class="col-sm-3 col-sm-3 control-label">
                                                <input type="checkbox" name="isContinued"> Is_Continued
                                            </label>
                                        </div>-->
                                        <div class="form-actions">
                                            <button type="submit" class="btn btn-info" style="margin-left: 10px;">Tạo</button>
                                        </div>

                                        <!--                                      <div class="checkbox">
                                                                                  <label>
                                                                                      <input type="checkbox"> Is_Continued
                                                                                  </label>
                                                                              </div>
                                                                              <button type="submit" class="btn btn-info">Submit</button>-->
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
    </body>


</html>
