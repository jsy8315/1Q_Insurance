<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>product table</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/button.css" />
    <!--
        <link rel="stylesheet" href="<%= request.getContextPath() %>/css/adminChargeScreenModal.css" />
    -->
    <!--
        <link rel="stylesheet" href="<%= request.getContextPath() %>/css/recommendmodal.css" />
    -->
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/fileupload.css" />
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/recommendmodal.css" />
</head>
<body>
<div id="wrapper">

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-cloumn">
        <jsp:include page="./adminSidebar.jsp" />
        <!-- Main Content -->
        <div id="content">
            <jsp:include page="./adminTopbar.jsp" />
            <!-- Begin Page Content -->
            <div class="container-fluid">

                <!-- Page Heading -->
                <h1 class="h3 mb-2 text-gray-800">보험 상품 가입 심사 결과</h1>
                <p class="mb-4">

                </p>

                <!-- DataTales Example -->
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary" style="font-size:0.8rem;">가입 내용</h6>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive" style="overflow-x:auto;">
                            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0" style="font-size:0.8rem;">
                                <h4>청구인 정보</h4>
                                <thead>
                                <tr>
                                    <th>사용자ID</th>
                                    <th>성명</th>
                                    <th>주민등록번호</th>
                                    <th>휴대전화번호</th>
                                    <th>이메일</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="targetusers" items="${targetusers}">
                                    <tr>
                                        <td>${targetusers.id}</td>
                                        <td>${targetusers.name}</td>
                                        <td>${targetusers.ssn}</td>
                                        <td>${targetusers.loginid}</td>
                                        <td>${targetusers.useremail}</td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>

                            <table class="table table-bordered" id="dataTable02" width="100%" cellspacing="0" style="font-size:0.8rem;">
                                <h4>가입 요청 상품 정보</h4>
                                <thead>
                                <tr>
                                    <th>보험상품ID</th>
                                    <th>보험회사명</th>
                                    <th>보험상품유형</th>
                                    <th>보험상품명</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="targetinsuranceproducts" items="${targetinsuranceproducts}">
                                    <tr>
                                        <td>${targetinsuranceproducts.insuranceproductid}</td> <!--청구id-->
                                        <td>${targetinsuranceproducts.insurancecompanyname}</td>
                                        <td>${targetinsuranceproducts.insurancetype}</td>
                                        <td>${targetinsuranceproducts.insurancename}</td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>

                            <table class="table table-bordered" id="dataTable03" width="100%" cellspacing="0" style="font-size:0.8rem;">
                                <h4>해당 상품 보장 내용</h4>
                                <thead>
                                <tr>
                                    <th>보험기간</th>
                                    <th>납입기간</th>
                                    <th>가입나이</th>
                                    <th>가입금액</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td>
                                        3년 만기
                                    </td>
                                    <td>
                                        일시납
                                    </td>
                                    <td>
                                        20~50세
                                    </td>
                                    <td>
                                        1000만원
                                    </td>
                                </tr>
                                </tbody>
                            </table>

                            <table class="table table-bordered" id="dataTable04" width="100%" cellspacing="0" style="font-size:0.8rem;">
                                <h4>심사 결과</h4>
                                <thead>
                                <tr>
                                    <th>해당 기준</th>
                                    <th>가입 심사 결과</th>
                                </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>
                                            가입 나이 (만 20세 ~ 만 50세)
                                        </td>
                                        <td>
                                            <c:if test="${not empty processedData.result01}">
                                                ${processedData.result01}
                                            </c:if>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            건강 검진 진단 결과
                                        </td>
                                        <td>
                                            <c:if test="${not empty processedData.result02}">
                                                ${processedData.result02}
                                            </c:if>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            예상 보험료
                                        </td>
                                        <td>
                                            <c:if test="${not empty processedData.result02}">
                                                ${processedData.result02payment}
                                            </c:if>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            <div style="text-align: center">
                                <button id="completeButton01" class="complete-button-reverse" style="margin-top: 10px; margin-bottom: 0px; border-color: black;" data-toggle="modal" data-target="#myModal">
                                    완료 알람 전송
                                </button>
                                <button id="completeButton02" class="complete-button" onclick="window.location.href='<%= request.getContextPath() %>/adminHome'" style="margin-top: 10px; margin-bottom: 0px;">관리자 홈</button>
                            </div>
                            <div class="modal" id="myModal">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <!-- Modal Header -->
                                        <div class="modal-header" style="text-align: left">
                                            <h4 class="modal-title">완료 알람 메시지 보내기</h4>
                                        </div>
                                        <!-- Modal body -->
                                        <div class="modal-body" style="text-align: left">
                                                수신자 성명 : 정수일</br>
                                                수신자 번호 : 010-9889-0002</br>
                                                문자 내용</br>
                                                정수일님이 신청한 보험 가입 신청 심사가 완료되었습니다.</br>
                                        </div>
                                        <!-- Modal footer -->
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-danger" data-dismiss="modal" style="background-color: #00a39e; border-color: #00a39e">전송</button>
                                            <button type="button" class="btn btn-danger" data-dismiss="modal" style="background-color: #00a39e;  border-color: #00a39e">닫기</button>
                                        </div>
                                    </div>
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
    <script>
        var modal = document.getElementById("myModal01");

        var img = document.getElementById("detailButton01");
        var modalImg = document.getElementById("img01");
        img.onclick = function(){
            modal.style.display = "block";
            modalImg.src = "${pageContext.request.contextPath}/img/diagnosis.png"; // 이미지 경로를 여기에 지정
        }

        var span = document.getElementsByClassName("close01")[0];

        span.onclick = function() {
            modal.style.display = "none";
        }
    </script>
    <script>
        var modal = document.getElementById("myModal02");

        var img = document.getElementById("detailButton02");
        var modalImg = document.getElementById("img02");
        img.onclick = function(){
            modal.style.display = "block";
            modalImg.src = "${pageContext.request.contextPath}/img/hospitalization.png"; // 이미지 경로를 여기에 지정
        }

        var span = document.getElementsByClassName("close02")[0];

        span.onclick = function() {
            modal.style.display = "none";
        }
    </script>
    <!--coolsms관련-->
    <!-- jQuery 라이브러리 추가 -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <script type="text/javascript">
        $(document).ready(function(){
            $(".btn-danger").click(function(){
                var phoneNumber = "010-9889-0002";  // 실제 수신자 번호로 변경해주세요

                $.ajax({
                    url: '/sendSMS',
                    type: 'GET',
                    data: { phoneNumber: phoneNumber },
                    success: function(response) {
                        alert("메시지가 성공적으로 전송되었습니다.");
                        // 여기에 모달을 닫는 코드를 추가할 수 있습니다.
                    },
                    error: function(error) {
                        alert("메시지 전송에 실패했습니다.");
                    }
                });
            });
        });
    </script>


</div>
</body>
</html>
<jsp:include page="./adminFooter.jsp" />
