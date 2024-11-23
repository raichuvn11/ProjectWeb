<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="POS - Bootstrap Admin Template">
    <meta name="keywords" content="admin, estimates, bootstrap, business, corporate, creative, invoice, html5, responsive, Projects">
    <meta name="author" content="Dreamguys - Bootstrap Admin Template">
    <meta name="robots" content="noindex, nofollow">

    <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.jpg">
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/animate.css">
    <link rel="stylesheet" href="assets/plugins/select2/css/select2.min.css">
    <link rel="stylesheet" href="assets/css/dataTables.bootstrap4.min.css">
    <link rel="stylesheet" href="assets/plugins/fontawesome/css/fontawesome.min.css">
    <link rel="stylesheet" href="assets/plugins/fontawesome/css/all.min.css">
    <link rel="stylesheet" href="assets/css/style.css">

    <title>Quản lý nhân viên</title>
</head>
<body>
<div id="global-loader">
    <div class="whirly-loader"> </div>
</div>

<div class="main-wrapper">

    <div class="header">

        <div class="header-left active">
            <a href="index.jsp" class="logo">
                <img src="assets/img/logo.png" alt="">
            </a>
            <a href="index.jsp" class="logo-small">
                <img src="assets/img/logo-small.png" alt="">
            </a>
            <a id="toggle_btn" href="javascript:void(0);">
            </a>
        </div>

        <a id="mobile_btn" class="mobile_btn" href="#sidebar">
    <span class="bar-icon">
        <span></span>
        <span></span>
        <span></span>
    </span> <!-- Đóng thẻ <span> này -->
        </a>


        <ul class="nav user-menu">

            <li class="nav-item">
                <div class="top-nav-search">
                    <a href="javascript:void(0);" class="responsive-search">
                        <i class="fa fa-search"></i>
                    </a>
                    <form action="#">
                        <div class="searchinputs">
                            <input type="text" placeholder="Search Here ...">
                            <div class="search-addon">
                                <span><img src="assets/img/icons/closes.svg" alt="img"></span>
                            </div>
                        </div>
                        <a class="btn" id="searchdiv"><img src="assets/img/icons/search.svg" alt="img"></a>
                    </form>
                </div>
            </li>


            <li class="nav-item dropdown has-arrow flag-nav">
                <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="javascript:void(0);" role="button">
                    <img src="assets/img/flags/us1.png" alt="" height="20">
                </a>
                <div class="dropdown-menu dropdown-menu-right">
                    <a href="javascript:void(0);" class="dropdown-item">
                        <img src="assets/img/flags/us.png" alt="" height="16"> English
                    </a>
                    <a href="javascript:void(0);" class="dropdown-item">
                        <img src="assets/img/flags/fr.png" alt="" height="16"> French
                    </a>
                    <a href="javascript:void(0);" class="dropdown-item">
                        <img src="assets/img/flags/es.png" alt="" height="16"> Spanish
                    </a>
                    <a href="javascript:void(0);" class="dropdown-item">
                        <img src="assets/img/flags/de.png" alt="" height="16"> German
                    </a>
                </div>
            </li>


            <li class="nav-item dropdown">
                <a href="javascript:void(0);" class="dropdown-toggle nav-link" data-bs-toggle="dropdown">
                    <img src="assets/img/icons/notification-bing.svg" alt="img"> <span class="badge rounded-pill">4</span>
                </a>
                <div class="dropdown-menu notifications">
                    <div class="topnav-dropdown-header">
                        <span class="notification-title">Notifications</span>
                        <a href="javascript:void(0)" class="clear-noti"> Clear All </a>
                    </div>
                    <div class="noti-content">
                        <ul class="notification-list">
                            <li class="notification-message">
                                <a href="activities.html">
                                    <div class="media d-flex">
                                            <span class="avatar flex-shrink-0">
                                                <img alt="" src="assets/img/profiles/avatar-02.jpg">
                                            </span>
                                        <div class="media-body flex-grow-1">
                                            <p class="noti-details"><span class="noti-title">John Doe</span> added new task <span class="noti-title">Patient appointment booking</span></p>
                                            <p class="noti-time"><span class="notification-time">4 mins ago</span></p>
                                        </div>
                                    </div>
                                </a>
                            </li>

                            <li class="notification-message">
                                <a href="activities.html">
                                    <div class="media d-flex">
                                            <span class="avatar flex-shrink-0">
                                                <img alt="" src="assets/img/profiles/avatar-03.jpg">
                                            </span>
                                        <div class="media-body flex-grow-1">
                                            <p class="noti-details"><span class="noti-title">Tarah Shropshire</span> changed the task name <span class="noti-title">Appointment booking with payment gateway</span></p>
                                            <p class="noti-time"><span class="notification-time">6 mins ago</span></p>
                                        </div>
                                    </div>
                                </a>
                            </li>

                            <li class="notification-message">
                                <a href="activities.html">
                                    <div class="media d-flex">
                                            <span class="avatar flex-shrink-0">
                                                <img alt="" src="assets/img/profiles/avatar-06.jpg">
                                            </span>
                                        <div class="media-body flex-grow-1">
                                            <p class="noti-details"><span class="noti-title">Misty Tison</span> added <span class="noti-title">Domenic Houston</span> and <span class="noti-title">Claire Mapes</span> to project <span class="noti-title">Doctor available module</span></p>
                                            <p class="noti-time"><span class="notification-time">8 mins ago</span></p>
                                        </div>
                                    </div>
                                </a>
                            </li>

                            <li class="notification-message">
                                <a href="activities.html">
                                    <div class="media d-flex">
                                            <span class="avatar flex-shrink-0">
                                                <img alt="" src="assets/img/profiles/avatar-17.jpg">
                                            </span>
                                        <div class="media-body flex-grow-1">
                                            <p class="noti-details"><span class="noti-title">Rolland Webber</span> completed task <span class="noti-title">Patient and Doctor video conferencing</span></p>
                                            <p class="noti-time"><span class="notification-time">12 mins ago</span></p>
                                        </div>
                                    </div>
                                </a>
                            </li>

                            <li class="notification-message">
                                <a href="activities.html">
                                    <div class="media d-flex">
                                            <span class="avatar flex-shrink-0">
                                                <img alt="" src="assets/img/profiles/avatar-13.jpg">
                                            </span>
                                        <div class="media-body flex-grow-1">
                                            <p class="noti-details"><span class="noti-title">Bernardo Galaviz</span> added new task <span class="noti-title">Private chat module</span></p>
                                            <p class="noti-time"><span class="notification-time">2 days ago</span></p>
                                        </div>
                                    </div>
                                </a>
                            </li>

                        </ul>
                    </div>
                    <div class="topnav-dropdown-footer">
                        <a href="activities.html">View all Notifications</a>
                    </div>
                </div>
            </li>

            <li class="nav-item dropdown has-arrow main-drop">
                <a href="javascript:void(0);" class="dropdown-toggle nav-link userset" data-bs-toggle="dropdown">
                        <span class="user-img"><img src="assets/img/profiles/avator1.jpg" alt="">
                        <span class="status online"></span></span>
                </a>
                <div class="dropdown-menu menu-drop-user">
                    <div class="profilename">
                        <div class="profileset">
                                <span class="user-img"><img src="assets/img/profiles/avator1.jpg" alt="">
                                <span class="status online"></span></span>
                            <div class="profilesets">
                                <h6>John Doe</h6>
                                <h5>Admin</h5>
                            </div>
                        </div>
                        <hr class="m-0">
                        <a class="dropdown-item" href="profile.html"> <i class="me-2" data-feather="user"></i> My Profile</a>
                        <a class="dropdown-item" href="generalsettings.html"><i class="me-2" data-feather="settings"></i>Settings</a>
                        <hr class="m-0">
                        <a class="dropdown-item logout pb-0" href="signin.html"><img src="assets/img/icons/log-out.svg" class="me-2" alt="img">Logout</a>
                    </div>
                </div>
            </li>

        </ul>

        <div class="dropdown mobile-user-menu">
            <a href="javascript:void(0);" class="nav-link dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false"><i class="fa fa-ellipsis-v"></i></a>
            <div class="dropdown-menu dropdown-menu-right">
                <a class="dropdown-item" href="profile.html">My Profile</a>
                <a class="dropdown-item" href="generalsettings.html">Settings</a>
                <a class="dropdown-item" href="signin.html">Logout</a>
            </div>
        </div>

    </div>

    <div class="sidebar" id="sidebar">
        <div class="sidebar-inner slimscroll">
            <div id="sidebar-menu" class="sidebar-menu">
                <ul>
                    <li class="submenu">
                        <a href="javascript:void(0);"><img src="assets/img/icons/dashboard.svg" alt="img"><span> Thống Kê</span> <span class="menu-arrow"></span> </a>
                        <ul>
                            <li><a href="index1.jsp">Doanh Thu</a></li>
                            <li><a href="index2.jsp">Sản Phẩm Bán Chạy</a></li>
                            <li><a href="index3.jsp">Trạng Thái Đơn Hàng</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="coupon.jsp"><img src="assets/img/icons/coupon.svg" alt="img"><span> Tạo Mã Khuyến Mãi</span> </a>
                    </li>
                </ul>
                <ul>
                    <li class="active">
                        <a href="listNV.jsp"><img src="assets/img/icons/dashboard.svg" alt="img" class="active"><span> Quản lý nhân viên</span> </a>
                    </li>
                </ul>
                <ul>
                    <li >
                        <a href="listCustomer.jsp"><img src="assets/img/icons/dashboard.svg" alt="img"><span> Quản lý Khách Hàng</span> </a>
                    </li>
                </ul>
                <ul>
                    <li>
                        <a href="phanca.jsp"><img src="assets/img/icons/dashboard.svg" alt="img" class=""><span>Phân ca làm việc</span> </a>
                    </li>
                </ul>
                <ul>
                    <li class="submenu">
                        <a href="javascript:void(0);"><img src="assets/img/icons/product.svg" alt="img"><span> Sản phẩm</span> <span class="menu-arrow"></span></a>
                        <ul>
                            <li><a href="productlist.jsp">Danh sách sản phẩm</a></li>
                            <li><a href="addproduct.jsp">Thêm sản phẩm</a></li>
                            <li><a href="categorylist.jsp">Danh sách Danh mục sản phẩm</a></li>
                            <li><a href="addcategory.jsp">Thêm danh mục sản phẩm</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </div>

    <div class="page-wrapper">
        <div class="content">

            <div class="page-header">
                <div class="page-btn">
                    <div class="page-title" style="display: flex; flex-direction: column; align-items: flex-start;">
                        <div style="display: flex; align-items: center;">
                            <a class="product-img">
                                <img src="assets/img/customer/customer1.jpg" alt="Hình đại diện" style="border-radius: 50%; width: 50px; height: 50px; object-fit: cover;">
                            </a>
                            <a style="font-size: 16px; font-weight: bold; margin-left: 10px; vertical-align: middle; display: inline-block;">Trần Anh Thư</a>
                        </div>
                </div>

                    <h4 style="margin-top: 30px; margin-bottom: 10px;">Danh Sách Đơn Đặt Hàng</h4>
                </div>
            </div>
            </div>

            <div class="card">
                <div class="card-body">
                    <div class="table-top">
                        <div class="search-set">
                            <div class="search-path">
                                <a class="btn btn-filter" id="filter_search">
                                    <img src="assets/img/icons/filter.svg" alt="img">
                                    <span><img src="assets/img/icons/closes.svg" alt="img"></span>
                                </a>
                            </div>
                            <form action="search" method="post" class="d-flex justify-content-center">
                                <input type="hidden" name="search_action" value="search_name">
                                <input type="text" class="form-control" name="search_name" placeholder="Nhập tên tìm kiếm..." style="margin-right: 5px;">
                                <button type="submit" class="btn btn-filters ms-auto">Tìm</button>
                            </form>
                        </div>
                    </div>

                    <div class="card" id="filter_inputs">
                        <div class="card-body pb-0">
                            <div class="row">
                                <div class="col-lg-2 col-sm-6 col-12">
                                    <div class="form-group">
                                        <input type="text" placeholder="Nhập tên sản phẩm...">
                                    </div>
                                </div>
                                <div class="col-lg-2 col-sm-6 col-12">
                                    <div class="form-group">
                                        <input type="text" placeholder="Nhập mã đơn hàng... ">
                                    </div>
                                </div>
                                <div class="col-lg-2 col-sm-6 col-12">
                                    <div class="form-group">
                                        <input type="text" placeholder="Nhập mã sản phẩm...">
                                    </div>
                                </div>
                            
                                <div class="col-lg-2 col-sm-6 col-12">
                                    <div class="form-group">
                                        <input type="date" name="birth-date" class="form-control">
                                    </div>
                                </div>
                                <div class="col-lg-1 col-sm-6 col-12  ms-auto">
                                    <div class="form-group">
                                        <a class="btn btn-filters ms-auto"><img
                                                src="assets/img/icons/search-whites.svg" alt="img"></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>



                    <div class="table-responsive">
                        <table class="table">

                            <thead>
                            <tr>
                                <th>
                                    <label class="checkboxs">
                                        <input type="checkbox" id="select-all">
                                        <span class="checkmarks"></span>
                                    </label>
                                </th>
                                <th>Tên Sản Phẩm</th>
                                <th>Mã Sản Phẩm</th>
                                <th>Mã Đơn Hàng</th>
                                <th>Số Lượng</th>
                                <th>Ngày Đặt Hàng</th>
                                <th>Trạng Thái</th>
                                <th>Xem Phản Hồi</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>
                                    <label class="checkboxs">
                                        <input type="checkbox">
                                        <span class="checkmarks"></span>
                                    </label>
                                </td>
                                <td class="productimgname">
                                    <a href="javascript:void(0);" class="product-img">
                                        <img src="assets/img/product/product6.jpg" alt="product">
                                    </a>
                                    <a href="javascript:void(0);">Macbook Pro</a>
                                </td>
                                <td>SP1023</td>
                                <td>DH1567</td>
                                <td>20</td>
                                <td>07/07/2004</td>
                                <td><span class="badges bg-lightgreen">Delivering </span></td>
                                <td>
                                    <a class="me-3"  onclick="viewFeedbackCustomer()">
                                        <img src="assets/img/icons/edit.svg" alt="img">
                                    </a>
                                </td>


                            </tr>

                            </tbody>
                        </table>

                    </div>
                    <div class="container mt-5">
                        <div class="d-flex justify-content-center pagination">
                            <button id="prev-page" class="btn btn-primary me-2" disabled>&lt;</button>
                            <span id="page-info" class="align-self-center">Page 1 of X</span>
                            <button id="next-page" class="btn btn-primary ms-2">&gt;</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</div>

<div class="modal fade" id="feedback">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Phản Hồi Của Khách Hàng</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="$('#feedback').modal('hide')">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <p id="feedback-description">Sản phẩm như shit làm ăn giả tạo nhưng tôi tạm cho 5 sao.</p>
                <div id="feedback-rate">
                    Rate:
                    <span style="color: gold;">&#9733;</span>
                    <span style="color: gold;">&#9733;</span>
                    <span style="color: gold;">&#9733;</span>
                    <span style="color: gold;">&#9733;</span>
                    <span style="color: gold;">&#9733;</span>
                </div>
                <img id="feedback-image" src="https://cdn.tgdd.vn/Files/2021/09/06/1380709/dell3511-shivtechsmart_1280x774-800-resize.jpg" alt="Feedback Image" style="display: block; max-width: 100%; margin-top: 10px;">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="$('#feedback').modal('hide')">Hủy Thao Tác</button>
            </div>
        </div>
    </div>
</div>



<script src="assets/js/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script>
    // function viewFeedbackCustomer() {
    //     $('#feedback').modal();
    // }
    function viewFeedbackCustomer() {
        $('#feedback').modal('show');
    }
    // var myModal = new bootstrap.Modal(document.getElementById('feedback'));
    // myModal.show();


    $('#btnSearchBuilding').click(function (e){
        e.preventDefault();
        $('#listForm').submit();
    })
</script>
<script src="scripts/pagination.js"></script>
<script src="assets/js/jquery-3.6.0.min.js"></script>
<script src="assets/js/feather.min.js"></script>
<script src="assets/js/jquery.slimscroll.min.js"></script>
<script src="assets/js/jquery.dataTables.min.js"></script>
<script src="assets/js/dataTables.bootstrap4.min.js"></script>
<script src="assets/js/bootstrap.bundle.min.js"></script>
<script src="assets/plugins/select2/js/select2.min.js"></script>
<script src="assets/plugins/sweetalert/sweetalert2.all.min.js"></script>
<script src="assets/plugins/sweetalert/sweetalerts.min.js"></script>
<script src="assets/js/script.js"></script>

</body>
</html>