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
        <link href="admin/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <!-- font Awesome -->
        <link href="admin/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
        <!-- Ionicons -->
        <link href="admin/css/ionicons.min.css" rel="stylesheet" type="text/css" />
        <!-- Morris chart -->
        <link href="admin/css/morris/morris.css" rel="stylesheet" type="text/css" />
        <!-- jvectormap -->
        <link href="admin/css/jvectormap/jquery-jvectormap-1.2.2.css" rel="stylesheet" type="text/css" />
        <!-- Date Picker -->
        <link href="admin/css/datepicker/datepicker3.css" rel="stylesheet" type="text/css" />
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>


        <!-- fullCalendar -->
        <!-- <link href="css/fullcalendar/fullcalendar.css" rel="stylesheet" type="text/css" /> -->
        <!-- Daterange picker -->
        <link href="admin/css/daterangepicker/daterangepicker-bs3.css" rel="stylesheet" type="text/css" />
        <!-- iCheck for checkboxes and radio inputs -->
        <link href="admin/css/iCheck/all.css" rel="stylesheet" type="text/css" />
        <!-- bootstrap wysihtml5 - text editor -->
        <!-- <link href="css/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css" rel="stylesheet" type="text/css" /> -->
        <link href='http://fonts.googleapis.com/css?family=Lato' rel='stylesheet' type='text/css'>
        <!-- Theme style -->
        <link href="admin/css/style.css" rel="stylesheet" type="text/css" />



        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
          <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
          <![endif]-->

        <style type="text/css">

        </style>
    </head>
    <body class="skin-black">
        <!-- header logo: style can be found in header.less -->
        <header class="header">
            <a href="index.html" class="logo">
                EZ Shop
            </a>
            <!-- Header Navbar: style can be found in header.less -->
            <nav class="navbar navbar-static-top" role="navigation">
                <!-- Sidebar toggle button-->
                <div class="navbar-right" style="z-index: 10000">
                    <ul class="nav navbar-nav">
                        <!-- User Account: style can be found in dropdown.less -->
                        <li class="dropdown user user-menu">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <i class="fa fa-user"></i>
                                <span>Admin <i class="caret"></i></span>
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
                                    <a href="<%= request.getContextPath()%>/logout"><i class="fa fa-ban fa-fw pull-right"></i> Logout</a>
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
                            <img src="admin/img/26115.jpg" class="img-circle" alt="User Image" />
                        </div>
                        <div class="pull-left info">
                            <p>Hi, Admin</p>

                            <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
                        </div>
                    </div>
                    <!-- search form -->
                    <!--                    <form action="#" method="get" class="sidebar-form">
                                            <div class="input-group">
                                                <input type="text" name="q" class="form-control" placeholder="Search..."/>
                                                <span class="input-group-btn">
                                                    <button type='submit' name='seach' id='search-btn' class="btn btn-flat"><i class="fa fa-search"></i></button>
                                                </span>
                                            </div>
                                        </form>-->
                    <!-- /.search form -->
                    <!-- sidebar menu: : style can be found in sidebar.less -->
                    <ul class="sidebar-menu">
                        <li class="active">
                            <a href="<%= request.getContextPath()%>/DashboarchAdminServlet">
                                <i class="fa fa-dashboard"></i> <span>Dashboard</span>
                            </a>
                        </li>
                        <li>
                            <a href="<%= request.getContextPath()%>/admin-manage-product">
                                <i class="fa fa-gavel"></i> <span>Manage Product</span>
                            </a>
                        </li>
                        <li>
                            <a href="<%= request.getContextPath()%>/manage-user">
                                <i class="fa fa-gavel"></i> <span>Manage User</span>
                            </a>
                        </li>

                        <li><a href="<%= request.getContextPath()%>/manage-wallet"><i class="fa fa-money"></i> <span>Manage Wallet</span></a></li>

                    </ul>
                </section>
                <!-- /.sidebar -->
            </aside>

            <aside class="right-side">

                <!-- Main content -->
                <section class="content">

                    <div class="row" style="margin-bottom:5px;">


                        <div class="col-md-3">
                            <div class="sm-st clearfix">
                                <span class="sm-st-icon st-red"><i class="fa fa-check-square-o"></i></span>
                                <div class="sm-st-info">
                                    <span>${totalUsers}</span>
                                    Total User
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="sm-st clearfix">
                                <span class="sm-st-icon st-violet"><i class="fa fa-envelope-o"></i></span>
                                <div class="sm-st-info">
                                    <span>${totalShops}</span>
                                    Total Shop
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="sm-st clearfix">
                                <span class="sm-st-icon st-blue"><i class="fa fa-paperclip"></i></span>
                                <div class="sm-st-info">
                                    <span>${totalProducts}</span>
                                    Total Product
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="sm-st clearfix">
                                <span class="sm-st-icon st-green"><i class="fa fa-dollar"></i></span>
                                <div class="sm-st-info">
                                    <span><fmt:formatNumber value="${totalMoneys}" type="number" pattern="#,###" /> đ</span>
                                    Total Money
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Main row -->
                    <div class="row">

                        <div class="col-md-8">
                            <section class="panel">
                                <header class="panel-heading">
                                    Products
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
                                            <c:forEach var="product" items="${topProducts}">
                                                <tr>
                                                    <td>${product.id}</td>
                                                    <td>${product.productname}${product.status == 'pending' ? "<span style='color:red;font-size: 15px;'>* </span>" : ""}</td>
                                                    <td>${product.categories.name}</td>
                                                    <td>${product.quantityPerUnit}</td>
                                                    <td>${product.currentPrice}</td>
                                                    <td>
                                                        <span class="label
                                                              ${product.status == 'approved' ? 'label-success' 
                                                                : (product.status == 'pending' ? 'label-warning' 
                                                                : (product.status == 'created' ? 'label-info' : 'label-default'))}">
                                                                  ${product.status}
                                                              </span>
                                                        </td>
                                                        <td>${product.createdDate}</td> 
                                                        <td>
                                                            <!-- Hiển thị nút "tick xanh" khi trạng thái là "created" -->
                                                            <c:if test="${product.status == 'created'}">
                                                                <button class="btn btn-xs btn-success" onclick="changeStatus(${product.id}, 'approve')">
                                                                    <i class="fa fa-check" style="color: white;"></i>
                                                                </button>
                                                            </c:if>

                                                            <!-- Hiển thị cả nút "tick xanh" và "hủy" khi trạng thái là "pending" -->
                                                            <c:if test="${product.status == 'pending'}">
                                                                <button class="btn btn-xs btn-success" onclick="changeStatus(${product.id}, 'approve')">
                                                                    <i class="fa fa-check" style="color: white;"></i>
                                                                </button>
                                                                <button class="btn btn-xs btn-danger" onclick="changeStatus(${product.id}, 'cancel')">
                                                                    <i class="fa fa-times" style="color: white;"></i>
                                                                </button>
                                                            </c:if>
                                                        </td>



                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="panel-footer bg-white">
                                        <!-- <span class="pull-right badge badge-info">32</span> -->
                                        <a href="<%= request.getContextPath()%>/admin-manage-product">
                                            <button class="btn btn-primary btn-addon btn-sm">
                                                view all
                                            </button>
                                        </a>

                                    </div>
                                    <div class="panel-body" id="noti-box">
                                        <c:if test="${not empty statusMessage}">
                                            <div class="alert alert-success">
                                                <button data-dismiss="alert" class="close close-sm" type="button">
                                                    <i class="fa fa-times"></i>
                                                </button>
                                                <strong>Well done!</strong> ${statusMessage}
                                            </div>
                                        </c:if>
                                    </div>
                                </section>


                            </div><!--end col-6 -->
                            <div class="col-md-4">
                                <div class="panel">
                                    <header class="panel-heading">
                                        Members
                                    </header>

                                    <ul class="list-group teammates">
                                        <c:forEach var="member" items="${topMembers}">
                                            <li class="list-group-item">
                                                <a href="#"><img src="admin/img/26115.jpg" width="50" height="50"></a>
                                                <span class="pull-right label
                                                      ${member.roleName == 'ADMIN' ? 'label-danger' : 
                                                        (member.roleName == 'SELLER' ? 'label-warning' : 'label-primary')} inline m-t-15">
                                                          ${member.roleName}
                                                      </span>
                                                      <a href="#">${member.username}</a>
                                                </li>
                                            </c:forEach>
                                        </ul>


                                        <div class="panel-footer bg-white">
                                            <!-- <span class="pull-right badge badge-info">32</span> -->
                                            <a href="<%= request.getContextPath()%>/manage-user"><button class="btn btn-primary btn-addon btn-sm">
                                                    view all
                                                </button></a>

                                        </div>
                                    </div>
                                </div>

                            </div>
                            <!--                        <div class="row">
                                                        <div class="col-md-12">
                                                            <section class="panel">
                                                                <header class="panel-heading">
                                                                    Shops
                                                                </header>
                                                                <div class="panel-body table-responsive">
                                                                    <table class="table table-hover">
                                                                        <thead>
                                                                            <tr>
                                                                                <th>#</th>
                                                                                <th>Project</th>
                                                                                <th>Manager</th>
                                                                                 <th>Client</th> 
                                                                                <th>Deadline</th>
                                                                                 <th>Price</th> 
                                                                                <th>Status</th>
                                                                                <th>Progress</th>
                                                                            </tr>
                                                                        </thead>
                                                                        <tbody>
                                                                            <tr>
                                                                                <td>1</td>
                                                                                <td>Facebook</td>
                                                                                <td>Mark</td>
                                                                                 <td>Steve</td> 
                                                                                <td>10/10/2014</td>
                                                                                 <td>$1500</td> 
                                                                                <td><span class="label label-danger">in progress</span></td>
                                                                                <td><span class="badge badge-info">50%</span></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>2</td>
                                                                                <td>Twitter</td>
                                                                                <td>Evan</td>
                                                                                 <td>Darren</td> 
                                                                                <td>10/8/2014</td>
                                                                                 <td>$1500</td> 
                                                                                <td><span class="label label-success">completed</span></td>
                                                                                <td><span class="badge badge-success">100%</span></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>3</td>
                                                                                <td>Google</td>
                                                                                <td>Larry</td>
                                                                                 <td>Nick</td> 
                                                                                <td>10/12/2014</td>
                                                                                 <td>$2000</td> 
                                                                                <td><span class="label label-warning">in progress</span></td>
                                                                                <td><span class="badge badge-warning">75%</span></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>4</td>
                                                                                <td>LinkedIn</td>
                                                                                <td>Allen</td>
                                                                                 <td>Rock</td> 
                                                                                <td>10/01/2015</td>
                                                                                 <td>$2000</td> 
                                                                                <td><span class="label label-info">in progress</span></td>
                                                                                <td><span class="badge badge-info">65%</span></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>5</td>
                                                                                <td>Tumblr</td>
                                                                                <td>David</td>
                                                                                 <td>HHH</td> 
                                                                                <td>01/11/2014</td>
                                                                                 <td>$2000</td> 
                                                                                <td><span class="label label-warning">in progress</span></td>
                                                                                <td><span class="badge badge-danger">95%</span></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>6</td>
                                                                                <td>Tesla</td>
                                                                                <td>Musk</td>
                                                                                 <td>HHH</td> 
                                                                                <td>01/11/2014</td>
                                                                                 <td>$2000</td> 
                                                                                <td><span class="label label-info">in progress</span></td>
                                                                                <td><span class="badge badge-success">95%</span></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>7</td>
                                                                                <td>Ghost</td>
                                                                                <td>XXX</td>
                                                                                 <td>HHH</td> 
                                                                                <td>01/11/2014</td>
                                                                                 <td>$2000</td> 
                                                                                <td><span class="label label-info">in progress</span></td>
                                                                                <td><span class="badge badge-success">95%</span></td>
                                                                            </tr>
                                                                        </tbody>
                                                                    </table>
                                                                </div>
                                                                <div class="panel-footer bg-white">
                                                                     <span class="pull-right badge badge-info">32</span> 
                                                                    <button class="btn btn-primary btn-addon btn-sm">
                                                                        view all
                                                                    </button>
                                                                </div>
                                                            </section>
                            
                            
                                                        </div>end col-6 
                                                    </div>-->
                            <!-- row end -->
                        </section><!-- /.content -->

                    </aside><!-- /.right-side -->
<!--                    <div class="footer-main">
                        Copyright &copy Director, 2014
                    </div>-->
                </div><!-- ./wrapper -->


                <!-- jQuery 2.0.2 -->
                <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
                <script src="js/jquery.min.js" type="text/javascript"></script>

                <!-- jQuery UI 1.10.3 -->
                <script src="js/jquery-ui-1.10.3.min.js" type="text/javascript"></script>
                <!-- Bootstrap -->
                <script src="js/bootstrap.min.js" type="text/javascript"></script>
                <!-- daterangepicker -->
                <script src="js/plugins/daterangepicker/daterangepicker.js" type="text/javascript"></script>

                <script src="js/plugins/chart.js" type="text/javascript"></script>

                <!-- datepicker
                <script src="js/plugins/datepicker/bootstrap-datepicker.js" type="text/javascript"></script>-->
                <!-- Bootstrap WYSIHTML5
                <script src="js/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js" type="text/javascript"></script>-->
                <!-- iCheck -->
                <script src="js/plugins/iCheck/icheck.min.js" type="text/javascript"></script>
                <!-- calendar -->
                <script src="js/plugins/fullcalendar/fullcalendar.js" type="text/javascript"></script>

                <!-- Director App -->
                <script src="js/Director/app.js" type="text/javascript"></script>

                <!-- Director dashboard demo (This is only for demo purposes) -->
                <script src="js/Director/dashboard.js" type="text/javascript"></script>

                <!-- Director for demo purposes -->
                <script type="text/javascript">
                                                                    $('input').on('ifChecked', function (event) {
                                                                        // var element = $(this).parent().find('input:checkbox:first');
                                                                        // element.parent().parent().parent().addClass('highlight');
                                                                        $(this).parents('li').addClass("task-done");
                                                                        console.log('ok');
                                                                    });
                                                                    $('input').on('ifUnchecked', function (event) {
                                                                        // var element = $(this).parent().find('input:checkbox:first');
                                                                        // element.parent().parent().parent().removeClass('highlight');
                                                                        $(this).parents('li').removeClass("task-done");
                                                                        console.log('not');
                                                                    });

                </script>
                <script>
                    $('#noti-box').slimScroll({
                        height: '400px',
                        size: '5px',
                        BorderRadius: '5px'
                    });

                    $('input[type="checkbox"].flat-grey, input[type="radio"].flat-grey').iCheck({
                        checkboxClass: 'icheckbox_flat-grey',
                        radioClass: 'iradio_flat-grey'
                    });
                </script>
                <script type="text/javascript">
                    $(function () {
                        "use strict";
                        //BAR CHART
                        var data = {
                            labels: ["January", "February", "March", "April", "May", "June", "July"],
                            datasets: [
                                {
                                    label: "My First dataset",
                                    fillColor: "rgba(220,220,220,0.2)",
                                    strokeColor: "rgba(220,220,220,1)",
                                    pointColor: "rgba(220,220,220,1)",
                                    pointStrokeColor: "#fff",
                                    pointHighlightFill: "#fff",
                                    pointHighlightStroke: "rgba(220,220,220,1)",
                                    data: [65, 59, 80, 81, 56, 55, 40]
                                },
                                {
                                    label: "My Second dataset",
                                    fillColor: "rgba(151,187,205,0.2)",
                                    strokeColor: "rgba(151,187,205,1)",
                                    pointColor: "rgba(151,187,205,1)",
                                    pointStrokeColor: "#fff",
                                    pointHighlightFill: "#fff",
                                    pointHighlightStroke: "rgba(151,187,205,1)",
                                    data: [28, 48, 40, 19, 86, 27, 90]
                                }
                            ]
                        };
                        new Chart(document.getElementById("linechart").getContext("2d")).Line(data, {
                            responsive: true,
                            maintainAspectRatio: false,
                        });

                    });
                    // Chart.defaults.global.responsive = true;
                </script>
                <script>
                    function changeStatus(productId, action) {
                        var confirmationMessage = action == 'approve' ?
                                "Are you sure you want to approve this product for sale?" :
                                "Are you sure you want to cancel this product for sale?";

                        // Confirm action
                        if (confirm(confirmationMessage)) {
                            // Proceed with the AJAX request if the user confirms
                            var xhr = new XMLHttpRequest();
                            xhr.open("POST", "ChangeStatusProductServlet", true);
                            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
                            xhr.onreadystatechange = function () {
                                if (xhr.readyState == 4 && xhr.status == 200) {
                                    // Update the product status on the page
                                    if (action == 'approve') {
                                        // Update the status to 'approved'
                                        document.getElementById('product-status-' + productId).innerText = 'approved';
                                        // Optionally, change color or add classes as needed
                                    } else {
                                        // Update the status to 'created'
                                        document.getElementById('product-status-' + productId).innerText = 'created';
                                        // Optionally, change color or add classes as needed
                                    }

                                }
                            };
                            window.location.reload();
                            // Send productId and action (approve or cancel) to the servlet
                            xhr.send("productId=" + productId + "&action=" + action);
                        }
                    }
                </script>
            </body>
        </html>