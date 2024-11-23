<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:import url="header.jsp" />
<%--------------------------------------------------------%>
<c:import url="sidebar.jsp" />
<script>
    document.addEventListener("DOMContentLoaded", function() {
        document.title = "Danh sách đơn hàng";
        const listStaffElement = document.getElementById("list-category");
        if (listStaffElement) {
            listStaffElement.classList.add("active");
        }
    });
</script>
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
<c:import url="footer.jsp"/>