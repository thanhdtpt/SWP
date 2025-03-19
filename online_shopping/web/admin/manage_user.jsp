<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Manage User</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        <link href="admin/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="admin/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
        <link href="admin/css/ionicons.min.css" rel="stylesheet" type="text/css" />
        <link href="admin/css/style.css" rel="stylesheet" type="text/css" />
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
                                <span>Admin <i class="caret"></i></span>
                            </a>
                            <ul class="dropdown-menu dropdown-custom dropdown-menu-right">
                                <li class="dropdown-header text-center">Account</li>
                                <li class="divider"></li>
                                <li><a href="#"><i class="fa fa-user fa-fw pull-right"></i> Profile</a></li>
                                <li class="divider"></li>
                                <li><a href="<%= request.getContextPath()%>/logout"><i class="fa fa-ban fa-fw pull-right"></i> Logout</a></li>
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
                            <img src="admin/img/26115.jpg" class="img-circle" alt="User Image" />
                        </div>
                        <div class="pull-left info">
                            <p>Hi, </p> <span>Admin</span>
                            <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
                        </div>
                    </div>
                    <ul class="sidebar-menu">
                        <li><a href="<%= request.getContextPath()%>/DashboarchAdminServlet"><i class="fa fa-dashboard"></i> <span>Dashboard</span></a></li>
                        <li><a href="<%= request.getContextPath()%>/manage-product"><i class="fa fa-gavel"></i> <span>Manage Product</span></a></li>
                        <li><a href="manage_user.jsp"><i class="fa fa-users"></i> <span>Manage User</span></a></li>
                        <li><a href="<%= request.getContextPath()%>/manage-wallet"><i class="fa fa-money"></i> <span>Manage Wallet</span></a></li>
                    </ul>
                </section>
            </aside>

            <aside class="right-side">
                <section class="content">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="panel">
                                <header class="panel-heading">Manage Users (Shop & Customer)</header>
                                <div class="panel-body table-responsive">
                                    <table class="table table-hover">
                                        <thead>
                                            <tr>
                                                <th>Username</th>
                                                <th>Name</th>
                                                <th>Type</th>
                                                <th>Status</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="user" items="${userList}">
                                                <tr>
                                                    <td>${user.username}</td>
                                                    <td>
                                                        <c:choose>
                                                            <c:when test="${user.shop != null}">
                                                                ${user.shop.name}  <!-- Truy cập tên cửa hàng -->
                                                            </c:when>
                                                            <c:otherwise>
                                                                ${user.customer.name}  <!-- Truy cập tên khách hàng -->
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </td>

                                                    <!-- Hiển thị loại người dùng (Shop hoặc Customer) -->
                                                    <td>
                                                        <c:choose>
                                                            <c:when test="${user.shop != null}">
                                                                Shop
                                                            </c:when>
                                                            <c:when test="${user.customer != null}">
                                                                Customer
                                                            </c:when>
                                                            <c:otherwise>
                                                                Admin
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </td>
                                                    <td>
                                                        <c:choose>
                                                            <c:when test="${user.status == 'Active'}">
                                                                <span class="label label-success">Active</span>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <span class="label label-danger">Inactive</span>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </td>

                                                    <td>
                                                        <button class="btn
                                                                <c:choose>
                                                                    <c:when test="${user.status == 'Active'}">btn-danger</c:when>
                                                                    <c:otherwise>btn-primary</c:otherwise>
                                                                </c:choose>" 
                                                                data-toggle="modal" 
                                                                data-target="#changeStatusModal"
                                                                data-username="${user.username}" 
                                                                data-status="${user.status}">

                                                            <c:choose>
                                                                <c:when test="${user.status == 'Active'}">Deactivate</c:when>
                                                                <c:otherwise>Activate</c:otherwise>
                                                            </c:choose>
                                                        </button>
                                                    </td>

                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </aside>
        </div>
        <!-- Modal xác nhận thay đổi trạng thái -->
        <div id="changeStatusModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="changeStatusModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h5 class="modal-title" id="changeStatusModalLabel">Change User Status</h5>
                    </div>
                    <div class="modal-body">
                        <p id="statusMessage"></p>
                    </div>
                    <div class="modal-footer">
                        <form id="statusForm" action="<%= request.getContextPath()%>/changeStatus" method="post">
                            <input type="hidden" name="username" id="usernameInput">
                            <input type="hidden" name="status" id="statusInput">
                            <button type="submit" class="btn btn-primary">Confirm</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <script>
            // Cập nhật modal khi nhấn nút thay đổi trạng thái
            $('#changeStatusModal').on('show.bs.modal', function (event) {
                var button = $(event.relatedTarget); // Nút đã được nhấn
                var username = button.data('username');
                var status = button.data('status');

                var modal = $(this);
                modal.find('#usernameInput').val(username);
                modal.find('#statusInput').val(status);

                if (status === 'Active') {
                    modal.find('#statusMessage').text('Do you want to DEACTIVATE this user?');
                } else {
                    modal.find('#statusMessage').text('Do you want to ACTIVATE this user?');
                }
            });
        </script>


        <script src="js/bootstrap.min.js" type="text/javascript"></script>
    </body>
</html>
