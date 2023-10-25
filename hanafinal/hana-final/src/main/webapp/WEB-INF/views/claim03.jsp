<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>보험금 청구 화면02</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/backgroundClaim01.css" />
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/button.css" />
    <!--로그인, 회원가입, 질병예측하기 버튼 자동 가운데 정렬 문제 일으켰던 부분, donut 처리함-->
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/button.css" />
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/recommend.css" />
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/claim.css" />
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/recommendmodal.css" />
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/claimTable02.css" />
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/fileupload.css" />
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

    <!--날짜-->

    <style>
        body {
            text-align: center; /* 내용을 가운데 정렬 */
        }
        .content-section {
            margin-top: 50px; /* 상단 여백 추가 */
        }
        .section-header {
            font-size: 50px; /* 글자 크기 */
            font-weight: 500; /* 글자 진하기 */
            margin-bottom: 10px; /* 문구 아래 여백 */
        }
        .section-description {
            font-size: 16px; /* 글자 크기 */
        }
    </style>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<jsp:include page="./header.jsp"/>
<body>
<div class="content-section">
    <div class="section-header">
        3. 청구 내역 확인
    </div>
    <div class="section-description">
        보험금 청구 전, 최종적으로 내역을 확인하세요.
    </div>
    <div class="main-feature-section">
        <div class="row sample-card" style="margin: 10px; margin-bottom: 10px; display: flex; align-items: center; justify-content: center; height: 20px; font-size: 20px; background-color: #E9F2F1;">
            01. 청구 내용
        </div>
        <div class="row sample-card" style="margin: 10px; margin-bottom: 20px; background-color: #E9F2F1;">
                <table id="claim-details-table" style="width: 80%; margin: 0 auto; background-color: white; border-radius: 10px; text-align: center;">
                    <thead>
                    <tr>
                        <th></th>
                        <!--<th style="text-align: center">상세내역</th>-->
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="claim" items="${claimsWithStatusOne}">
                        <tr>
                            <td>청구 상세 내용</td>
                            <td>${claim.claimcontent}</td>
                        </tr>
                        <tr>
                            <td>발생 장소</td>
                            <td>${claim.claimplace}</td>
                        </tr>
                        <tr>
                            <td>발생 시간</td>
                            <td>${claim.claimdate}</td>
                        </tr>
                        <tr>
                            <td>청구금 수령 은행</td>
                            <td>${claim.claimbank}</td>
                        </tr>
                        <tr>
                            <td>청구금 수령 계좌번호</td>
                            <td>${claim.claimaccount}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
        </div>
        <form id="claimForm" action="/claim/submit" method="post" enctype="multipart/form-data">

        <div class="row sample-card" style="margin: 10px; margin-bottom: 10px; display: flex; align-items: center; justify-content: center; height: 20px; font-size: 20px; background-color: #E9F2F1;">
            02. 필요 서류
        </div>

        <div class="row sample-card" style="margin: 10px; margin-bottom: 10px; display: flex; justify-content: center; align-items: center; background-color: #E9F2F1;">

            <div class="filebox bs3-primary preview-image">
                <span>진단서 사진 등록 </span>
                <input class="upload-name" value="파일선택" disabled="disabled" style="width: 400px;">
                <label id="previewBtn">미리보기</label>
                <label for="input_file">업로드</label>
                <input type="file" id="input_file" name="diagnosisImage" class="upload-hidden">
            </div>

            <div id="previewModal" class="modal">
                <div class="modal-content">
                    <span class="close-btn">&times;</span>
                    <img id="previewImage" src="" alt="Image Preview">
                </div>
            </div>
        </div>
        <!-- 새로운 입퇴원증명서 업로드 부분 -->
        <div class="row sample-card" style="margin: 10px; margin-bottom: 20px; display: flex; justify-content: center; align-items: center; background-color: #E9F2F1;">
            <div class="filebox bs3-primary preview-image">
                <span>입퇴원증명서 사진 등록</span>
                <input class="upload-name" value="파일선택" disabled="disabled" style="width: 400px;">
                <label id="previewBtn_hosp">미리보기</label>
                <label for="input_file_hosp">업로드</label>
                <input type="file" id="input_file_hosp" name="hospitalizationImage" class="upload-hidden">
            </div>
        </div>
        <div id="previewModal_hosp" class="modal">
            <div class="modal-content">
                <span class="close-btn">&times;</span>
                <img id="previewImage_hosp" src="#" alt="Preview Image">
            </div>
        </div>

        </div>
    </div>
</div>

<button class="complete-button" type="submit">청구하기</button>
</form>

<footer style="background: #00a39e; padding: 40px 0; color: #fff; text-align: center;">
    <p style="font-size: 16px; margin: 0;">© 2023 1Q Insurance. All rights reserved.</p>
    <p style="font-size: 14px; margin: 10px 0 0;">인천 서구 에코로 167 하나금융그룹 통합데이터센터 비전센터</p>
</footer>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!-- Bootstrap JS and Popper.js -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="${pageContext.request.contextPath}/js/fileupload.js"></script>

</body>
</html>
