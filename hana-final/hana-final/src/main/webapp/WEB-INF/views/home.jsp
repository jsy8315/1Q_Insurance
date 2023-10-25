<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>원큐보험</title>
    <style>

        .btn {
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .main-text {
            text-align: center;
            margin-top: 50px;
            transform: scale(2);
        }

        .main-text h1 {
            font-size: 64px;
            font-weight: 700;
            text-transform: capitalize;
        }

        .main-text p {
            font-size: 20px;
            color: #424242;
            max-width: 800px;
            margin: 20px auto;
        }

        .btn-group {
            display: flex;
            justify-content: center;
            gap: 20px;
            margin-top: 30px;
        }

        .btn-group .btn {
            padding: 15px 40px;
            background-color: #00a39e;
            color: #fff;
            border: none;
        }

        .background-section {
            background-image: url('<%= request.getContextPath() %>/img/하금티건물고화질.jpg');
            background-size: cover;
            background-repeat: no-repeat;
            background-position: center;
            filter: blur(5px);
        }

        .white-section {
            background-color: #fff;
            padding: 50px 0;
        }

        .intro-section {
            background-color: #00a39e;
            padding: 50px 0;
            color: #fff;
        }

    </style>
</head>

<body>
    <jsp:include page="./header.jsp" />

<div class="background-section">
</div>

<div class="intro-section" style="position: relative; background-image: url('<%= request.getContextPath() %>/img/하금티건물고화질05.jpg'); background-size: cover; background-repeat: no-repeat; background-position: center; padding: 120px 120px; color: #000; text-align: center;">
    <p style="font-size: 64px; font-weight: 500; margin: 0;">
        보험가입, 심사, 청구까지
    </p>
    <p style="font-size: 64px; font-weight: 500; margin: 0;">
        빠르게 한번에 원큐보험
    </p>
    <p style="font-size: 20px; font-weight: 500; text-align: center; color: #757575; margin-top: 10;">
        보험 가입, 보험 심사부터 까다롭고 복잡한 보험금 청구까지</br>
        원큐보험에서 빠르고, 한번에 해결가능합니다.
    </p>
    <div style="margin-top: 0px;">
        <a href="#" style="display: inline-block; margin-top: 50px; margin-right: 20px; padding: 10px 20px; background: #fff; color: #00a39e; font-size: 18px; font-weight: 500; text-decoration: none; border-radius: 5px; border: 1px solid #00a39e;">
            원큐보험
        </a>
        <a href="#" style="display: inline-block; margin-top: 50px; padding: 10px 20px; background: #00a39e; color: #fff; font-size: 18px; font-weight: 500; text-decoration: none; border-radius: 5px;">
            이용안내
        </a>
    </div>
</div>
<div class="second-section" style="position: relative; background: #fff; padding: 80px 120px;">
    <div style="display: flex; justify-content: center; align-items: center; gap: 10px; position: relative; top: px;">
        <div style="display: flex; flex-direction: column; justify-content: flex-start; align-items: flex-start; flex-grow: 0; flex-shrink: 0; gap: 20px;">
            <div style="display: flex; flex-direction: column; justify-content: flex-start; align-items: flex-start; flex-grow: 0; flex-shrink: 0; position: relative; gap: 0px;">
                <p style="flex-grow: 0; flex-shrink: 0; width: 590px; font-size: 48px; font-weight: 500; text-align: left; text-transform: capitalize; color: #212121; margin: 0;">
                    <span style="color: #212121;">8대질환 예측받고,</span><br />
                    <span style="color: #212121;">위험 질병 위주 보험 추천</span>
                </p>
                <p style="align-self: stretch; flex-grow: 0; flex-shrink: 0; width: 590px; font-size: 15px; text-align: left; text-transform: capitalize; color: #757575; margin: ;">
                    <span style="color: #757575;">8대질환(뇌혈관질환, 심장질환, 고혈압, 당뇨병, 신장질환, 호흡기질환, 간질환,</span><br />
                    <span style="color: #757575;">갑상선질환)에 대해 국민건강보험공단 및 건강검진을 시행한 병원과 제휴하여 질병예측</span>
                </p>
            </div>
            <a href="${pageContext.request.contextPath}/predict01" style="display: flex; text-decoration: none; justify-content: flex-start; align-items: center; flex-grow: 0; flex-shrink: 0; position: relative; gap: 10px; padding-left: 40px; padding-right: 40px; padding-top: 15px; padding-bottom: 15px; background: #00a39e; width: fit-content; border-radius: 5px;">
                <p style="flex-grow: 0; flex-shrink: 0; font-size: 18px; font-weight: 500; text-align: center; color: #fff; margin: 0;">
                    질병 예측 시작하기
                </p>
            </a>
        </div>
        <div style="flex-grow: 0; flex-shrink: 0; width: 590px; height: 440px; position: relative; border-radius: 5px;">
            <img src="<%= request.getContextPath() %>/img/disease02.png" style="width: 590px; height: 450px; position: absolute; left: -1px; top: -1px; object-fit: cover; border-radius: 5px;" />
        </div>
    </div>
</div>

<div class="third-section" style="position: relative; background: #00a39e; padding: 150px 120px; color: #fff; text-align: center;">
    <p style="font-size: 64px; font-weight: 500; margin: 0;">
        일일이 서류받고, 제출하지말고
    </p>
    <p style="font-size: 64px; font-weight: 500; margin: 0;">
        원큐보험에서 보험금 한번에 청구
    </p>
    <p style="font-size: 20px; font-weight: 500; text-align: center; color: #fafafa;">
        제휴 병원과의 제휴와 서류 간편 업로드로 빠르게 청구
    </p>
    <div style="margin-top: 20px;">
        <a href="${pageContext.request.contextPath}/claim01" style="display: inline-block; margin-top: 50px; padding: 10px 20px; background: #fff; color: #00a39e; font-size: 18px; font-weight: 500; text-decoration: none; border-radius: 5px; border: 2px solid #00a39e;">
            간편 보험금 청구하기
        </a>
    </div>
</div>
<div class="last-section" style="position: relative; background: #fff; padding: 80px 120px; display: flex; justify-content: space-between; align-items: center;">
    <div style="flex-grow: 0; flex-shrink: 0; width: 590px; height: 440px; position: relative; border-radius: 5px;">
        <img src="<%= request.getContextPath() %>/img/ga01.jpg" style="width: 100%; height: 100%; object-fit: cover; border-radius: 5px;" alt="이미지 설명" />
    </div>
    <div style="flex-grow: 0; flex-shrink: 0; width: 590px; margin-top: 40px; margin-left: 60px;">
        <div style="font-size: 40px; font-weight: 500; color: #212121;">
            <span>보험설계사와</span><br />
            <span>다양하고 깊이있게 상담</span>
        </div>
        <div style="font-size: 15px; text-align: left; text-transform: capitalize; color: #757575; margin:20px 0 0;">
            <div style="color: #757575;">보험설계사와 비대면으로</div>
            <div style="color: #757575;">다양한 보험 상품에 대해 심도있게 상담받고, 추천받으세요.</div>
            <div style="color: #757575;">하나보험의 경우 간편 가입이 가능합니다.</div>
        </div>
        <a href="#" style="display: inline-block; padding: 10px 20px; background: #00a39e; color: #fff; font-size: 18px; font-weight: 500; text-decoration: none; border-radius: 5px; margin-top: 20px;">지금상담하기</a>
    </div>
</div>
<footer style="background: #00a39e; padding: 40px 0; color: #fff; text-align: center;">
    <p style="font-size: 16px; margin: 0;">© 2023 1Q Insurance. All rights reserved.</p>
    <p style="font-size: 14px; margin: 10px 0 0;">인천 서구 에코로 167 하나금융그룹 통합데이터센터 비전센터</p>
</footer>

</body>

</html>
