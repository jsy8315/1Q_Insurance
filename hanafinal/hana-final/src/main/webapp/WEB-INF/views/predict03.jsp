<%--
  Created by IntelliJ IDEA.
  User: JungSuyoung
  Date: 2023-09-11
  Time: 오후 4:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>데이터 기반 질병 예측 화면</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/background01.css" />
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/button.css" />
    <!--로그인, 회원가입, 질병예측하기 버튼 자동 가운데 정렬 문제 일으켰던 부분, donut 처리함-->
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/riskScore.css">
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
    <div class="section-header">3. 질병 예측 결과</div>
    <div class="section-description">
        제휴병원에서 가져온 데이터 및 이력을 기반으로, <br>
        위험 점수를 산출하였습니다. 100점에 가까울수록 고위험군입니다.
    </div>
</div>

<div class="main-feature-section">

    <div class='donutChartContainer'>
        <div class="donutChart doughnut1">
            <span class="center">
                ${predictDTO.dg01Score}점
            </span>
        </div>
        <span class="scoreText">
            뇌혈관질환<br>
            <c:choose>
                <c:when test="${predictDTO.dg01Score >= 0 && predictDTO.dg01Score < 20}">
                    위험점수 ${predictDTO.dg01Score}점으로 정상입니다.<br>
                </c:when>
                <c:when test="${predictDTO.dg01Score >= 20 && predictDTO.dg01Score < 40}">
                    위험점수 ${predictDTO.dg01Score}점으로 저위험군입니다.<br>
                </c:when>
                <c:when test="${predictDTO.dg01Score >= 40 && predictDTO.dg01Score < 60}">
                    위험점수 ${predictDTO.dg01Score}점으로 중위험군입니다.<br>
                </c:when>
                <c:when test="${predictDTO.dg01Score >= 60 && predictDTO.dg01Score < 80}">
                    위험점수 ${predictDTO.dg01Score}점으로 고위험군입니다.<br>
                </c:when>
                <c:when test="${predictDTO.dg01Score >= 80 && predictDTO.dg01Score < 100}">
                    위험점수 ${predictDTO.dg01Score}점으로 초고위험군입니다.<br>
                </c:when>
                <c:otherwise>
                    위험점수를 판단할 수 없습니다.
                </c:otherwise>
            </c:choose>
            <span class="detailText">
                BMI, 허리둘레, 혈압, 총콜레스테롤, 약물력 등으로 인해 해당 위험군으로 판단됩니다.
            </span>
        </span>
    </div>
</div>
<div class="main-feature-section">
    <div class='donutChartContainer'>
        <div class="donutChart doughnut2">
            <span class="center">
                ${predictDTO.dg02Score}점
            </span>
        </div>
        <span class="scoreText">
            심장질환<br>
            <c:choose>
                <c:when test="${predictDTO.dg02Score >= 0 && predictDTO.dg02Score < 20}">
                    위험점수 ${predictDTO.dg02Score}점으로 정상입니다.<br>
                </c:when>
                <c:when test="${predictDTO.dg02Score >= 20 && predictDTO.dg02Score < 40}">
                    위험점수 ${predictDTO.dg02Score}점으로 저위험군입니다.<br>
                </c:when>
                <c:when test="${predictDTO.dg02Score >= 40 && predictDTO.dg02Score < 60}">
                    위험점수 ${predictDTO.dg02Score}점으로 중위험군입니다.<br>
                </c:when>
                <c:when test="${predictDTO.dg02Score >= 60 && predictDTO.dg02Score < 80}">
                    위험점수 ${predictDTO.dg02Score}점으로 고위험군입니다.<br>
                </c:when>
                <c:when test="${predictDTO.dg02Score >= 80 && predictDTO.dg02Score < 100}">
                    위험점수 ${predictDTO.dg02Score}점으로 초고위험군입니다.<br>
                </c:when>
                <c:otherwise>
                    위험점수를 판단할 수 없습니다.
                </c:otherwise>
            </c:choose>
            <span class="detailText">
                나이, BMI, 허리둘레, 혈압, 총콜레스테롤 등으로 인해 해당 위험군으로 판단됩니다.
            </span>
        </span>
    </div>
</div>
<div class="main-feature-section">
    <div class='donutChartContainer'>
        <div class="donutChart doughnut3">
            <span class="center">
                ${predictDTO.dg03Score}점
            </span>
        </div>
        <span class="scoreText">
            고혈압<br>
            <c:choose>
                <c:when test="${predictDTO.dg03Score >= 0 && predictDTO.dg03Score < 20}">
                    위험점수 ${predictDTO.dg03Score}점으로 정상입니다.<br>
                </c:when>
                <c:when test="${predictDTO.dg03Score >= 20 && predictDTO.dg03Score < 40}">
                    위험점수 ${predictDTO.dg03Score}점으로 저위험군입니다.<br>
                </c:when>
                <c:when test="${predictDTO.dg03Score >= 40 && predictDTO.dg03Score < 60}">
                    위험점수 ${predictDTO.dg03Score}점으로 중위험군입니다.<br>
                </c:when>
                <c:when test="${predictDTO.dg03Score >= 60 && predictDTO.dg03Score < 80}">
                    위험점수 ${predictDTO.dg03Score}점으로 고위험군입니다.<br>
                </c:when>
                <c:when test="${predictDTO.dg03Score >= 80 && predictDTO.dg03Score < 100}">
                    위험점수 ${predictDTO.dg03Score}점으로 초고위험군입니다.<br>
                </c:when>
                <c:otherwise>
                    위험점수를 판단할 수 없습니다.
                </c:otherwise>
            </c:choose>
            <span class="detailText">
                혈압, 나이, 음주여부 등으로 인해 해당 위험군으로 판단됩니다.
            </span>
        </span>
    </div>
</div>
<div class="main-feature-section">
    <div class='donutChartContainer'>
        <div class="donutChart doughnut4">
            <span class="center">
                ${predictDTO.dg04Score}점
            </span>
        </div>
        <span class="scoreText">
            당뇨병<br>
            <c:choose>
                <c:when test="${predictDTO.dg04Score >= 0 && predictDTO.dg04Score < 20}">
                    위험점수 ${predictDTO.dg04Score}점으로 정상입니다.<br>
                </c:when>
                <c:when test="${predictDTO.dg04Score >= 20 && predictDTO.dg04Score < 40}">
                    위험점수 ${predictDTO.dg04Score}점으로 저위험군입니다.<br>
                </c:when>
                <c:when test="${predictDTO.dg04Score >= 40 && predictDTO.dg04Score < 60}">
                    위험점수 ${predictDTO.dg04Score}점으로 중위험군입니다.<br>
                </c:when>
                <c:when test="${predictDTO.dg04Score >= 60 && predictDTO.dg04Score < 80}">
                    위험점수 ${predictDTO.dg04Score}점으로 고위험군입니다.<br>
                </c:when>
                <c:when test="${predictDTO.dg04Score >= 80 && predictDTO.dg04Score < 100}">
                    위험점수 ${predictDTO.dg04Score}점으로 초고위험군입니다.<br>
                </c:when>
                <c:otherwise>
                    위험점수를 판단할 수 없습니다.
                </c:otherwise>
            </c:choose>
            <span class="detailText">
                fbg, BMI, HbA1c, 허리둘레 등으로 인해 해당 위험군으로 판단됩니다.
            </span>
        </span>
    </div>
</div>
<div class="main-feature-section">
    <div class='donutChartContainer'>
        <div class="donutChart doughnut5">
            <span class="center">
                ${predictDTO.dg05Score}점
            </span>
        </div>
        <span class="scoreText">
            신장질환<br>
            <c:choose>
                <c:when test="${predictDTO.dg05Score >= 0 && predictDTO.dg05Score < 20}">
                    위험점수 ${predictDTO.dg05Score}점으로 정상입니다.<br>
                </c:when>
                <c:when test="${predictDTO.dg05Score >= 20 && predictDTO.dg05Score < 40}">
                    위험점수 ${predictDTO.dg05Score}점으로 저위험군입니다.<br>
                </c:when>
                <c:when test="${predictDTO.dg05Score >= 40 && predictDTO.dg05Score < 60}">
                    위험점수 ${predictDTO.dg05Score}점으로 중위험군입니다.<br>
                </c:when>
                <c:when test="${predictDTO.dg05Score >= 60 && predictDTO.dg05Score < 80}">
                    위험점수 ${predictDTO.dg05Score}점으로 고위험군입니다.<br>
                </c:when>
                <c:when test="${predictDTO.dg05Score >= 80 && predictDTO.dg05Score < 100}">
                    위험점수 ${predictDTO.dg05Score}점으로 초고위험군입니다.<br>
                </c:when>
                <c:otherwise>
                    위험점수를 판단할 수 없습니다.
                </c:otherwise>
            </c:choose>
            <span class="detailText">
                creatinine, eGFR, BUN, pH urine, protein urine 등으로 인해 해당 위험군으로 판단됩니다.
            </span>
        </span>
    </div>
</div>
<div class="main-feature-section">
    <div class='donutChartContainer'>
        <div class="donutChart doughnut6">
            <span class="center">
                ${predictDTO.dg06Score}점
            </span>
        </div>
        <span class="scoreText">
            호흡기질환<br>
            <c:choose>
                <c:when test="${predictDTO.dg06Score >= 0 && predictDTO.dg06Score < 20}">
                    위험점수 ${predictDTO.dg06Score}점으로 정상입니다.<br>
                </c:when>
                <c:when test="${predictDTO.dg06Score >= 20 && predictDTO.dg06Score < 40}">
                    위험점수 ${predictDTO.dg06Score}점으로 저위험군입니다.<br>
                </c:when>
                <c:when test="${predictDTO.dg06Score >= 40 && predictDTO.dg06Score < 60}">
                    위험점수 ${predictDTO.dg06Score}점으로 중위험군입니다.<br>
                </c:when>
                <c:when test="${predictDTO.dg06Score >= 60 && predictDTO.dg06Score < 80}">
                    위험점수 ${predictDTO.dg06Score}점으로 고위험군입니다.<br>
                </c:when>
                <c:when test="${predictDTO.dg06Score >= 80 && predictDTO.dg06Score < 100}">
                    위험점수 ${predictDTO.dg06Score}점으로 초고위험군입니다.<br>
                </c:when>
                <c:otherwise>
                    위험점수를 판단할 수 없습니다.
                </c:otherwise>
            </c:choose>
            <span class="detailText">
                흡연 유무, FVC, FEV1/FVC 등으로 인해 해당 위험군으로 판단됩니다.
            </span>
        </span>
    </div>
</div>
<div class="main-feature-section">
    <div class='donutChartContainer'>
        <div class="donutChart doughnut7">
            <span class="center">
                ${predictDTO.dg07Score}점
            </span>
        </div>
        <span class="scoreText">
            간질환<br>
            <c:choose>
                <c:when test="${predictDTO.dg07Score >= 0 && predictDTO.dg07Score < 20}">
                    위험점수 ${predictDTO.dg07Score}점으로 정상입니다.<br>
                </c:when>
                <c:when test="${predictDTO.dg07Score >= 20 && predictDTO.dg07Score < 40}">
                    위험점수 ${predictDTO.dg07Score}점으로 저위험군입니다.<br>
                </c:when>
                <c:when test="${predictDTO.dg07Score >= 40 && predictDTO.dg07Score < 60}">
                    위험점수 ${predictDTO.dg07Score}점으로 중위험군입니다.<br>
                </c:when>
                <c:when test="${predictDTO.dg07Score >= 60 && predictDTO.dg07Score < 80}">
                    위험점수 ${predictDTO.dg07Score}점으로 고위험군입니다.<br>
                </c:when>
                <c:when test="${predictDTO.dg07Score >= 80 && predictDTO.dg07Score < 100}">
                    위험점수 ${predictDTO.dg07Score}점으로 초고위험군입니다.<br>
                </c:when>
                <c:otherwise>
                    위험점수를 판단할 수 없습니다.
                </c:otherwise>
            </c:choose>
            <span class="detailText">
                AST, ALT, ALP, 음주 유무 등으로 인해 해당 위험군으로 판단됩니다.
            </span>
        </span>
    </div>
</div>
<div class="main-feature-section">
    <div class='donutChartContainer'>
        <div class="donutChart doughnut8">
            <span class="center">
                ${predictDTO.dg08Score}점
            </span>
        </div>
        <span class="scoreText">
            갑상선<br>
            <c:choose>
                <c:when test="${predictDTO.dg08Score >= 0 && predictDTO.dg08Score < 20}">
                    위험점수 ${predictDTO.dg08Score}점으로 정상입니다.<br>
                </c:when>
                <c:when test="${predictDTO.dg08Score >= 20 && predictDTO.dg08Score < 40}">
                    위험점수 ${predictDTO.dg08Score}점으로 저위험군입니다.<br>
                </c:when>
                <c:when test="${predictDTO.dg08Score >= 40 && predictDTO.dg08Score < 60}">
                    위험점수 ${predictDTO.dg08Score}점으로 중위험군입니다.<br>
                </c:when>
                <c:when test="${predictDTO.dg08Score >= 60 && predictDTO.dg08Score < 80}">
                    위험점수 ${predictDTO.dg08Score}점으로 고위험군입니다.<br>
                </c:when>
                <c:when test="${predictDTO.dg08Score >= 80 && predictDTO.dg08Score < 100}">
                    위험점수 ${predictDTO.dg08Score}점으로 초고위험군입니다.<br>
                </c:when>
                <c:otherwise>
                    위험점수를 판단할 수 없습니다.
                </c:otherwise>
            </c:choose>
            <span class="detailText">
                성별, freeT4, t3, TSH 등으로 인해 해당 위험군으로 판단됩니다.
            </span>
        </span>
    </div>
</div>

<form action="<%=request.getContextPath()%>/predict04" method="post">
    <!--form을 사용하여, post형태로 데이터를 전달-->
    <input type="hidden" name="dg01Score" value="${predictDTO.dg01Score}" />
    <input type="hidden" name="dg02Score" value="${predictDTO.dg02Score}" />
    <input type="hidden" name="dg03Score" value="${predictDTO.dg03Score}" />
    <input type="hidden" name="dg04Score" value="${predictDTO.dg04Score}" />
    <input type="hidden" name="dg05Score" value="${predictDTO.dg05Score}" />
    <input type="hidden" name="dg06Score" value="${predictDTO.dg06Score}" />
    <input type="hidden" name="dg07Score" value="${predictDTO.dg07Score}" />
    <input type="hidden" name="dg08Score" value="${predictDTO.dg08Score}" />
    <button class="complete-button">
        관련 보험 추천받기
    </button>
</form>


<footer style="background: #00a39e; padding: 40px 0; color: #fff; text-align: center;">
    <p style="font-size: 16px; margin: 0;">© 2023 1Q Insurance. All rights reserved.</p>
    <p style="font-size: 14px; margin: 10px 0 0;">인천 서구 에코로 167 하나금융그룹 통합데이터센터 비전센터</p>
</footer>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
    var scoreDG01 = ${predictDTO.dg01Score};
    var scoreDG02 = ${predictDTO.dg02Score};
    var scoreDG03 = ${predictDTO.dg03Score};
    var scoreDG04 = ${predictDTO.dg04Score};
    var scoreDG05 = ${predictDTO.dg05Score};
    var scoreDG06 = ${predictDTO.dg06Score};
    var scoreDG07 = ${predictDTO.dg07Score};
    var scoreDG08 = ${predictDTO.dg08Score};
</script>
<script src="${pageContext.request.contextPath}/js/riskScore.js"></script>
</body>
</html>

