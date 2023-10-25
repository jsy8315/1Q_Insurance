<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>SideBar</title>
    <!-- Custom fonts for this template-->
    <link href="css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/sb-admin-2.css" />

</head>
<body>
<!-- Sidebar -->
<ul
        class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
        id="accordionSidebar">
    <!--bg-gradient-secondary로 색변경-->

    <!-- Sidebar - Brand -->
    <a class="sidebar-brand d-flex align-items-center justify-content-center">
        <div class="sidebar-brand-text mx-3" style="cursor:pointer;" onclick="window.location.href='<%= request.getContextPath() %>/mypageHome'">
            사용자 정수일
        </div>
    </a>

    <!-- Divider -->
    <hr class="sidebar-divider my-0">

    <!-- Nav Item - Dashboard -->
    <li class="nav-item active">
        <a class="nav-link" style="cursor:pointer;" onclick="window.location.href='<%= request.getContextPath() %>/'">
            <span>메인 페이지</span>
        </a>
    </li>

    <!-- Divider -->
    <hr class="sidebar-divider">

    <!-- Heading -->
    <div class="sidebar-heading">보험 상품 관리</div>

    <!-- Nav Item - Pages Collapse Menu -->
    <!-- Product -->
    <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo"
           aria-expanded="true" aria-controls="collapseTwo"> <span>내 정보 확인</span>
        </a>
        <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
                <h6 class="collapse-header">내 정보</h6>
                <a class="collapse-item" style="cursor:pointer;" onclick="window.location.href='<%= request.getContextPath() %>/adminProductTable'">
                    기본 정보 확인하기
                </a>
                <a class="collapse-item" style="cursor:pointer;" onclick="window.location.href='<%= request.getContextPath() %>/mypageProductTable'">
                    가입 보험 확인하기
                </a>
                <a class="collapse-item" href="admin_enroll_product">

                </a>
            </div>
        </div>
    </li>

    <!-- Nav Item - Utilities Collapse Menu -->
    <!-- Order -->
    <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities"
           aria-expanded="true" aria-controls="collapseUtilities"><span>장바구니</span>
        </a>
        <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
                <h6 class="collapse-header">cart</h6>
                <a class="collapse-item" style="cursor:pointer;" onclick="window.location.href='<%= request.getContextPath() %>/adminAddProduct'">
                    장바구니 확인하기
                </a>
            </div>
        </div>
    </li>

    <!-- Divider -->
    <hr class="sidebar-divider d-none d-md-block">

</ul>
