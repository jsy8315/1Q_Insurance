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
  가족을 초대해보세요👨‍👩‍👧‍👦<br>
  <br>
  <div style="font-size: 15px;">
    가족 구성원에게 초대 메시지를 보내고, 보험료 할인을 받아보세요.<br>
  </div>
</div>
<div class="main-feature-section">
  등록 가족 구성원
  <table id="dataTable01" width="100%" cellspacing="0" style="font-size:0.8rem;">
    <thead>
    <tr>
      <th>사용자ID</th>
      <th>성명</th>
      <th>애칭</th>
      <th>가족관계</th>
    </tr>
    </thead>
    <tbody>
        <tr >
          <th style="font-weight: 100;">4</th>
          <th style="font-weight: 100;">박미진</th>
          <th style="font-weight: 100;">우리집서열1위</th>
          <th style="font-weight: 100;">처</th>
        </tr>
    </tbody>
  </table>
</div>
<div class="button-group">
  <button class="mypage-button" onclick="kakaoShare()">원큐 보험 초대하기</button>
  <button class="mypage-button" onclick="window.location.href='<%= request.getContextPath() %>/mypageProductTable'">구성원 정보 확인</button>
  <button class="mypage-button" onclick="window.location.href='<%= request.getContextPath() %>/mypagePredict'">가족 보험료 납부</button>
  <button class="mypage-button" onclick="window.location.href='<%= request.getContextPath() %>/mypageLogout'">가족 보험료 관리</button>
</div>
<div class="main-feature-section">
  가족 구성원 가입 보험 상품
  <table id="dataTable02" width="100%" cellspacing="0" style="font-size:0.8rem;">
    <thead>
    <tr>
      <th>보험상품ID</th>
      <th>보험상품명</th>
      <th>보장내용</th>
      <th>보험료</th>
      <th>비고</th>
    </tr>
    </thead>
    <tbody>
        <tr>
          <th></th>
          <th></th>
          <th></th>
          <th></th>
          <th></th>
        </tr>
    </tbody>
  </table>
</div>
<footer style="background: #00a39e; padding: 40px 0; color: #fff; text-align: center;">
  <p style="font-size: 16px; margin: 0;">© 2023 1Q Insurance. All rights reserved.</p>
  <p style="font-size: 14px; margin: 10px 0 0;">인천 서구 에코로 167 하나금융그룹 통합데이터센터 비전센터</p>
</footer>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>

<script type="text/javascript">
  // SDK를 초기화 합니다. 사용할 앱의 JavaScript 키를 설정해 주세요.
  Kakao.init('00c9608c54d7316013ba655f357d385e');

  // SDK 초기화 여부를 판단합니다.
  console.log(Kakao.isInitialized());

  function kakaoShare() {
    Kakao.Link.sendDefault({
      objectType: 'feed',
      content: {
        title: '보험 가입, 심사, 청구까지 빠르게 한번에 원큐보험',
        description: '원큐보험 가족 초대 메시지입니다.',
        imageUrl: 'https://postfiles.pstatic.net/MjAyMzEwMDZfMTQz/MDAxNjk2NTkwNzIwMDYw.A6EKratVBVnKSZZgM_-SQXJs-pYi05hivNlYDhwZGO0g.5kv8bJsLBtAI6Qoe6hlNc1Ak9UllSSgP0SpR749PYYMg.PNG.jsy8315/%EC%9B%90%ED%81%90.png?type=w773',
        link: {
          mobileWebUrl: '카카오공유하기 시 클릭 후 이동 경로',
          webUrl: '카카오공유하기 시 클릭 후 이동 경로',
        },
      },
      buttons: [
        {
          title: '웹으로 보기',
          link: {
            mobileWebUrl: '카카오공유하기 시 클릭 후 이동 경로',
            webUrl: 'localhost:8080',
          },
        },
      ],
      // 카카오톡 미설치 시 카카오톡 설치 경로이동
      installTalk: true,
    })
  }
</script>
</body>
</html>
