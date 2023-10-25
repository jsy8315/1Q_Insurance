<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>product table</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/button.css" />
    <!--극적인 효과를 주기 위해 로딩 과정 추가-->
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/adminChargeScreenLoadingModal.css">

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
                <h1 class="h3 mb-2 text-gray-800">보험금 청구 심사</h1>
                <p class="mb-4">
                    보험금 청구 요청을 조회합니다. 심사할 청구 요청을 선택하세요.
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
                                    <th>청구ID</th>
                                    <th>성명</th>
                                    <th>청구일자</th>
                                    <th>보험회사이름</th>
                                    <th>보험상품ID</th>
                                    <th>보험상품명</th>
                                    <th>선택</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="claim" items="${claims}">
                                    <tr>
                                        <td>${claim.claimid}</td> <!--청구id-->
                                        <td>정수일</td>
                                        <td>${claim.claimdate}</td>
                                        <td>${claim.insurancecompanyname}</td>
                                        <td>${claim.insuranceproductid}</td>
                                        <td>${claim.insurancename}</td>
                                        <td><input type="radio" name="selectedClaim" value="${claim.claimid}"></td> <!-- 라디오 버튼 -->
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                            <div style="text-align: right">
                                <button id="loadingOn" class="complete-button" style="margin-top: 10px; margin-bottom: 0px;">심사 시작</button>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>

    <!--로딩 모달창-->
    <div id="myModal" class="modal">
        <div class="modal-content">
            <div id="loading" class="loading-div">
                <div>
                    <div class="spinner"></div>
                </div>
                <p>해당 보험금 청구건을 심사 중입니다...</p>
            </div>
            <div id="completed" class="completed-div" style="display:none;">
                <p>심사가 완료되었습니다!</p>
                <button id="reviewButton" class="complete-button" style="margin-top: 10px; margin-bottom: 0px;">
                    심사 결과 확인하기
                </button>
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

    <!--Loading 관련-->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <script>
        $(document).ready(function() {
            // Review button click logic
            $('#reviewButton').click(function() {
                var selectedClaimId = $('input[name="selectedClaim"]:checked').val();

                if (selectedClaimId) {
                    // AdminController로 데이터를 전달
                    window.location.href = '${pageContext.request.contextPath}/reviewClaim?claimId=' + selectedClaimId;
                } else {
                    alert('심사할 청구 요청을 선택해주세요.');
                }
            });
        });
    </script>

    <!--Loading 관련-->
    <script>
        $(document).ready(function() {
            $("#loadingOn").click(function() {
                $("#myModal").css({
                    'display': 'flex',
                    'align-items': 'center',  // 이 부분으로 스피너를 가운데로 위치
                    'justify-content': 'center'  // 이 부분도 중앙 정렬을 위해 필요
                });
                $('.modal-content').css({
                    'width': '800px',  // 이 부분으로 모달 창의 가로 크기를 조절
                    'height': '400px'  // 이 부분으로 모달 창의 세로 크기를 조절
                });
                $('.loading-div').css({
                    'display': 'flex',
                    'align-items': 'center',  // 이 부분으로 스피너를 가운데로 위치
                    'justify-content': 'center'  // 이 부분도 중앙 정렬을 위해 필요
                });
                // 로딩 표시
                $('#loading').css({
                    'display' : 'flex',
                    'text-align': 'center',  // 이 부분으로 텍스트를 가운데로 위치
                    'justify-content': 'center'
                });
                $('#completed').css('display', 'none');

                // 3초 후 로딩 표시 숨기기 및 완료 메시지 표시
                setTimeout(function() {
                    $('#loading').css({
                        'display' : 'none',
                        'text-align': 'center',  // 이 부분으로 텍스트를 가운데로 위치
                        'justify-content': 'center'
                    });
                    $('#completed').css({
                        'display':'block',
                        'text-align': 'center',  // 이 부분으로 텍스트를 가운데로 위치
                        'justify-content': 'center'
                    });
                }, 3000);  // 3초 후 실행
            });

            // 모달 바깥을 클릭했을 때 모달을 숨기도록 설정
            $(window).click(function(e) {
                if ($(e.target).is('#myModal')) {
                    $("#myModal").css("display", "none");
                }
            });
        });

        // 모달 창 닫기
        function closeModal() {
            document.getElementById('myModal').style.display = "none";
        }
    </script>


</div>
</body>
</html>
<jsp:include page="./adminFooter.jsp" />
