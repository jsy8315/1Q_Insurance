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
                <h1 class="h3 mb-2 text-gray-800">보험금 청구 심사 결과</h1>
                <p class="mb-4">

                </p>

                <!-- DataTales Example -->
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary" style="font-size:0.8rem;">청구내용</h6>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive" style="overflow-x:auto;">
                            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0" style="font-size:0.8rem;">
                                <h4>청구인 정보</h4>
                                <thead>
                                <tr>
                                    <th>청구ID</th>
                                    <th>성명</th>
                                    <th>주민등록번호</th>
                                    <th>청구일자</th>
                                    <th>청구은행</th>
                                    <th>청구은행 계좌번호</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="claim" items="${claims}">
                                    <tr>
                                        <td>${claim.claimid}</td> <!--청구id-->
                                        <td>정수일</td>
                                        <td>730606-1187922</td>
                                        <td>${claim.claimdate}</td>
                                        <td>${claim.claimbank}</td>
                                        <td>${claim.claimaccount}</td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>

                            <table class="table table-bordered" id="dataTable02" width="100%" cellspacing="0" style="font-size:0.8rem;">
                                <h4>보험 상품 정보</h4>
                                <thead>
                                <tr>
                                    <th>청구ID</th>
                                    <th>청구일자</th>
                                    <th>보험회사이름</th>
                                    <th>보험상품ID</th>
                                    <th>보험상품명</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="claim" items="${claims}">
                                    <tr>
                                        <td>${claim.claimid}</td> <!--청구id-->
                                        <td>${claim.claimdate}</td>
                                        <td>${claim.insurancecompanyname}</td>
                                        <td>${claim.insuranceproductid}</td>
                                        <td>${claim.insurancename}</td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>

                            <table class="table table-bordered" id="dataTable03" width="100%" cellspacing="0" style="font-size:0.8rem;">
                                <h4>청구 서류</h4>
                                <thead>
                                <tr>
                                    <th>서류 종류</th>
                                    <th>서류명</th>
                                    <th>확인</th>
                                </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>필수 서류</td>
                                        <td>진단서</td>
                                        <td>
                                            <button id="detailButton01" class="complete-button" style="padding: 5px 10px; font-size: 12px; margin: 0px;">자세히 보기</button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>필수 서류</td>
                                        <td>입퇴원 확인서</td>
                                        <td>
                                            <button id="detailButton02" class="complete-button" style="padding: 5px 10px; font-size: 12px; margin: 0px;">자세히 보기</button>
                                        </td>
                                    </tr>
                                </tbody>
                                <div id="myModal01" class="modal">
                                    <span class="close01">&times;</span>
                                    <img class="modal-content" id="img01" style="width: 50%; height: 100%;">
                                    <div id="caption01"></div>
                                </div>
                                <div id="myModal02" class="modal">
                                    <span class="close02" style="color: red; z-index: 9999;">&times;</span>
                                    <img class="modal-content" id="img02" style="width: 50%; height: 100%;">
                                    <div id="caption02"></div>
                                </div>
                            </table>

                            <table class="table table-bordered" id="dataTable04" width="100%" cellspacing="0" style="font-size:0.8rem;">
                                <h4>해당 상품 보장 내용</h4>
                                <thead>
                                <tr>
                                    <th>급부명</th>
                                    <th>지급사유</th>
                                    <th>지급액(원)</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td>
                                        초기이상</br>
                                        만성폐질환</br>
                                        진단자금
                                    </td>
                                    <td>
                                        피보험자가 보험기간 중 ‘초기이상 만성폐질환’으로 진단확정 받을 경우 (최초 1회 한함)</br>
                                        (다만, 중기이상 만성폐질환으로 진단확정시 해당급부는 지급하지 않음.)
                                    </td>
                                    <td>
                                        100만원
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        중기이상</br>
                                        만성폐질환</br>
                                        진단자금
                                    </td>
                                    <td>
                                        피보험자가 보험기간 중 ‘중기이상 만성폐질환’으로 진단확정 받을 경우 (최초 1회 한함)	                                    </td>
                                    <td>
                                        500만원
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        폐암
                                        진단자금
                                    </td>
                                    <td>
                                        피보험자가 보험기간 중 암보장개시일 이후에 폐암으로 진단확정된 경우 (계약일부터 1년미만 진단확정시 50%지급, 최초 1회 한함)
                                    </td>
                                    <td>
                                        1000만원
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        호흡기질환</br>
                                        입원비
                                    </td>
                                    <td>
                                        피보험자가 보험기간 중 ‘호흡기질환’으로 진단확정 받고 그 직접적인 치료를 목적으로 4일 이상 계속하여 입원하였을 때</br>
                                        (1회 입원당 120일 한도)
                                    </td>
                                    <td>
                                        3만원</br>
                                        (3일초과 1일당)
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        호흡기질환</br>
                                        수술비
                                    </td>
                                    <td>
                                        피보험자가 보험기간 중 ‘호흡기질환’으로 진단확정 받고 그 직접적인 치료를 목적으로 수술을 받았을 때                                    </td>
                                    <td>
                                        30만원</br>
                                        (수술 1회당)
                                    </td>
                                </tr>
                                </tbody>
                            </table>

                            <table class="table table-bordered" id="dataTable05" width="100%" cellspacing="0" style="font-size:0.8rem;">
                                <h4>심사 결과</h4>
                                <thead>
                                <tr>
                                    <th>해당 급부명</th>
                                    <th>지급사유 심사 결과</th>
                                    <th>지급액(원)</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="diagnosis" items="${diagnosis}">
                                <tr>
                                    <td>
                                        초기이상</br>
                                        만성폐질환</br>
                                        진단자금
                                    </td>
                                    <td>
                                        <c:if test="${not empty processedData.result01}">
                                            ${processedData.result01}
                                        </c:if>
                                    </td>
                                    <td>
                                        <c:if test="${not empty processedData.result01payment}">
                                            ${processedData.result01payment}
                                        </c:if>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        중기이상</br>
                                        만성폐질환</br>
                                        진단자금
                                    </td>
                                    <td>
                                        해당사항 없음
                                        (1초간 노력성 호기량(FEV1.0)이 정상치의 50%이하)
                                    </td>
                                    <td>
                                        0
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        폐암
                                        진단자금
                                    </td>
                                    <td>
                                        <c:if test="${not empty processedData.result03}">
                                            ${processedData.result03}
                                        </c:if>
                                    </td>
                                    <td>
                                        <c:if test="${not empty processedData.result03payment}">
                                            ${processedData.result03payment}
                                        </c:if>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        호흡기질환</br>
                                        입원비
                                    </td>
                                    <td>
                                        입원일수 : 2023-09-18 ~ 2023-09-25
                                    </td>
                                    <td>
                                        240000
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        호흡기질환</br>
                                        수술비
                                    </td>
                                    <td>
                                        <c:if test="${not empty processedData.result05}">
                                            ${processedData.result05}
                                        </c:if>
                                        (${diagnosis.diagnosissurgery})</br>
                                    </td>
                                    <td>
                                        <c:if test="${not empty processedData.result05payment}">
                                            ${processedData.result05payment}
                                        </c:if>
                                    </td>
                                </tr>

                                </c:forEach>
                                </tbody>
                            </table>
                            <h2 style="text-align: center">총 지급액 : ${processedData.totalpayment}</h2>
                            <div style="text-align: center">
                                <button id="completeButton01" class="complete-button-reverse" style="margin-top: 10px; margin-bottom: 0px;" data-toggle="modal" data-target="#myModal">
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
                                            <c:forEach var="claim" items="${claims}">
                                            수신자 성명 : 정수일</br>
                                            수신자 번호 : 010-9889-0002</br>
                                            문자 내용</br>
                                                정수일님이 신청한 보험금 청구 심사가 완료되었습니다.</br>
                                            </c:forEach>
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
                var phoneNumber = "010-9889-0636";  // 실제 수신자 번호로 변경해주세요

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

    <!--화폐처럼 표시-->
    <!-- 숫자를 화폐 형식으로 변환하는 함수 -->
    <script type="text/javascript">
        function numberWithCommas(x) {
            return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
        }
    </script>

    <!-- 화폐 형식으로 변환된 숫자를 화면에 표시 -->
    <script type="text/javascript">
        $(document).ready(function() {
            var totalPayment = ${processedData.totalpayment};
            totalPayment = numberWithCommas(totalPayment);
            $('h2').text('총 지급액 : ' + totalPayment);
        });
    </script>

</div>
</body>
</html>
<jsp:include page="./adminFooter.jsp" />
