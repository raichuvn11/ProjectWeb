<%--
  Created by IntelliJ IDEA.
  User: nmtu
  Date: 11/5/2024
  Time: 8:29 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="business.Category" %>

<%
  String couponName = (String) session.getAttribute("couponName");
  String couponType = (String) session.getAttribute("couponType");
  String couponValue = (String) session.getAttribute("couponValue");
  String startDate = (String) session.getAttribute("startDate");
  String endDate = (String) session.getAttribute("endDate");
  String useLimit = (String) session.getAttribute("useLimit");
  String useCondition = (String) session.getAttribute("useCondition");
  String successMessageAdd = (String) session.getAttribute("successMessageAdd");
  List<Category> categoryList = (List<Category>) session.getAttribute("categoryList");

  List<Category> selectedCategories = (List<Category>) session.getAttribute("selectedCategories");
  String minOrderValue = (String) session.getAttribute("minOrderValue");
  List<String> errors = (List<String>) session.getAttribute("errors");


  // Xóa session sau khi sử dụng để tránh giữ dữ liệu không cần thiết
  session.removeAttribute("couponName");
  session.removeAttribute("successMessageAdd");
  session.removeAttribute("couponType");
  session.removeAttribute("couponValue");
  session.removeAttribute("startDate");
  session.removeAttribute("endDate");
  session.removeAttribute("useLimit");
  session.removeAttribute("useCondition");
  session.removeAttribute("minOrderValue");
  session.removeAttribute("selectedCategoryIds");
  session.removeAttribute("errors");
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
  <meta name="description" content="POS - Bootstrap Admin Template">
  <meta name="keywords" content="admin, estimates, bootstrap, business, corporate, creative, management, minimal, modern,  html5, responsive">
  <meta name="author" content="Dreamguys - Bootstrap Admin Template">
  <meta name="robots" content="noindex, nofollow">
  <title>Dreams Pos admin template</title>

  <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.jpg">

  <link rel="stylesheet" href="assets/css/bootstrap.min.css">

  <link rel="stylesheet" href="assets/css/bootstrap-datetimepicker.min.css">

  <link rel="stylesheet" href="assets/css/animate.css">

  <link rel="stylesheet" href="assets/plugins/select2/css/select2.min.css">

  <link rel="stylesheet" href="assets/css/dataTables.bootstrap4.min.css">

  <link rel="stylesheet" href="assets/plugins/fontawesome/css/fontawesome.min.css">
  <link rel="stylesheet" href="assets/plugins/fontawesome/css/all.min.css">

  <link rel="stylesheet" href="assets/css/style.css">
</head>
<body>

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
</span>
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
          <li>
            <a href="index.jsp"><img src="assets/img/icons/dashboard.svg" alt="img"><span> Dashboard</span> </a>

          </li>
        </ul>
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
            <a href="coupon.jsp" class="active"><img src="assets/img/icons/coupon.svg" alt="img"><span> Tạo Mã Khuyến Mãi</span> </a>
          </li>
        </ul>
        <ul>
          <li >
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
        <ul>
          <li>
            <a href="profile.jsp"><img src="assets/img/icons/dashboard.svg" alt="img" class=""><span>Thông tin cá nhân</span> </a>
          </li>
        </ul>
        <ul>
          <li>
            <a href="updatepassword.jsp"><img src="assets/img/icons/dashboard.svg" alt="img" class=""><span>Cập nhập mật khẩu</span> </a>
          </li>
        </ul>
      </div>
    </div>
  </div>

  <div class="page-wrapper cardhead">
    <div class="content container-fluid">

      <div class="page-header">
        <div class="row">
          <div class="col">
            <h3 class="page-title">Tạo Mã Khuyến Mãi</h3>
          </div>
        </div>
      </div>

      <div class="row">
        <div class="col-lg-12">
          <div class="card">
            <div class="card-header">
              <h5 class="card-title">Thông Tin</h5>
            </div>
            <div class="card-body">
              <% if (successMessageAdd != null && !successMessageAdd.isEmpty()) { %>
              <div class="alert alert-success">
                <ul>
                  <li><%= successMessageAdd %></li>
                </ul>
              </div>
              <% } %>
              <% if (errors != null && !errors.isEmpty()) { %>
              <div class="alert alert-danger">
                <ul>
                  <% for (String error : errors) { %>
                  <li><%= error %></li>
                  <% } %>
                </ul>
              </div>
              <% } %>
              <form action="CouponController" method="POST">
                <input type="hidden" name="action" value="add">
                <div class="form-group row">
                  <label class="col-form-label col-md-2">Tên Mã Khuyến Mãi</label>
                  <div class="col-md-10">
                    <input type="text" class="form-control" placeholder="Tên mã Khuyến Mãi" name="couponName"
                           value="<%= couponName != null ? couponName : "" %>" required>
                  </div>
                </div>

                <div class="form-group row">
                  <label class="col-form-label col-md-2">Loại giảm giá</label>
                  <div class="col-md-10">
                    <select class="form-control form-small select" name="couponType" required>
                      <option value="percent" <%= "percent".equals(couponType) ? "selected" : "" %>>Phần trăm (%)</option>
                      <option value="money" <%= "money".equals(couponType) ? "selected" : "" %>>Số tiền</option>
                    </select>
                  </div>
                </div>

                <div class="form-group row">
                  <label class="col-form-label col-md-2">Giá trị giảm giá</label>
                  <div class="col-md-10">
                    <input type="text" class="form-control" placeholder="Giá trị giảm giá" name="couponValue"
                           value="<%= couponValue != null ? couponValue : "" %>" required>
                  </div>
                </div>

                <div class="form-group row">
                  <label class="col-form-label col-md-2">Ngày Bắt Đầu</label>
                  <div class="col-md-10">
                    <input type="text" placeholder="DD-MM-YYYY" class="datetimepicker" name="startDate"
                           value="<%= startDate != null ? startDate : "" %>" required>
                  </div>
                </div>

                <div class="form-group row">
                  <label class="col-form-label col-md-2">Ngày Kết Thúc</label>
                  <div class="col-md-10">
                    <input type="text" placeholder="DD-MM-YYYY" class="datetimepicker" name="endDate"
                           value="<%= endDate != null ? endDate : "" %>" required>
                  </div>
                </div>

                <div class="form-group row">
                  <label class="col-form-label col-md-2">Điều kiện áp dụng</label>
                  <div class="col-md-10">
                    <select id="useCondition" class="form-control select" name="useCondition" required onchange="toggleFields()">
                      <option value="all" <%= "all".equals(useCondition) ? "selected" : "" %>>Tất cả hóa đơn</option>
                      <option value="min" <%= "min".equals(useCondition) ? "selected" : "" %>>Trên số tiền nhất định</option>
                      <option value="product" <%= "product".equals(useCondition) ? "selected" : "" %>>Sản Phẩm</option>
                    </select>
                  </div>
                </div>

                <div class="form-group row" id="minOrderValueDiv" style="display: none;">
                  <label class="col-form-label col-md-2">Số tiền tối thiểu (nếu có)</label>
                  <div class="col-md-10">
                    <input type="text" id="minOrderValue" class="form-control" placeholder="Số tiền tối thiểu"
                           name="minOrderValue" value="<%= minOrderValue != null ? minOrderValue : "" %>">
                  </div>
                </div>

                <div class="form-group row" id="categorySelectDiv" style="display: none;">
                  <label class="col-form-label col-md-2">Danh mục (nếu có)</label>
                  <div class="col-md-10">
                    <select id="categoryIds" class="form-control tagging" multiple="multiple" name="categoryIds">
                      <%
                        // Lặp qua tất cả các category trong danh sách categoryList
                        for (Category category : categoryList) {
                          boolean isSelected = false;
                          // Kiểm tra xem category có trong selectedCategories không
                          if (selectedCategories != null) {
                            for (Category selectedCategory : selectedCategories) {
                              if (category.getId().equals(selectedCategory.getId())) {
                                isSelected = true;
                                break;
                              }
                            }
                          }
                      %>
                      <option value="<%= category.getId() %>"
                              <%= isSelected ? "selected" : "" %> >
                        <%= category.getCategoryName() %>
                      </option>
                      <% } %>
                    </select>
                  </div>
                </div>


                <div class="form-group row">
                  <label class="col-form-label col-md-2">Số lần được áp dụng</label>
                  <div class="col-md-10">
                    <input type="text" class="form-control" placeholder="Số lần được áp dụng" name="useLimit"
                           value="<%= useLimit != null ? useLimit : "" %>" required>
                  </div>
                </div>

                <div class="col-lg-12">
                  <button type="submit" class="btn btn-submit me-2">Submit</button>
                </div>
              </form>
            </div>
          </div>
          <div class="card">
            <div class="table-responsive">
              <table class="table datanew">
                <thead>
                <tr>
                  <th>Tên Mã Khuyến Mãi</th>
                  <th>Kiểu Giảm Giá</th>
                  <th>Giá Trị Giảm Giá</th>
                  <th>Ngày Bắt Đầu</th>
                  <th>Ngày Kết Thúc</th>
                  <th>Điều kiện áp dụng</th>
                  <th>Số lần được áp dụng</th>
                  <th>Hành Động</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="coupon" items="${couponList}">
                  <tr>
                    <td>${coupon.couponName}</td>
                    <td>
                      <c:choose>
                        <c:when test="${coupon.couponType == 'percent'}">Phần trăm</c:when>
                        <c:when test="${coupon.couponType == 'money'}">Số tiền</c:when>
                      </c:choose>
                    </td>
                    <td>${coupon.couponValue}</td>
                    <td><fmt:formatDate value="${coupon.startDate}" pattern="dd-MM-yyyy" /></td>
                    <td><fmt:formatDate value="${coupon.endDate}" pattern="dd-MM-yyyy" /></td>
                    <td>
                      <c:choose>
                        <c:when test="${coupon.useCondition == 'all'}">Tất cả hóa đơn</c:when>
                        <c:when test="${coupon.useCondition == 'min'}">Trên số tiền nhất định</c:when>
                        <c:when test="${coupon.useCondition == 'product'}">Sản Phẩm</c:when>
                      </c:choose>
                    </td>
                    <td>${coupon.useLimit}</td>
                    <td>
                      <a class="me-3" href="CouponController?action=edit&id=${coupon.couponID}">
                        <img src="assets/img/icons/edit.svg" alt="Edit">
                      </a>
                      <a class="confirm-text" href="CouponController?action=delete&id=${coupon.couponID}">
                        <img src="assets/img/icons/delete.svg" alt="Delete">
                      </a>
                    </td>
                  </tr>
                </c:forEach>
                </tbody>
              </table>
            </div>
          </div>

        </div>
      </div>
    </div>
  </div>
</div>


<script src="assets/js/jquery-3.6.0.min.js"></script>

<script src="assets/js/feather.min.js"></script>

<script src="assets/js/jquery.slimscroll.min.js"></script>

<script src="assets/plugins/select2/js/select2.min.js"></script>
<script src="assets/plugins/select2/js/custom-select.js"></script>

<script src="assets/js/jquery.dataTables.min.js"></script>
<script src="assets/js/dataTables.bootstrap4.min.js"></script>

<script src="assets/js/bootstrap.bundle.min.js"></script>

<script src="assets/js/moment.min.js"></script>
<script src="assets/js/bootstrap-datetimepicker.min.js"></script>

<script src="assets/plugins/sweetalert2/sweetalert2.all.min.js"></script>
<script src="assets/plugins/sweetalert2/sweetalerts.min.js"></script>

<script src="assets/js/script.js"></script>

<script>
  $(document).ready(function() {
    // Khởi tạo Select2
    $('#product-select').select2();

    // Lấy giá trị khi nhấn nút
    $('#get-selected-values').click(function() {
      const selectedValues = $('#product-select').val(); // Lấy mảng các giá trị đã chọn

      // Kiểm tra và hiển thị thông báo
      if (selectedValues.length > 0) {
        $('#selected-values-message').html(`Các giá trị đã chọn: ${selectedValues.join(', ')}`);
      } else {
        $('#selected-values-message').html("Không có giá trị nào được chọn.");
      }
    });
  });
</script>

<script>
  function toggleFields() {
    const useCondition = document.getElementById("useCondition").value;
    const minOrderValueDiv = document.getElementById("minOrderValueDiv");
    const minOrderValueInput = document.getElementById("minOrderValue");
    const categorySelectDiv = document.getElementById("categorySelectDiv");
    const categorySelectInput = document.getElementById("categoryIds");

    // Ẩn tất cả các trường và loại bỏ thuộc tính required
    minOrderValueDiv.style.display = "none";
    minOrderValueInput.removeAttribute("required");

    categorySelectDiv.style.display = "none";
    categorySelectInput.removeAttribute("required");

    // Hiển thị trường và thêm thuộc tính required dựa trên giá trị useCondition
    if (useCondition === "min") {
      minOrderValueDiv.style.display = "flex";
      minOrderValueInput.setAttribute("required", "required");
    } else if (useCondition === "product") {
      categorySelectDiv.style.display = "flex";
      categorySelectInput.setAttribute("required", "required");
    }
  }

  // Gọi hàm toggleFields khi tải trang (để xử lý trường hợp chỉnh sửa)
  document.addEventListener("DOMContentLoaded", toggleFields);
</script>
</body>
</html>
