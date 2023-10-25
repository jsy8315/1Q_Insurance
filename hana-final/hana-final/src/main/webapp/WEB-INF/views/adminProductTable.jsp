<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>product table</title>
</head>
<body>
<div id="wrapper">

  <!-- Content Wrapper -->
  <div id="content-wrapper" class="d-flex flex-cloumn">
    <jsp:include page="./adminSidebar.jsp" />
    <!-- Main Content -->
    <div id="content" style="max-width: 85%; margin: 0 auto;">
      <jsp:include page="./adminTopbar.jsp" />
      <!-- Begin Page Content -->
      <div class="container-fluid">
        <!-- Page Heading -->
        <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <h1 class="h3 mb-2 text-gray-800">보험 상품 조회</h1>
          <p class="mb-4">
            등록된 모든 보험 상품을 조회합니다.
          </p>

          <!-- DataTales Example -->
          <div class="card shadow mb-4">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary" style="font-size:0.8rem;">전체 보험 상품</h6>
            </div>
            <div class="card-body">
              <div class="table-responsive" style="overflow-x:auto;">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0" style="font-size:0.8rem;">
                  <thead>
                  <tr>
                    <th style="width:2%;">보험상품ID</th>
                    <th style="width:5%;">보험회사명</th>
                    <th style="width:20%;">보험상품명</th>
                    <th style="width:1%;">보험료</th>
                    <th style="width:5%;">비고</th>
                  </tr>
                  </thead>
                  <tbody>
                    <c:forEach var="item" items="${list}">
                      <tr>
                        <th>${item.insuranceproductid}</th>
                        <th>${item.insurancecompanyname}</th>
                        <th>${item.insurancename}</th>
                        <th>${item.insurancefee}</th>
                        <th>-</th>
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
</div>
  <!-- Bootstrap core JavaScript-->
  <script src="${pageContext.request.contextPath}/vendor/jquery/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="${pageContext.request.contextPath}/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="${pageContext.request.contextPath}/js/sb-admin-2.min.js"></script>

  <!-- Page level plugins -->
  <script src="${pageContext.request.contextPath}/vendor/chart.js/Chart.min.js"></script>

  <!-- Page level custom scripts -->
  <script src="${pageContext.request.contextPath}/js/admin_demo/chart-area-demo.js"></script>
  <script src="${pageContext.request.contextPath}/js/admin_demo/chart-pie-demo.js"></script>
</div>
</body>
</html>
<jsp:include page="./adminFooter.jsp" />
