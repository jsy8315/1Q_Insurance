<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>보험 추천 화면</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/background01.css" />
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/button.css" />
    <!--로그인, 회원가입, 질병예측하기 버튼 자동 가운데 정렬 문제 일으켰던 부분, donut 처리함-->
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/riskScore.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/recommend.css" />
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/recommendmodal.css" />
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/recommendaccordion.css" />


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

        /* 고위험군 순위 관련 스타일*/
        .high-risk-item {
            border: 1px solid #ccc;
            padding: 10px;
            padding-left: 40px;
            margin-bottom: 10px;
            border-radius: 5px;
            transition: all 0.3s ease;
            display: flex;

            align-items: center;
        }

        .high-risk-item:hover {
            background-color: #f5f5dc;

        }

        .high-risk-item .risk-score {
            float: right;
            margin-left: 40px;
            font-size: 20px;
        }

        .first {
            background-color: #ece6cc;
        }

        .second {
            background-color: #ece6cc;
        }

        .third {
            background-color: #ece6cc;
        }

        .fourth {
            background-color: #ece6cc;
        }
    </style>
</head>
<jsp:include page="./header.jsp"/>
<body>
<div class="content-section">
    <div class="section-header">
        4. 정수일님을 위한 추천 보험은<br>
        다음과 같습니다.
    </div>
    <div class="section-description">
        질병 예측을 바탕으로, 보험을 추천합니다.
    </div>
    <div class="main-feature-section">
        <div class="row sample-card" style="text-align: left; font-size: 30px; margin-left:10px; margin-right:10px; margin-top: 10px; margin-bottom: 20px; padding-left:80px; padding-right:80px; display: block;">
            <div style="font-size: 20px; margin-bottom: 10px">
                정수일님의 상위 4개 고위험군 질환과 점수는 다음과 같습니다.</br>
            </div>
            <div class="high-risk-item first">
                <c:choose>
                <c:when test="${keys[0] == 'dg01score'}">1순위 뇌혈관질환</c:when>
                <c:when test="${keys[0] == 'dg02score'}">1순위 심장질환</c:when>
                <c:when test="${keys[0] == 'dg03score'}">1순위 고혈압</c:when>
                <c:when test="${keys[0] == 'dg04score'}">1순위 당뇨병</c:when>
                <c:when test="${keys[0] == 'dg05score'}">1순위 신장질환</c:when>
                <c:when test="${keys[0] == 'dg06score'}">1순위 호흡기질환</c:when>
                <c:when test="${keys[0] == 'dg07score'}">1순위 간질환</c:when>
                <c:when test="${keys[0] == 'dg08score'}">1순위 갑상선질환</c:when>
                <c:otherwise>알 수 없음</c:otherwise>
                </c:choose>
                <span class="risk-score"> ${resultMap[keys[0]]}점 (고위험군)</span>
            </div>
            <div class="high-risk-item second">
                <c:choose>
            <c:when test="${keys[1] == 'dg01score'}">2순위 뇌혈관질환</c:when>
            <c:when test="${keys[1] == 'dg02score'}">2순위 심장질환</c:when>
            <c:when test="${keys[1] == 'dg03score'}">2순위 고혈압</c:when>
            <c:when test="${keys[1] == 'dg04score'}">2순위 당뇨병</c:when>
            <c:when test="${keys[1] == 'dg05score'}">2순위 신장질환</c:when>
            <c:when test="${keys[1] == 'dg06score'}">2순위 호흡기질환</c:when>
            <c:when test="${keys[1] == 'dg07score'}">2순위 간질환</c:when>
            <c:when test="${keys[1] == 'dg08score'}">2순위 갑상선질환</c:when>
            <c:otherwise>알 수 없음</c:otherwise>
                </c:choose>
                <span class="risk-score">${resultMap[keys[1]]}점 (고위험군)</span>
            </div>
            <div class="high-risk-item third">
                <c:choose>
            <c:when test="${keys[2] == 'dg01score'}">3순위 뇌혈관질환</c:when>
            <c:when test="${keys[2] == 'dg02score'}">3순위 심장질환</c:when>
            <c:when test="${keys[2] == 'dg03score'}">3순위 고혈압</c:when>
            <c:when test="${keys[2] == 'dg04score'}">3순위 당뇨병</c:when>
            <c:when test="${keys[2] == 'dg05score'}">3순위 신장질환</c:when>
            <c:when test="${keys[2] == 'dg06score'}">3순위 호흡기질환</c:when>
            <c:when test="${keys[2] == 'dg07score'}">3순위 간질환</c:when>
            <c:when test="${keys[2] == 'dg08score'}">3순위 갑상선질환</c:when>
            <c:otherwise>알 수 없음</c:otherwise>
                </c:choose>
                <span class="risk-score">${resultMap[keys[2]]}점 (고위험군)</span>
            </div>
            <div class="high-risk-item fourth">
                <c:choose>
            <c:when test="${keys[3] == 'dg01score'}">4순위 뇌혈관질환</c:when>
            <c:when test="${keys[3] == 'dg02score'}">4순위 심장질환</c:when>
            <c:when test="${keys[3] == 'dg03score'}">4순위 고혈압</c:when>
            <c:when test="${keys[3] == 'dg04score'}">4순위 당뇨병</c:when>
            <c:when test="${keys[3] == 'dg05score'}">4순위 신장질환</c:when>
            <c:when test="${keys[3] == 'dg06score'}">4순위 호흡기질환</c:when>
            <c:when test="${keys[3] == 'dg07score'}">4순위 간질환</c:when>
            <c:when test="${keys[3] == 'dg08score'}">4순위 갑상선질환</c:when>
            <c:otherwise>알 수 없음</c:otherwise>
                </c:choose>
                <span class="risk-score">${resultMap[keys[3]]}점 (고위험군)</span>
            </div>
        </div>
        <div class="row sample-card" style="margin: 10px; margin-bottom: 20px;">
            <div class="profile-section">
                <img src="<%= request.getContextPath() %>/img/recommend01.png" alt="Profile Picture" class="profile-pic">
            </div>
            <div class="info-section">
                <c:if test="${not empty firstProducts}">
                    <c:set var="firstProduct" value="${firstProducts[0]}" />
                    <span style="font-size: 14px; color: grey;">호흡기질환 관련 보험 추천</span>
                    <h3>${firstProduct.insurancename}</h3>
                    <p>${firstProduct.insurancecontent}</p>
                    <button type="button" class="info-button" data-toggle="modal" data-target="#myModal">자세히보기</button>
                    <button type="button" class="info-button" data-toggle="modal" data-target="#joinModal">가입하기</button>
                    <button class="info-button" id="addToCart">장바구니 담기</button>
                </c:if>
            </div>
            <div class="modal" id="myModal">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <!-- Modal Header -->
                        <div class="modal-header" style="text-align: left">
                            <h4 class="modal-title">${firstProduct.insurancename}</h4>
                        </div>
                        <!-- Modal body -->
                        <div class="modal-body" style="text-align: left">
                            보험회사 : ${firstProduct.insurancecompanyname}</br>
                            보험유형 : ${firstProduct.insurancetype}</br>
                            보장항목 : ${firstProduct.insurancescope}</br>
                            보장내용 : ${firstProduct.insurancecontent}</br>
                            보험료 : ${firstProduct.insurancefee}원
                        </div>
                        <!-- Modal footer -->
                        <div class="modal-footer">
                            <button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal" id="joinModal">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <!-- Modal Header -->
                        <div class="modal-header" style="text-align: center">
                            <h3 class="modal-title" style="text-align: center;">보험 가입 신청서</h3>
                        </div>
                        <!-- Modal body -->
                        <div class="modal-body" style="text-align: left">
                            <!-- 신청인 정보 -->
                            <h4>신청인 정보</h4>
                            <table style="width:100%; border-collapse: collapse;">
                                <tr>
                                    <th style="background-color: #DAEFEE; width: 200px; height: 50px; border: 1px solid gray;">성명</th>
                                    <td style="height: 50px; border: 1px solid gray; padding: 10px;">정수일</td>
                                </tr>
                                <tr>
                                    <th style="background-color: #DAEFEE; width: 200px; height: 50px; border: 1px solid gray;">주민등록번호</th>
                                    <td style="height: 50px; border: 1px solid gray; padding: 10px;">730606-1******</td>
                                </tr>
                                <tr>
                                    <th style="background-color: #DAEFEE; width: 200px; height: 50px; border: 1px solid gray;">전화번호</th>
                                    <td style="height: 50px; border: 1px solid gray; padding: 10px;">010-9889-0002</td>
                                </tr>
                            </table>

                            <!-- 보험 정보 -->
                            <h4>보험 정보</h4>
                            <table style="width:100%; border-collapse: collapse;">
                                <tr>
                                    <th style="background-color: #DAEFEE; width: 200px; height: 50px; border: 1px solid gray;">보험회사</th>
                                    <td style="height: 50px; border: 1px solid gray; padding: 10px;">${firstProduct.insurancecompanyname}</td>
                                </tr>
                                <tr>
                                    <th style="background-color: #DAEFEE; width: 200px; height: 50px; border: 1px solid gray;">보험상품ID</th>
                                    <td style="height: 50px; border: 1px solid gray; padding: 10px;">${firstProduct.insuranceproductid}</td>
                                </tr>
                                <tr>
                                    <th style="background-color: #DAEFEE; width: 200px; height: 50px; border: 1px solid gray;">보험유형</th>
                                    <td style="height: 50px; border: 1px solid gray; padding: 10px;">${firstProduct.insurancetype}</td>
                                </tr>
                                <tr>
                                    <th style="background-color: #DAEFEE; width: 200px; height: 50px; border: 1px solid gray;">보장항목</th>
                                    <td style="height: 50px; border: 1px solid gray; padding: 10px;">${firstProduct.insurancescope}</td>
                                </tr>
                                <tr>
                                    <th style="background-color: #DAEFEE; width: 200px; height: 50px; border: 1px solid gray;">보장내용</th>
                                    <td style="height: 50px; border: 1px solid gray; padding: 10px;">${firstProduct.insurancecontent}</td>
                                </tr>
                                <tr>
                                    <th style="background-color: #DAEFEE; width: 200px; height: 50px; border: 1px solid gray;">보험료</th>
                                    <td style="height: 50px; border: 1px solid gray; padding: 10px;">${firstProduct.insurancefee}원</td>
                                </tr>
                            </table>


                            <h4>보험가입 동의서</h4>
                            <p>[필수] 계약 체결·이행을 위한 상세 동의서 (개인금융성 신용보험용)</p>
                            <form>
                                <div class="form-check">
                                    <input type="checkbox" class="form-check-input" id="check1">
                                    <label class="form-check-label" for="check1">보장내용</label>
                                    <a href="#" data-toggle="modal" data-target="#joindetail01">[자세히보기]</a>
                                </div>
                                <div class="form-check">
                                    <input type="checkbox" class="form-check-input" id="check6">
                                    <label class="form-check-label" for="check1">보험약관</label>
                                    <a href="#" data-toggle="modal" data-target="#joindetail02">[자세히보기]</a>
                                </div>
                                <div class="form-check">
                                    <input type="checkbox" class="form-check-input" id="check2">
                                    <label class="form-check-label" for="check2">개인(신용)정보의 수집·이용</label>
                                    <a href="#" data-toggle="modal" data-target="#joindetail03">[자세히보기]</a>
                                </div>
                                <div class="form-check">
                                    <input type="checkbox" class="form-check-input" id="check3">
                                    <label class="form-check-label" for="check2">수집·이용할 개인(신용) 정보의 내용</label>
                                    <a href="#" data-toggle="modal" data-target="#joindetail04">[자세히보기]</a>
                                </div>
                                <div class="form-check">
                                    <input type="checkbox" class="form-check-input" id="check4">
                                    <label class="form-check-label" for="check2">개인(신용)정보의 보유·이용기간</label>
                                    <a href="#" data-toggle="modal" data-target="#joindetail05">[자세히보기]</a>
                                </div>
                                <div class="form-check">
                                    <input type="checkbox" class="form-check-input" id="check5">
                                    <label class="form-check-label" for="check2">민감정보 및 고유 식별정보의 처리에 관한 사항</label>
                                    <a href="#" data-toggle="modal" data-target="#joindetail06">[자세히보기]</a>
                                </div>
                            </form>
                        </div>
                        <!-- Modal footer -->
                        <div class="modal-footer" style="text-align: center;">
                                <button data-toggle="modal" data-target="#joindetail07" id="submitBtn" type="button" class="btn btn-danger" style="margin: auto; background-color: #00a39e; color: white;">
                                    가입하기
                                </button>
                        </div>

                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade" id="joindetail07" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="modalLabel">보험가입</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        신청이 완료되었습니다. 가입 승인 이후, 이용 가능합니다.
                    </div>
                    <div class="modal-footer">
                        <!-- "닫기" 버튼을 클릭하면 폼이 제출됩니다 -->
                        <form id="joinForm" action="/productJoin" method="post">
                            <input type="hidden" name="insuranceproductid" value="${firstProduct.insuranceproductid}" />
                            <button type="submit" class="btn btn-secondary">닫기</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal" id="joindetail01">
            <div class="modal-dialog">
                <div class="modal-content">
                    <!-- Modal Header -->
                    <div class="modal-header" style="text-align: left">
                        <h4 class="modal-title">보장내용</h4>
                    </div>
                    <!-- Modal body -->
                    <div class="modal-body" style="text-align: left">
                        <h3>보장(보상)의 종류, 보험금 지급 사유</h3>
                        <h4>기본계약</h4>
                        <h5>특약명</h5>
                        일반 상해 80% 이상 후유 장애
                        <h5>보장내용</h5>
                        보장 개시일 이후에 상해로 80%이상 장해지급률에 해당하는 장해상태가 되었을 경우
                        <h5>지급금액</h5>
                        가입금액
                        <h4>선택계약</h4>
                        <h5>특약명</h5>
                        질병 80% 이상 후유 장애
                        <h5>보장내용</h5>
                        보험기간 중에 진단확정된 질병으로 장해분류표에서 정한 80%이상 장해지급률에 해당하는 장해상태가 되었을때
                        <h5>지급금액</h5>
                        보험가입금액(최초 1회한)
                    </div>
                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
                    </div>
                </div>
            </div>
        </div>

        <div class="row sample-card" style="margin: 10px; margin-bottom: 20px;">
            <div class="profile-section">
                <img src="<%= request.getContextPath() %>/img/recommend02.png" alt="Profile Picture" class="profile-pic">
            </div>
            <div class="info-section">
                <c:if test="${not empty secondProducts}">
                    <c:set var="secondProduct" value="${secondProducts[0]}" />
                    <span style="font-size: 14px; color: grey;">당뇨병 관련 보험 추천</span>
                    <h3>${secondProduct.insurancename}</h3>
                    <p>${secondProduct.insurancecontent}</p>
                    <button class="info-button">자세히보기</button>
                    <button class="info-button">가입하기</button>
                    <button class="info-button">장바구니 담기</button>
                </c:if>
            </div>
        </div>
        <div class="row sample-card" style="margin: 10px; margin-bottom: 20px;">
            <div class="profile-section">
                <img src="<%= request.getContextPath() %>/img/recommend03.png" alt="Profile Picture" class="profile-pic">
            </div>
            <div class="info-section">
                <c:if test="${not empty thirdProducts}">
                    <c:set var="thirdProduct" value="${thirdProducts[0]}" />
                    <span style="font-size: 14px; color: grey;">간질환 관련 보험 추천</span>
                    <h3>${thirdProduct.insurancename}</h3>
                    <p>${thirdProduct.insurancecontent}</p>
                    <button class="info-button">자세히보기</button>
                    <button class="info-button">가입하기</button>
                    <button class="info-button">장바구니 담기</button>
                </c:if>
            </div>
        </div>
        <div class="row sample-card" style="margin: 10px">
            <div class="profile-section">
                <img src="<%= request.getContextPath() %>/img/recommend04.png" alt="Profile Picture" class="profile-pic">
            </div>
            <div class="info-section">
                <c:if test="${not empty fourthProducts}">
                    <c:set var="fourthProduct" value="${fourthProducts[0]}" />
                    <span style="font-size: 14px; color: grey;">고혈압 관련 보험 추천</span>
                    <h3>${fourthProduct.insurancename}</h3>
                    <p>${fourthProduct.insurancecontent}</p>
                    <button class="info-button">자세히보기</button>
                    <button class="info-button">가입하기</button>
                    <button class="info-button">장바구니 담기</button>
                </c:if>
            </div>
        </div>
    </div>
    </div>
</div>

<div style="margin-top: 40px; margin-bottom: 50px;">
    <a href="#" onclick="window.location.href='<%= request.getContextPath() %>/'" style="display: inline-block;  margin-right: 20px; padding: 10px 20px; background: #fff; color: #00a39e; font-size: 18px; font-weight: 500; text-decoration: none; border-radius: 5px; border: 1px solid #00a39e;">
        메인화면으로 이동
    </a>
    <a href="#" onclick="window.location.href='<%= request.getContextPath() %>/home'" style="display: inline-block;  padding: 10px 20px; background: #00a39e; color: #fff; font-size: 18px; font-weight: 500; text-decoration: none; border-radius: 5px;">
        모든 상품 장바구니에 담기
    </a>
</div>

<footer style="background: #00a39e; padding: 40px 0; color: #fff; text-align: center;">
    <p style="font-size: 16px; margin: 0;">© 2023 1Q Insurance. All rights reserved.</p>
    <p style="font-size: 14px; margin: 10px 0 0;">인천 서구 에코로 167 하나금융그룹 통합데이터센터 비전센터</p>
</footer>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="${pageContext.request.contextPath}/js/riskScore.js"></script>

<!-- Bootstrap JS and Popper.js -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
    document.getElementById("addToCart").addEventListener("click", function() {
        alert("장바구니에 해당 상품이 담겼습니다");
    });
</script>
</body>
</html>
