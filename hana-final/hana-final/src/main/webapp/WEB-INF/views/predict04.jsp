<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>보험 추천 화면</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/background01.css" />
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/button.css" />
    <!--로그인, 회원가입, 질병예측하기 버튼 자동 가운데 정렬 문제 일으켰던 부분, donut 처리함-->
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/riskScore.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/predict04modal.css">
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
</head>
<jsp:include page="./header.jsp" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<body>
<div class="content-section">
    <div class="section-header">
        4. 정수일님을 위한 추천 보험은<br>
        다음과 같습니다.
    </div>
    <div class="section-description">
        질병 예측을 바탕으로, 보험을 추천합니다.
    </div>
    <div class="main-feature-section" style="height: 230px;">

    </div>
</div>
<!-- 모달 창 -->

<div id="myModal" class="modal">
    <div class="modal-content">
        <div id="loading" class="loading-div">
            <div class="spinner"></div>
            <p>예측 점수를 기반으로 보험을 추천 중입니다...</p>
        </div>
        <div id="completed" class="completed-div" style="display:none;">
            <p>보험 추천이 완료되었습니다!</p>
            <button class="complete-button" onclick="closeModal(); window.location.href='<%= request.getContextPath() %>/recommend'">
                추천 보험 확인하기
            </button>
        </div>
    </div>
</div>

    <footer style="background: #00a39e; padding: 40px 0; color: #fff; text-align: center;">
        <p style="font-size: 16px; margin: 0;">© 2023 1Q Insurance. All rights reserved.</p>
        <p style="font-size: 14px; margin: 10px 0 0;">인천 서구 에코로 167 하나금융그룹 통합데이터센터 비전센터</p>
    </footer>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/riskScore.js"></script>
    <script src="${pageContext.request.contextPath}/js/predict04js.js"></script>
</body>
</html>
