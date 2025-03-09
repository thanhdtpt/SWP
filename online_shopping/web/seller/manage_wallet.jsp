<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Manage Wallet</title>
    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>

    <!-- bootstrap 3.0.2 -->
    <link href="seller/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="seller/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <link href="seller/css/ionicons.min.css" rel="stylesheet" type="text/css" />
    <link href="seller/css/style.css" rel="stylesheet" type="text/css" />

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body class="skin-black">
    <header class="header">
        <a href="seller/home.jsp" class="logo">EZ Shop</a>
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
                            <li><a href="#"><i class="fa fa-user fa-fw pull-right"></i> Profile</a></li>
                            <li class="divider"></li>
                            <li><a href="<%= request.getContextPath() %>/logout"><i class="fa fa-ban fa-fw pull-right"></i> Logout</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </nav>
    </header>

    <div class="wrapper row-offcanvas row-offcanvas-left">
        <aside class="left-side sidebar-offcanvas">
            <section class="sidebar">
                <div class="user-panel">
                    <div class="pull-left image">
                        <img src="seller/img/26115.jpg" class="img-circle" alt="User Image" />
                    </div>
                    <div class="pull-left info">
                        <p>Hi, </p> <span>${sessionScope.shop.name}</span>
                        <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
                    </div>
                </div>

                <ul class="sidebar-menu">
                    <li><a href="seller/home.jsp"><i class="fa fa-dashboard"></i> <span>Dashboard</span></a></li>
                    <li><a href="<%= request.getContextPath() %>/manage-product"><i class="fa fa-gavel"></i> <span>Manage Product</span></a></li>
                    <li class="active"><a href="<%= request.getContextPath() %>/manage-wallet"><i class="fa fa-money"></i> <span>Manage Wallet</span></a></li>
                </ul>
            </section>
        </aside>

        <aside class="right-side">
            <section class="content">
                <div class="row">
                    <div class="col-xs-12">
                        <div class="panel">
                            <header class="panel-heading">Wallet Transactions of ${sessionScope.shop.name}</header>
                            <div class="panel-body table-responsive">
                                <div class="box-tools m-b-15">
                                        <div class="input-group">
                                            <div class="input-group-btn">
                                                
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
                                            <th>Transaction ID</th>
                                            <th>Description</th>
                                            <th>Amount</th>
                                            <th>Transaction Date</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="transaction" items="${walletList}">
                                            <tr>
                                                <td>${transaction.walletID}</td>
                                                <td>${transaction.description}</td>
                                                <td>
                                                    <fmt:formatNumber value="${transaction.amount}" type="number" pattern="#,###" /> đ
                                                </td>
                                                <td>${transaction.transactionDate}</td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>

                                <!-- Pagination -->
                                <div class="table-foot">
                                    <ul class="pagination pagination-sm no-margin pull-right">
                                        <c:if test="${currentPage > 1}">
                                            <li><a href="?page=${currentPage - 1}">&laquo;</a></li>
                                        </c:if>
                                        <c:forEach var="i" begin="1" end="${totalPages}">
                                            <li class="${i == currentPage ? 'active' : ''}">
                                                <a href="?page=${i}">${i}</a>
                                            </li>
                                        </c:forEach>
                                        <c:if test="${currentPage < totalPages}">
                                            <li><a href="?page=${currentPage + 1}">&raquo;</a></li>
                                        </c:if>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </aside>
    </div>

    <script src="js/bootstrap.min.js" type="text/javascript"></script>
</body>
</html>
