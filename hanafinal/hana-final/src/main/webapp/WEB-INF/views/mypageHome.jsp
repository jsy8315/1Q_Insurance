<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>mypage Main</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/mypage.css" />
</head>
<body>
<div id="wrapper">

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-cloumn">
        <jsp:include page="./mypageSidebar.jsp" />
        <!-- Main Content -->
        <div id="content">
            <jsp:include page="./mypageTopbar.jsp" />
            <!-- Begin Page Content -->
            <div class="container-fluid">
                <!-- Page Heading -->
                <div class="d-sm-flex align-items-center justify-content-between mb-4">
                    <h1 class="h3 mb-0 text-gray-800">마이페이지</h1>
                </div>

                <div class="row sample-card" style="background-color: white">
                    <div class="info-section">
                        <h3>정수일님 안녕하세요.🙂</h3>
                        <button class="info-button">정보변경</button>
                        <button class="info-button">보험 관리</button>
                        <button class="info-button">보험료 관리</button>
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

</div>
</body>
</html>
<jsp:include page="./mypageFooter.jsp" />
