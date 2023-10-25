<%--
  Created by IntelliJ IDEA.
  User: JungSuyoung
  Date: 2023-09-06
  Time: 오전 9:24
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>질병예측_병원선택하기</title>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/background01.css" />
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/button.css" />

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
<body>
    <jsp:include page="./header.jsp" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <div class="content-section">
        <div class="section-header">1. 병원 선택하기</div>
        <div class="section-description">
            검진데이터를 가져올 병원을 선택하세요
        </div>
    </div>
    <!-- 병원 선택 상자 -->
    <div class="hospital-box-container">
        <div class="hospital-box">
            <i class="fas fa-check" style="display: none; font-size: 200px; position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); color: red;"></i>
            <img src="<%= request.getContextPath() %>/img/국민건강보험공단.png" class="hospital-image">
            <div class="hospital-name">국민건강보험공단</div>
            <button class="select-button">선택</button>
        </div>

        <div class="hospital-box">
            <i class="fas fa-check" style="display: none; font-size: 200px; position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); color: red;"></i>
            <img src="<%= request.getContextPath() %>/img/서울성모병원.png" class="hospital-image">
            <div class="hospital-name">서울성모병원</div>
            <button class="select-button">선택</button>
        </div>

        <div class="hospital-box">
            <i class="fas fa-check" style="display: none; font-size: 200px; position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); color: red;"></i>
            <img src="<%= request.getContextPath() %>/img/서울아산병원.png" class="hospital-image">
            <div class="hospital-name">서울아산병원</div>
            <button class="select-button">선택</button>
        </div>

        <div class="hospital-box">
            <i class="fas fa-check" style="display: none; font-size: 200px; position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); color: red;"></i>
            <img src="<%= request.getContextPath() %>/img/서울삼성병원02.png" class="hospital-image">
            <div class="hospital-name">삼성서울병원</div>
            <button class="select-button">선택</button>
        </div>
        <div class="hospital-box">
            <i class="fas fa-check" style="display: none; font-size: 200px; position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); color: red;"></i>
            <img src="<%= request.getContextPath() %>/img/세브란스병원.jpg" class="hospital-image">
            <div class="hospital-name">세브란스병원</div>
            <button class="select-button">선택</button>
        </div>
        <div class="hospital-box">
            <i class="fas fa-check" style="display: none; font-size: 200px; position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); color: red;"></i>
            <img src="<%= request.getContextPath() %>/img/서울대학교병원로고.png" class="hospital-image">
            <div class="hospital-name">서울대학교병원</div>
            <button class="select-button">선택</button>
        </div>
    </div>

    <button class="complete-button"
            onclick="window.location.href='<%= request.getContextPath() %>/predict02'">선택완료
    </button>

    <div id="loading" style="display:none; position:fixed; top:0; left:0; width:100%; height:100%; background-color:rgba(0,0,0,0.5); z-index:9999;">
        <div style="position:absolute; top:50%; left:50%; transform:translate(-50%, -50%);">
            <div class="spinner"></div>
        </div>
    </div>


    <footer style="background: #00a39e; padding: 40px 0; color: #fff; text-align: center;">
        <p style="font-size: 16px; margin: 0;">© 2023 1Q Insurance. All rights reserved.</p>
        <p style="font-size: 14px; margin: 10px 0 0;">인천 서구 에코로 167 하나금융그룹 통합데이터센터 비전센터</p>
    </footer>
    <script src="${pageContext.request.contextPath}/js/function.js"></script>

    <script>
        window.onload = function() {
            var hospitalBoxes = document.querySelectorAll('.hospital-box');

            hospitalBoxes.forEach(function(box) {
                var button = box.querySelector('.select-button');
                var icon = box.querySelector('.fa-check');

                button.addEventListener('click', function() {
                    icon.style.display = icon.style.display === 'none' ? 'block' : 'none';
                });
            });
        }
    </script>
</body>
</html>

