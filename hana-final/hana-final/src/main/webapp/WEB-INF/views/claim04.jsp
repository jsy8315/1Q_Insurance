<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>보험금 청구 화면03</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/background01.css" />
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
        4. 청구 완료
    </div>
    <div class="section-description">
        청구가 완료되었습니다. 심사 후, 보험금이 지급됩니다.
    </div>
    <div class="main-feature-section" style="text-align: center;">
        <div class="row sample-card" style="margin: 10px; margin-bottom: 20px; font-size: 40px; text-align: center; height: 30%;">
            청구가 완료되었습니다.
        </div>
    </div>
</div>
</div>

<div style="margin-top: 40px; margin-bottom: 50px;">
    <a href="#" onclick="window.location.href='<%= request.getContextPath() %>/'" style="display: inline-block;  padding: 10px 20px; background: #00a39e; color: #fff; font-size: 18px; font-weight: 500; text-decoration: none; border-radius: 5px;">
        메인화면으로 이동
    </a>
</div>

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

</body>
</html>
