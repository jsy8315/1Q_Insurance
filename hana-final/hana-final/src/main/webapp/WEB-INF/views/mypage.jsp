<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>데이터 기반 질병 예측 화면</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/mypagever02.css" />
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/button.css" />
    <!--로그인, 회원가입, 질병예측하기 버튼 자동 가운데 정렬 문제 일으켰던 부분, donut 처리함-->
    <style>
        body {
            text-align: left; /* 내용을 왼쪽 정렬 */
        }
    </style>
</head>
<jsp:include page="./header.jsp" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<body>
<div class="main-feature-section" style="margin-top: 20px; font-size: 35px;">
    <div style="text-align: right; font-size: 20px;">
        ✉️      🔔
    </div>
    정수일님 안녕하세요🙂<br>
    <br>
    <div style="font-size: 15px;">
        고객님은 최근 6개월 이내에 이용자 비밀번호 변경기록이 없습니다.
    </div>
</div>

<div class="button-group">
    <button class="mypage-button" onclick="window.location.href='<%= request.getContextPath() %>/mypage'">내 정보 확인</button>
    <button class="mypage-button" onclick="window.location.href='<%= request.getContextPath() %>/myFamily'">가족 관리</button>
    <button class="mypage-button" onclick="window.location.href='<%= request.getContextPath() %>/mypagePredict'">보험료 납부</button>
    <button class="mypage-button" onclick="window.location.href='<%= request.getContextPath() %>/mypageLogout'">보험료 관리</button>
</div>

<div class="main-feature-section">
    가입 보험 상품
    <table id="dataTable01" width="100%" cellspacing="0" style="font-size:0.8rem;">
        <thead>
        <tr>
            <th>보험상품ID</th>
            <th>보험상품명</th>
            <th>보장내용</th>
            <th style="width: 50px;">보험료</th>
        </tr>
        </thead>
        <tbody>
            <c:forEach var="item" items="${list}">
                <c:if test="${item.status == 0}">
                    <tr >
                        <th style="font-weight: 100;">${item.insuranceproductid}</th>
                        <th style="font-weight: 100;">${item.insurancename}</th>
                        <th style="font-weight: 100;">${item.insurancecontent}</th>
                        <th style="font-weight: 100;">${item.insurancefee}</th>
                    </tr>
                </c:if>
            </c:forEach>
        </tbody>
    </table>
</div>
<div class="main-feature-section">
    가입 심사 중인 보험 상품
    <table id="dataTable02" width="100%" cellspacing="0" style="font-size:0.8rem;">
        <thead>
        <tr>
            <th>보험상품ID</th>
            <th>보험상품명</th>
            <th>보장내용</th>
            <th>보험료</th>
            <th >비고</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="item" items="${list}">
            <c:if test="${item.status == 1}">
                <tr>
                    <th>${item.insuranceproductid}</th>
                    <th>${item.insurancename}</th>
                    <th>${item.insurancecontent}</th>
                    <th>${item.insurancefee}</th>
                    <th>심사 중</th>
                </tr>
            </c:if>
        </c:forEach>
        </tbody>
    </table>
</div>
<div class="main-feature-section">
    심사 완료 보험 청구
    <table id="dataTable03" width="100%" cellspacing="0" style="font-size:0.8rem;">
        <thead>
        <tr>
            <th>청구ID</th>
            <th>청구일자</th>
            <th>보험상품ID</th>
            <th>수령 은행</th>
            <th>수령 계좌번호</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="claimList" items="${claimList}">
            <c:if test="${claimList.claimstatus == 0}">
                <tr>
                    <td>${claimList.claimid}</td>
                    <td>${claimList.claimdate}</td>
                    <td>${claimList.myproductId}</td>
                    <td>${claimList.claimbank}</td>
                    <td>${claimList.claimaccount}</td>
                </tr>
            </c:if>
        </c:forEach>
        </tbody>
    </table>
</div>
<div class="main-feature-section">
    심사 중인 보험 청구
    <table id="dataTable04" width="100%" cellspacing="0" style="font-size:0.8rem;">
        <thead>
        <tr>
            <th>청구ID</th>
            <th>청구일자</th>
            <th>보험상품ID</th>
            <th>수령 은행</th>
            <th>수령 계좌번호</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="claimList" items="${claimList}">
            <c:if test="${claimList.claimstatus == 1}">
                <tr>
                    <td>${claimList.claimid}</td>
                    <td>${claimList.claimdate}</td>
                    <td>${claimList.myproductId}</td>
                    <td>${claimList.claimbank}</td>
                    <td>${claimList.claimaccount}</td>
                </tr>
            </c:if>
        </c:forEach>
        </tbody>
    </table>
</div>
<footer style="background: #00a39e; padding: 40px 0; color: #fff; text-align: center;">
    <p style="font-size: 16px; margin: 0;">© 2023 1Q Insurance. All rights reserved.</p>
    <p style="font-size: 14px; margin: 10px 0 0;">인천 서구 에코로 167 하나금융그룹 통합데이터센터 비전센터</p>
</footer>
</body>
</html>
