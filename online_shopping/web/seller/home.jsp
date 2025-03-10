<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Director | Dashboard</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        <meta name="description" content="Developed By M Abdur Rokib Promy">
        <meta name="keywords" content="Admin, Bootstrap 3, Template, Theme, Responsive">
        <!-- bootstrap 3.0.2 -->
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <!-- font Awesome -->
        <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css" />
        <!-- Ionicons -->
        <link href="css/ionicons.min.css" rel="stylesheet" type="text/css" />
        <!-- Morris chart -->
        <link href="css/morris/morris.css" rel="stylesheet" type="text/css" />
        <!-- jvectormap -->
        <link href="css/jvectormap/jquery-jvectormap-1.2.2.css" rel="stylesheet" type="text/css" />
        <!-- Date Picker -->
        <link href="css/datepicker/datepicker3.css" rel="stylesheet" type="text/css" />
        <!-- fullCalendar -->
        <!-- <link href="css/fullcalendar/fullcalendar.css" rel="stylesheet" type="text/css" /> -->
        <!-- Daterange picker -->
        <link href="css/daterangepicker/daterangepicker-bs3.css" rel="stylesheet" type="text/css" />
        <!-- iCheck for checkboxes and radio inputs -->
        <link href="css/iCheck/all.css" rel="stylesheet" type="text/css" />
        <!-- bootstrap wysihtml5 - text editor -->
        <!-- <link href="css/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css" rel="stylesheet" type="text/css" /> -->
        <link href='http://fonts.googleapis.com/css?family=Lato' rel='stylesheet' type='text/css'>
        <!-- Theme style -->
        <link href="css/style.css" rel="stylesheet" type="text/css" />



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
            <a href="home.jsp" class="logo">
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
                        <!-- User Account: style can be found in dropdown.less -->
                        <li class="dropdown user user-menu">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <i class="fa fa-user"></i>
                                <span>${sessionScope.shop.name} <i class="caret"></i></span>
                            </a>
                            <ul class="dropdown-menu dropdown-custom dropdown-menu-right">
                                <li class="dropdown-header text-center">Account</li>

                                <!--                                <li>
                                                                    <a href="#">
                                                                    <i class="fa fa-clock-o fa-fw pull-right"></i>
                                                                        <span class="badge badge-success pull-right">10</span> Updates</a>
                                                                    <a href="#">
                                                                    <i class="fa fa-envelope-o fa-fw pull-right"></i>
                                                                        <span class="badge badge-danger pull-right">5</span> Messages</a>
                                                                    <a href="#"><i class="fa fa-magnet fa-fw pull-right"></i>
                                                                        <span class="badge badge-info pull-right">3</span> Subscriptions</a>
                                                                    <a href="#"><i class="fa fa-question fa-fw pull-right"></i> <span class=
                                                                        "badge pull-right">11</span> FAQ</a>
                                                                </li>-->

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
                            <img src="img/26115.jpg" class="img-circle" alt="User Image" />
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
                    <!-- /.search form -->
                    <!-- sidebar menu: : style can be found in sidebar.less -->
                    <ul class="sidebar-menu">
                        <li class="active">
                            <a href="seller/home.jsp">
                                <i class="fa fa-dashboard"></i> <span>Dashboard</span>
                            </a>
                        </li>

                        <li>
                            <a href="<%= request.getContextPath() %>/manage-product">
                                <i class="fa fa-gavel"></i> <span>Manage Product</span>
                            </a>
                        </li>
                        <li><a href="<%= request.getContextPath() %>/manage-wallet"><i class="fa fa-money"></i> <span>Manage Wallet</span></a></li>


<!--                        <li>
                            <a href="general.jsp">
                                <i class="fa fa-gavel"></i> <span>General</span>
                            </a>
                        </li>

                        <li>
                            <a href="basic_form.jsp">
                                <i class="fa fa-globe"></i> <span>Basic Elements</span>
                            </a>
                        </li>

                        <li>
                            <a href="simple.jsp">
                                <i class="fa fa-glass"></i> <span>Simple tables</span>
                            </a>
                        </li>-->


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
                                    <span>3200</span>
                                    Total Product
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="sm-st clearfix">
                                <span class="sm-st-icon st-blue"><i class="fa fa-dollar"></i></span>
                                <div class="sm-st-info">
                                    <span>100,320</span>
                                    Total Profit
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="sm-st clearfix">
                                <span class="sm-st-icon st-violet"><i class="fa fa-envelope-o"></i></span>
                                <div class="sm-st-info">
                                    <span>2200</span>
                                    Total feedback
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="sm-st clearfix">
                                <span class="sm-st-icon st-green"><i class="fa fa-paperclip"></i></span>
                                <div class="sm-st-info">
                                    <span>4567</span>
                                    Total products sold/month
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Main row -->
                    <div class="row">

                        <div class="col-md-8">
                            <!--earning graph start-->
                            <section class="panel">
                                <header class="panel-heading">
                                    Earning Graph
                                </header>
                                <div class="panel-body">
                                    <canvas id="linechart" width="600" height="330"></canvas>
                                </div>
                            </section>
                            <!--earning graph end-->

                        </div>
                        <div class="col-md-4">
                            <div class="panel">
                                <header class="panel-heading">
                                    Top 5 new order
                                </header>

                                <ul class="list-group teammates">
                                    <li class="list-group-item">
                                        <a href=""><img src="img/26115.jpg" width="50" height="50"></a>
                                        <span class="pull-right label label-danger inline m-t-15">Admin</span>
                                        <a href="">Damon Parker</a>
                                    </li>
                                    <li class="list-group-item">
                                        <a href=""><img src="img/26115.jpg"  width="50" height="50"></a>
                                        <span class="pull-right label label-info inline m-t-15">Member</span>
                                        <a href="">Joe Waston</a>
                                    </li>
                                    <li class="list-group-item">
                                        <a href=""><img src="img/26115.jpg"  width="50" height="50"></a>
                                        <span class="pull-right label label-warning inline m-t-15">Editor</span>
                                        <a href="">Jannie Dvis</a>
                                    </li>
                                    <li class="list-group-item">
                                        <a href=""><img src="img/26115.jpg"  width="50" height="50"></a>
                                        <span class="pull-right label label-warning inline m-t-15">Editor</span>
                                        <a href="">Emma Welson</a>
                                    </li>
                                    <li class="list-group-item">
                                        <a href=""><img src="img/26115.jpg"  width="50" height="50"></a>
                                        <span class="pull-right label label-success inline m-t-15">Subscriber</span>
                                        <a href="">Emma Welson</a>
                                    </li>
                                </ul>
                                <div class="panel-footer bg-white">
                                    <!-- <span class="pull-right badge badge-info">32</span> -->
                                    <button class="btn btn-primary btn-addon btn-sm">
                                        View all
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">

                        <div class="col-md-12">
                            <section class="panel">
                                <header class="panel-heading">
                                    Top 10 best selling products
                                </header>
                                <div class="panel-body table-responsive">
                                    <table class="table table-hover">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>Project</th>
                                                <th>Manager</th>
                                                <!-- <th>Client</th> -->
                                                <th>Deadline</th>
                                                <!-- <th>Price</th> -->
                                                <th>Status</th>
                                                <th>Progress</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>1</td>
                                                <td>Facebook</td>
                                                <td>Mark</td>
                                                <!-- <td>Steve</td> -->
                                                <td>10/10/2014</td>
                                                <!-- <td>$1500</td> -->
                                                <td><span class="label label-danger">in progress</span></td>
                                                <td><span class="badge badge-info">50%</span></td>
                                            </tr>
                                            <tr>
                                                <td>2</td>
                                                <td>Twitter</td>
                                                <td>Evan</td>
                                                <!-- <td>Darren</td> -->
                                                <td>10/8/2014</td>
                                                <!-- <td>$1500</td> -->
                                                <td><span class="label label-success">completed</span></td>
                                                <td><span class="badge badge-success">100%</span></td>
                                            </tr>
                                            <tr>
                                                <td>3</td>
                                                <td>Google</td>
                                                <td>Larry</td>
                                                <!-- <td>Nick</td> -->
                                                <td>10/12/2014</td>
                                                <!-- <td>$2000</td> -->
                                                <td><span class="label label-warning">in progress</span></td>
                                                <td><span class="badge badge-warning">75%</span></td>
                                            </tr>
                                            <tr>
                                                <td>4</td>
                                                <td>LinkedIn</td>
                                                <td>Allen</td>
                                                <!-- <td>Rock</td> -->
                                                <td>10/01/2015</td>
                                                <!-- <td>$2000</td> -->
                                                <td><span class="label label-info">in progress</span></td>
                                                <td><span class="badge badge-info">65%</span></td>
                                            </tr>
                                            <tr>
                                                <td>5</td>
                                                <td>Tumblr</td>
                                                <td>David</td>
                                                <!-- <td>HHH</td> -->
                                                <td>01/11/2014</td>
                                                <!-- <td>$2000</td> -->
                                                <td><span class="label label-warning">in progress</span></td>
                                                <td><span class="badge badge-danger">95%</span></td>
                                            </tr>
                                            <tr>
                                                <td>6</td>
                                                <td>Tesla</td>
                                                <td>Musk</td>
                                                <!-- <td>HHH</td> -->
                                                <td>01/11/2014</td>
                                                <!-- <td>$2000</td> -->
                                                <td><span class="label label-info">in progress</span></td>
                                                <td><span class="badge badge-success">95%</span></td>
                                            </tr>
                                            <tr>
                                                <td>7</td>
                                                <td>Ghost</td>
                                                <td>XXX</td>
                                                <!-- <td>HHH</td> -->
                                                <td>01/11/2014</td>
                                                <!-- <td>$2000</td> -->
                                                <td><span class="label label-info">in progress</span></td>
                                                <td><span class="badge badge-success">95%</span></td>
                                            </tr>
                                            <tr>
                                                <td>8</td>
                                                <td>Ghost</td>
                                                <td>XXX</td>
                                                <!-- <td>HHH</td> -->
                                                <td>01/11/2014</td>
                                                <!-- <td>$2000</td> -->
                                                <td><span class="label label-info">in progress</span></td>
                                                <td><span class="badge badge-success">95%</span></td>
                                            </tr>
                                            <tr>
                                                <td>9</td>
                                                <td>Ghost</td>
                                                <td>XXX</td>
                                                <!-- <td>HHH</td> -->
                                                <td>01/11/2014</td>
                                                <!-- <td>$2000</td> -->
                                                <td><span class="label label-info">in progress</span></td>
                                                <td><span class="badge badge-success">95%</span></td>
                                            </tr>
                                            <tr>
                                                <td>10</td>
                                                <td>Ghost</td>
                                                <td>XXX</td>
                                                <!-- <td>HHH</td> -->
                                                <td>01/11/2014</td>
                                                <!-- <td>$2000</td> -->
                                                <td><span class="label label-info">in progress</span></td>
                                                <td><span class="badge badge-success">95%</span></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </section>


                        </div><!--end col-6 -->

                    </div>
                    <!-- row end -->
                </section><!-- /.content -->
            </aside><!-- /.right-side -->

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
    </body>
</html>