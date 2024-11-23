<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="header.jsp" />
<%--------------------------------------------------------%>
<c:import url="sidebar.jsp" />
<script>
    document.addEventListener("DOMContentLoaded", function() {
        document.title = "Danh sách khách hàng";
        const listStaffElement = document.getElementById("list-customer");
        if (listStaffElement) {
            listStaffElement.classList.add("active");
        }
    });
</script>

    <div class="page-wrapper">
        <div class="content">

            <div class="page-header">
                <div class="page-title">
                    <h4>Quản lý Khách Hàng</h4>
                    <h6></h6>
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
                                        <input type="text" placeholder="Nhập số điện thoại...">
                                    </div>
                                </div>
                                <div class="col-lg-2 col-sm-6 col-12">
                                    <div class="form-group">
                                        <input type="text" placeholder="Nhập tên... ">
                                    </div>
                                </div>
                                <div class="col-lg-2 col-sm-6 col-12">
                                    <div class="form-group">
                                        <input type="text" placeholder="Nhập email...">
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
                                <th>Tên Khách Hàng</th>
                                <th>Ngày Sinh</th>
                                <th>Số Điện Thoại</th>
                                <th>Email</th>
                                <th>Địa Chỉ</th>
                                <th>Trạng Thái</th>
                                <th>Hành Động</th>
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
                                        <img src="assets/img/customer/customer1.jpg" alt="product">
                                    </a>
                                    <a href="javascript:void(0);">Trần Anh Thư</a>
                                </td>
                                <td>27/09/2004</td>
                                <td>0339263066</td>

                                <td>trananhthu270904@gmail.com</a>
                                </td>
                                <td>129/123/145/Tăng Nhơn Phú/ Thủ Đức</td>
                                <td><span class="badges bg-lightgreen">Active</span></td>
                                <td>
                                    <a class="me-3" href="listOrder.jsp">
                                        <img src="assets/img/icons/edit.svg" alt="img">
                                    </a>
                                    <a class="me-3 confirm-text" href="javascript:void(0);">
                                        <img src="assets/img/icons/delete.svg" alt="img">
                                    </a>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label class="checkboxs">
                                        <input type="checkbox">
                                        <span class="checkmarks"></span>
                                    </label>
                                </td>
                                <td class="productimgname">
                                    <a href="javascript:void(0);" class="product-img">
                                        <img src="assets/img/customer/customer1.jpg" alt="product">
                                    </a>
                                    <a href="javascript:void(0);">Hoàng Thi Minh Bạch</a>
                                </td>
                                <td>27/09/2004</td>
                                <td>0339263066</td>

                                <td>trananhthu270904@gmail.com</a>
                                </td>
                                <td>129/123/145/Tăng Nhơn Phú/ Thủ Đức</td>
                                <td><span class="badges bg-lightred">In Active</span></td>
                                <td>
                                    <a class="me-3" href="listOrder.jsp">
                                        <img src="assets/img/icons/edit.svg" alt="img">
                                    </a>
                                    <a class="me-3 confirm-text" href="javascript:void(0);">
                                        <img src="assets/img/icons/delete.svg" alt="img">
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

<c:import url="footer.jsp"/>