<%--
  Created by IntelliJ IDEA.
  User: JungSuyoung
  Date: 2023-09-06
  Time: 오후 4:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>검진데이터 확인하기</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/backgroundpredict02.css" />
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/button.css" />
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/hospitalDataTable.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/predict02modal.css" />
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/medicineModal.css" />

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
    <div class="section-header">2. 건강 검진 결과 및 이력</div>
    <div class="section-description">
        제휴병원에서 가져온 데이터 및 이력을 조회하고, <br>
        정상수치와 비교하여 위험도를 표시하였습니다.
    </div>
</div>

<div id="app">
    <div class="main-feature-section">
        <div class="table-title" style="display: inline-block;">기본 검사 결과</div>
        <div class="screenDetail" data-toggle="modal" data-target="#joinModal" style="display: inline-block;">ℹ️</div>
        <div class="modal" id="joinModal">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <!-- Modal Header -->
                    <div class="modal-header" style="text-align: left">
                        <h4 class="modal-title">기본 검사</h4>
                    </div>
                    <!-- Modal body -->
                    <div class="modal-body" style="text-align: left">
                        <h3>1. 성별</h3>
                        성별은 개인의 생물학적 성별을 나타냅니다. 일반적으로 남성과 여성으로 구분되며, 각각의 성별은 건강 지표와 위험 요소 평가의 기준이 됩니다.<br>
                        <h3>2. 나이</h3>
                        나이는 개인의 현재 나이를 의미합니다. 나이에 따라 건강 상태와 위험 요소를 평가하는 데 사용됩니다.<br>
                        <h3>3. 신장</h3>
                        신장은 개인의 키를 측정한 값입니다. 일반적으로 센티미터(cm) 단위로 표기되며, 체질량지수(BMI) 계산에 사용됩니다.<br>
                        <h3>4. 체중</h3>
                        체중은 개인의 몸무게를 측정한 값입니다. 보통 킬로그램(kg) 단위로 표기되며, BMI 계산에 사용됩니다.<br>
                        <h3>5. BMI (Body Mass Index)</h3>
                        BMI는 체중과 신장을 기반으로 한 체지방 비율을 추정하는 지표입니다. 건강한 체중을 유지하는 데 도움이 되는 지표로 사용됩니다.<br>
                        <h3>6. 허리둘레</h3>
                        허리둘레는 허리 주위의 둘레를 측정한 값입니다. 복부 비만을 판단하고, 심혈관 질환 위험도를 평가하는 데 사용됩니다.<br>
                        <h3>7. 수축기혈압</h3>
                        수축기 혈압은 심장이 수축할 때의 최고 혈압을 나타냅니다. 고혈압의 진단과 관리에 중요한 지표로 사용됩니다.<br>
                        <h3>8. 이완기혈압</h3>
                        이완기 혈압은 심장이 이완할 때의 최저 혈압을 나타냅니다. 혈압 관리와 심혈관 질환 평가에 사용됩니다.<br>
                        <h3>9. 공복혈당</h3>
                        공복 혈당은 식사를 하지 않은 상태에서 측정한 혈중 글루코스(당) 농도입니다. 당뇨병의 진단과 관리에 사용됩니다.<br>
                        <h3>10. 흡연 유무</h3>
                        흡연 유무는 개인이 흡연을 하는지 여부를 나타냅니다. 흡연은 여러 건강 위험 요소와 관련이 있습니다.<br>
                        <h3>11. 음주 유무</h3>
                        음주 유무는 개인이 음주를 하는지 여부를 나타냅니다. 음주는 건강 상태와 질환 위험을 평가하는데 중요한 요소로 사용됩니다.<br>
                    </div>
                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
                    </div>
                </div>
            </div>
        </div>
        <table class="medicalTestTable">
        <thead>
        <tr>
            <th>검사항목</th>
            <th>결과</th>
            <th>참고치</th>
            <th>위험도</th>
            <th>검진기관</th>
            <th>검진날짜</th>
        </tr>
        </thead>
        <tbody class="tableBody">
        <tr>
            <td>성별</td> <!-- 검사명 -->
            <td id="sex">${hospitalData['SEX']}</td> <!-- 결과 -->
            <td>-</td> <!-- 참고치 -->
            <td>-</td> <!-- 위험도 -->
            <td>서울성모병원</td> <!-- 검진기관 -->
            <td>2023.08.14</td> <!-- 검진날짜 -->
        </tr>
        <tr>
            <td>나이</td> <!-- 검사명 -->
            <td>${hospitalData['AGE']}</td> <!-- 결과 -->
            <td>-</td> <!-- 참고치 -->
            <td>-</td> <!-- 위험도 -->
            <td>서울성모병원</td> <!-- 검진기관 -->
            <td>2023.08.14</td> <!-- 검진날짜 -->
        </tr>
        <tr>
            <td>신장</td> <!-- 검사명 -->
            <td id="height">${hospitalData['HEIGHT']}</td> <!-- 결과 -->
            <td>-</td> <!-- 참고치 -->
            <td>-</td> <!-- 위험도 -->
            <td>서울성모병원</td> <!-- 검진기관 -->
            <td>2023.08.14</td> <!-- 검진날짜 -->
        </tr>
        <tr>
            <td>체중</td> <!-- 검사명 -->
            <td id="weight">${hospitalData['WEIGHT']}</td> <!-- 결과 -->
            <td>-</td> <!-- 참고치 -->
            <td>-</td> <!-- 위험도 -->
            <td>서울성모병원</td> <!-- 검진기관 -->
            <td>2023.08.14</td> <!-- 검진날짜 -->
        </tr>
        <tr>
            <td>BMI</td> <!-- 검사명 -->
            <td id="bmi"></td> <!-- 결과 -->
            <td>-</td> <!-- 참고치 -->
            <td id="bmiRisk"> </td> <!-- 위험도 -->
            <td>서울성모병원</td> <!-- 검진기관 -->
            <td>2023.08.14</td> <!-- 검진날짜 -->
        </tr>
        <tr>
            <td>허리 둘레</td> <!-- 검사명 -->
            <td id="waistline">${hospitalData['WAISTLINE']}</td> <!-- 결과 -->
            <td>≤85</td> <!-- 참고치 -->
            <td id="waistlineRisk"></td> <!-- 위험도 -->
            <td>서울성모병원</td> <!-- 검진기관 -->
            <td>2023.08.14</td> <!-- 검진날짜 -->
        </tr>
        <tr>
            <td>수축기 혈압</td> <!-- 검사명 -->
            <td id="sbp">${hospitalData['SBP']}</td> <!-- 결과 -->
            <td>≤120</td> <!-- 참고치 -->
            <td id="sbpRisk"></td> <!-- 위험도 -->
            <td>서울성모병원</td> <!-- 검진기관 -->
            <td>2023.08.14</td> <!-- 검진날짜 -->
        </tr>
        <tr>
            <td>이완기 혈압</td> <!-- 검사명 -->
            <td id="dbp">${hospitalData['DBP']}</td> <!-- 결과 -->
            <td>≤80</td> <!-- 참고치 -->
            <td id="dbpRisk"></td> <!-- 위험도 -->
            <td>서울성모병원</td> <!-- 검진기관 -->
            <td>2023.08.14</td> <!-- 검진날짜 -->
        </tr>
        <tr>
            <td>공복혈당</td> <!-- 검사명 -->
            <td id="fbg">${hospitalData['FBG']}</td> <!-- 결과 -->
            <td>≤99</td> <!-- 참고치 -->
            <td id="fbgRisk"></td> <!-- 위험도 -->
            <td>서울성모병원</td> <!-- 검진기관 -->
            <td>2023.08.14</td> <!-- 검진날짜 -->
        </tr>
        <tr>
            <td>흡연 유무</td> <!-- 검사명 -->
            <td id="smoking">${hospitalData['SMOKING']}</td> <!-- 결과 -->
            <td>-</td> <!-- 참고치 -->
            <td>-</td> <!-- 위험도 -->
            <td>서울성모병원</td> <!-- 검진기관 -->
            <td>2023.08.14</td> <!-- 검진날짜 -->
        </tr>
        <tr>
            <td>음주 유무</td> <!-- 검사명 -->
            <td id="drinking">${hospitalData['DRINKING']}</td> <!-- 결과 -->
            <td>-</td> <!-- 참고치 -->
            <td>-</td> <!-- 위험도 -->
            <td>서울성모병원</td> <!-- 검진기관 -->
            <td>2023.08.14</td> <!-- 검진날짜 -->
        </tr>
        </tbody>
    </table>
    </div>
    <div class="main-feature-section">
        <div class="table-title" style="display: inline-block;">CBC 검사 (일반 혈액 검사)</div>
        <div class="screenDetail" data-toggle="modal" data-target="#joinModal02" style="display: inline-block;">ℹ️</div>
        <div class="modal" id="joinModal02">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <!-- Modal Header -->
                    <div class="modal-header" style="text-align: left">
                        <h4 class="modal-title">CBC 검사 (일반 혈액 검사)</h4>
                    </div>
                    <!-- Modal body -->
                    <div class="modal-body" style="text-align: left">
                        <h3>1. CBC검사란?</h3>
                        CBC 검사는 "Complete Blood Count"의 약자입니다.<br>
                        이 검사는 환자의 전반적인 건강 상태를 평가하고, 특정 장애 또는 질병의 징후를 식별하는 데 도움이 됩니다. <br>
                        CBC 검사는 또한, 혈액의 다양한 구성 요소를 측정하여, 이러한 요소의 수량, 크기, 및 전반적인 건강 상태를 평가합니다.<br>
                        <h3>2. HbA1c</h3>
                        HbA1c는 글리코세이티드 헤모글로빈의 약자입니다.<br>
                        이것은 우리 몸에서 일정 기간 동안 혈당 수준을 나타내는 중요한 지표입니다.<br>
                        HbA1c 수치는 과거 2~3개월 동안의 평균 혈당 수준을 반영하며, 당뇨병의 관리와 진단에 주로 사용됩니다.<br>
                        <h3>3. WBC Count</h3>
                        WBC Count는 백혈구 수를 나타냅니다.<br>
                        백혈구는 인체의 면역 시스템에서 중요한 역할을 담당하며, 감염, 염증 및 기타 건강 문제에 반응합니다.<br>
                        WBC Count는 백혈구의 총 수를 측정하여, 인체가 현재 감염 또는 다른 건강 문제에 얼마나 효과적으로 대응하고 있는지 평가합니다.<br>
                        <h3>4. Platelet Count</h3>
                        Platelet Count는 혈액 중에 있는 혈소판의 수를 측정합니다.<br>
                        혈소판은 혈액 응고에 필수적이며, 출혈을 방지하는 데 도움을 줍니다. <br>
                        Platelet Count는 혈소판의 총량을 측정하여, 출혈, 혈전 또는 기타 혈액 관련 질환의 위험을 평가합니다.<br>
                    </div>
                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
                    </div>
                </div>
            </div>
        </div>
        <table class="medicalTestTable">
            <thead>
            <tr>
                <th>검사항목</th>
                <th>결과</th>
                <th>참고치</th>
                <th>위험도</th>
                <th>검진기관</th>
                <th>검진날짜</th>
            </tr>
            </thead>
            <tbody class="tableBody">
            <tr>
                <td>HbA1c</td> <!-- 검사명 -->
                <td id="hba1c">${hospitalData['HBA1C']}</td> <!-- 결과 -->
                <td>4.4 ~ 6.0</td> <!-- 참고치 -->
                <td id="hba1cRisk"></td> <!-- 위험도 -->
                <td>서울성모병원</td> <!-- 검진기관 -->
                <td>2023.08.14</td> <!-- 검진날짜 -->
            </tr>
            <tr>
                <td>WBC Count</td> <!-- 검사명 -->
                <td id="wbccount">${hospitalData['WBCCOUNT']}</td> <!-- 결과 -->
                <td>4.0 ~ 9.9</td> <!-- 참고치 -->
                <td id="wbccountRisk"></td> <!-- 위험도 -->
                <td>서울성모병원</td> <!-- 검진기관 -->
                <td>2023.08.14</td> <!-- 검진날짜 -->
            </tr>
            <tr>
                <td>Platelet Count</td> <!-- 검사명 -->
                <td id="plateletcount">${hospitalData['PLATELETCOUNT']}</td> <!-- 결과 -->
                <td>150 ~ 449</td> <!-- 참고치 -->
                <td id="plateletcountRisk"></td> <!-- 위험도 -->
                <td>서울성모병원</td> <!-- 검진기관 -->
                <td>2023.08.14</td> <!-- 검진날짜 -->
            </tr>
            </tbody>
        </table>
    </div>
    <div class="main-feature-section">
        <div class="table-title" style="display: inline-block;">심혈관 및 고지혈 검사</div>
        <div class="screenDetail" data-toggle="modal" data-target="#joinModal03" style="display: inline-block;">ℹ️</div>
        <div class="modal" id="joinModal03">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <!-- Modal Header -->
                    <div class="modal-header" style="text-align: left">
                        <h4 class="modal-title">심혈관 및 고지혈 검사</h4>
                    </div>
                    <!-- Modal body -->
                    <div class="modal-body" style="text-align: left">
                        <h3>1. 심혈관 및 고지혈 검사란?</h3>
                        심혈관 및 고지혈검사는 심장과 혈관 건강, 그리고 혈중 지방 수치를 평가하는 데 사용되는 검사입니다.<br>
                        이러한 검사는 심혈관 질환의 위험도를 평가하고, 혈중 지방과 콜레스테롤 수치를 체크하여, 개인의 건강 상태와 질병 위험도를 파악하는 데 도움을 줍니다.
                        <h3>2. 총 콜레스테롤</h3>
                        총 콜레스테롤은 혈중에 있는 콜레스테롤의 전체 수치를 나타냅니다. <br>
                        콜레스테롤은 세포 구조와 호르몬, 비타민 D의 생산에 필요한 지방입니다. <br>
                        그러나 과도한 콜레스테롤은 혈관을 막아 심혈관 질환의 위험을 높일 수 있습니다.<br>
                        <h3>3. 트리글리세라이드</h3>
                        트리글리세라이드는 혈중에 있는 또 다른 형태의 지방입니다.<br>
                        이것은 식사로 섭취한 칼로리가 사용되지 않을 때, 에너지 저장의 형태로 몸에 저장됩니다.<br>
                        높은 트리글리세라이드 수치는 심혈관 질환의 위험을 높일 수 있습니다.<br>
                        <h3>4. HDL</h3>
                        HDL은 고밀도 지단백콜레스테롤을 의미합니다.<br>
                        이것은 "좋은 콜레스테롤"로 알려져 있으며, 혈중의 나쁜 콜레스테롤을 간으로 운반해 체내에서 제거하는 역할을 합니다. <br>
                        높은 HDL 수치는 심혈관 질환의 위험을 감소시킵니다.
                        <h3>5. LDL</h3>
                        LDL은 저밀도 지단백콜레스테롤을 의미하며, "나쁜 콜레스테롤"로 분류됩니다.<br>
                        LDL이 과도하게 많으면 혈관에 콜레스테롤이 쌓이게 되어 동맥 경화와 같은 심혈관 질환을 유발할 수 있습니다.<br>
                        <h3>6. Hemoglobin</h3>
                        Hemoglobin은 적혈구 내에 있는 단백질로, 산소와 이산화탄소의 운반을 담당합니다.<br>
                        Hemoglobin 수치는 적혈구의 산소 운반 능력을 나타내며, 이것의 수치가 낮으면 빈혈, 높으면 폴리사이테미아와 같은 질병의 위험이 있습니다.<br>
                    </div>
                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
                    </div>
                </div>
            </div>
        </div>
        <table class="medicalTestTable">
        <thead>
        <tr>
            <th>검사항목</th>
            <th>결과</th>
            <th>참고치</th>
            <th>위험도</th>
            <th>검진기관</th>
            <th>검진날짜</th>
        </tr>
        </thead>
        <tbody class="tableBody">
        <tr>
            <td>총콜레스테롤</td> <!-- 검사명 -->
            <td id="tc">${hospitalData['TC']}</td> <!-- 결과 -->
            <td>≤179</td> <!-- 참고치 -->
            <td id="tcRisk"></td> <!-- 위험도 -->
            <td>서울성모병원</td> <!-- 검진기관 -->
            <td>2023.08.14</td> <!-- 검진날짜 -->
        </tr>
        <tr>
            <td>트리글리세라이드</td> <!-- 검사명 -->
            <td id="tg">${hospitalData['TG']}</td> <!-- 결과 -->
            <td>≤149</td> <!-- 참고치 -->
            <td id="tgRisk"></td> <!-- 위험도 -->
            <td>서울성모병원</td> <!-- 검진기관 -->
            <td>2023.08.14</td> <!-- 검진날짜 -->
        </tr>
        <tr>
            <td>HDL</td> <!-- 검사명 -->
            <td id="hdl">${hospitalData['HDL']}</td> <!-- 결과 -->
            <td>60≤</td> <!-- 참고치 -->
            <td id="hdlRisk"></td> <!-- 위험도 -->
            <td>서울성모병원</td> <!-- 검진기관 -->
            <td>2023.08.14</td> <!-- 검진날짜 -->
        </tr>
        <tr>
            <td>LDL</td> <!-- 검사명 -->
            <td id="ldl">${hospitalData['LDL']}</td> <!-- 결과 -->
            <td>≤129</td> <!-- 참고치 -->
            <td id="ldlRisk"></td> <!-- 위험도 -->
            <td>서울성모병원</td> <!-- 검진기관 -->
            <td>2023.08.14</td> <!-- 검진날짜 -->
        </tr>
        <tr>
            <td>hemoglobin</td> <!-- 검사명 -->
            <td id="hb">${hospitalData['HB']}</td> <!-- 결과 -->
            <td>13.0 ~ 17.9</td> <!-- 참고치 -->
            <td id="hbRisk"></td> <!-- 위험도 -->
            <td>서울성모병원</td> <!-- 검진기관 -->
            <td>2023.08.14</td> <!-- 검진날짜 -->
        </tr>
        </tbody>
    </table>
    </div>
    <div class="main-feature-section">
        <div class="table-title" style="display: inline-block;">간 기능 검사</div>
        <div class="screenDetail" data-toggle="modal" data-target="#joinModal04" style="display: inline-block;">ℹ️</div>
        <div class="modal" id="joinModal04">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <!-- Modal Header -->
                    <div class="modal-header" style="text-align: left">
                        <h4 class="modal-title">간 기능 검사</h4>
                    </div>
                    <!-- Modal body -->
                    <div class="modal-body" style="text-align: left">
                        <h3>1. 간 기능 검사란?</h3>
                        간 기능 검사는 간의 건강과 기능 상태를 평가하는 데 사용되는 일련의 검사입니다.<br>
                        간은 우리 몸의 중요한 장기로, 독소를 제거하고, 에너지를 저장하며, 단백질을 생성하는 역할을 합니다.<br>
                        간 기능 검사는 이러한 기능이 정상적으로 이루어지고 있는지, 간에 손상이나 질병이 있는지를 확인하기 위해 실시됩니다.
                        <h3>2. AST</h3>
                        AST(Aspartate Aminotransferase)는 간과 다른 몇몇 장기에서 발견되는 효소입니다. 높은 AST 수치는 간 손상의 가능성을 나타냅니다.
                        <h3>3. ALT</h3>
                        ALT(Alanine Aminotransferase)도 간 손상을 나타내는 효소로, 주로 간에 위치해 있습니다. <br>
                        AST와 ALT의 수치는 간의 손상 정도와 기능을 평가하는 데 중요한 지표로 사용됩니다.
                        <h3>4. ALP</h3>
                        ALP(Alkaline Phosphatase)는 간, 뼈, 담낭 등에서 발견되는 효소입니다. ALP 수치의 증가는 간 질환, 뼈 질환 등을 나타낼 수 있습니다.
                        <h3>5. γ-GTP</h3>
                        γ-GTP(Gamma-glutamyl transpeptidase)는 간기능을 평가하는 데 사용되는 효소로, 간 손상이나 간 질환 시 수치가 증가합니다.
                        <h3>6. 혈청 크레아티닌</h3>
                        혈청 크레아티닌은 신장 기능을 평가하는 데 중요한 지표로, 신장에서 이뇨제와 함께 배출되는 물질입니다. 높은 수치는 신장 기능 저하를 나타낼 수 있습니다.
                        <h3>7. 총 빌리루빈</h3>
                        총 빌리루빈은 간에서 생성되고, 담낭과 소장을 통해 몸 밖으로 배출되는 노란색 색소입니다. 높은 빌리루빈 수치는 간 질환이나 담낭 질환을 의미할 수 있습니다.
                        <h3>8. 알부민</h3>
                        알부민은 간에서 생산되는 주요 단백질로, 혈액의 액체 부분을 유지하고, 다양한 물질을 운반하는 역할을 합니다. 낮은 알부민 수치는 간 기능 저하를 나타낼 수 있습니다.
                        <h3>9. prothrombin time</h3>
                        prothrombin time은 혈액의 응고 능력을 측정하는 검사로, 간이 만들어내는 응고 인자의 활성을 평가합니다. 이 검사 결과는 간 질환 또는 응고 장애를 평가하는 데 사용됩니다.
                        <h3>10. Total protein</h3>
                        Total protein은 혈청에 있는 모든 단백질의 농도를 측정합니다. 간이 단백질을 생산하기 때문에, 총 단백질 수치는 간의 기능을 반영할 수 있습니다.
                    </div>
                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
                    </div>
                </div>
            </div>
        </div>
        <table class="medicalTestTable">
            <thead>
            <tr>
                <th>검사항목</th>
                <th>결과</th>
                <th>참고치</th>
                <th>위험도</th>
                <th>검진기관</th>
                <th>검진날짜</th>
            </tr>
            </thead>
            <tbody class="tableBody">
        <tr>
            <td>AST</td> <!-- 검사명 -->
            <td id="ast">${hospitalData['AST']}</td> <!-- 결과 -->
            <td>0 ~ 39</td> <!-- 참고치 -->
            <td id="astRisk"></td> <!-- 위험도 -->
            <td>서울성모병원</td> <!-- 검진기관 -->
            <td>2023.08.14</td> <!-- 검진날짜 -->
        </tr>
        <tr>
            <td>ALT</td> <!-- 검사명 -->
            <td id="alt">${hospitalData['ALT']}</td> <!-- 결과 -->
            <td>0 ~ 39</td> <!-- 참고치 -->
            <td id="altRisk"></td> <!-- 위험도 -->
            <td>서울성모병원</td> <!-- 검진기관 -->
            <td>2023.08.14</td> <!-- 검진날짜 -->
        </tr>
        <tr>
            <td>ALP</td> <!-- 검사명 -->
            <td id="alp">${hospitalData['ALP']}</td> <!-- 결과 -->
            <td>40 ~ 129</td> <!-- 참고치 -->
            <td id="alpRisk"></td> <!-- 위험도 -->
            <td>서울성모병원</td> <!-- 검진기관 -->
            <td>2023.08.14</td> <!-- 검진날짜 -->
        </tr>
        <tr>
            <td>γGTP</td> <!-- 검사명 -->
            <td id="ggtp">${hospitalData['GGTP']}</td> <!-- 결과 -->
            <td>10 ~ 69</td> <!-- 참고치 -->
            <td id="ggtpRisk"></td> <!-- 위험도 -->
            <td>서울성모병원</td> <!-- 검진기관 -->
            <td>2023.08.14</td> <!-- 검진날짜 -->
        </tr>
        <tr>
            <td>혈청크레아티닌</td> <!-- 검사명 -->
            <td id="serumcreatinine">${hospitalData['SERUMCREATININE']}</td> <!-- 결과 -->
            <td>0.5 ~ 1.4</td> <!-- 참고치 -->
            <td id="serumcreatinineRisk"></td> <!-- 위험도 -->
            <td>서울성모병원</td> <!-- 검진기관 -->
            <td>2023.08.14</td> <!-- 검진날짜 -->
        </tr>
        <tr>
            <td>총 빌리루빈</td> <!-- 검사명 -->
            <td id="bilirubin">${hospitalData['BILIRUBIN']}</td> <!-- 결과 -->
            <td>0.0 ~ 1.2</td> <!-- 참고치 -->
            <td id="bilirubinRisk"></td> <!-- 위험도 -->
            <td>서울성모병원</td> <!-- 검진기관 -->
            <td>2023.08.14</td> <!-- 검진날짜 -->
        </tr>
        <tr>
            <td>알부민</td> <!-- 검사명 -->
            <td id="albumin">${hospitalData['ALBUMIN']}</td> <!-- 결과 -->
            <td>3.5 ~ 5.2</td> <!-- 참고치 -->
            <td id="albuminRisk"></td> <!-- 위험도 -->
            <td>서울성모병원</td> <!-- 검진기관 -->
            <td>2023.08.14</td> <!-- 검진날짜 -->
        </tr>
        <tr>
            <td>prothrombin time</td> <!-- 검사명 -->
            <td id="prothrombintime">${hospitalData['PROTHROMBINTIME']}</td> <!-- 결과 -->
            <td>11.4 ~ 15.4</td> <!-- 참고치 -->
            <td id="prothrombintimeRisk"></td> <!-- 위험도 -->
            <td>서울성모병원</td> <!-- 검진기관 -->
            <td>2023.08.14</td> <!-- 검진날짜 -->
        </tr>
        <tr>
            <td>Total protein</td> <!-- 검사명 -->
            <td id="totalprotein">${hospitalData['TOTALPROTEIN']}</td> <!-- 결과 -->
            <td>6.0 ~ 8.9</td> <!-- 참고치 -->
            <td id="totalproteinRisk"></td> <!-- 위험도 -->
            <td>서울성모병원</td> <!-- 검진기관 -->
            <td>2023.08.14</td> <!-- 검진날짜 -->
        </tr>
            </tbody>
        </table>
    </div>
    <div class="main-feature-section">
        <div class="table-title" style="display: inline-block;">신장 기능 검사</div>
        <div class="screenDetail" data-toggle="modal" data-target="#joinModal05" style="display: inline-block;">ℹ️</div>
        <div class="modal" id="joinModal05">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <!-- Modal Header -->
                    <div class="modal-header" style="text-align: left">
                        <h4 class="modal-title">신장 기능 검사</h4>
                    </div>
                    <!-- Modal body -->
                    <div class="modal-body" style="text-align: left">
                        <h3>1. 신장 기능 검사란?</h3>
                        신장 기능 검사는 신장의 건강과 작동 상태를 평가하는 데 사용되는 검사입니다.<br>
                        신장은 우리 몸에서 노폐물과 초과된 물을 필터링하여 소변으로 배출하는 중요한 역할을 합니다. <br>
                        신장 기능 검사를 통해 신장의 손상 여부, 신장 질환의 진단 및 진행 상태 등을 평가할 수 있습니다.<br>
                        <h3>2. Creatinine</h3>
                        크레아티닌(Creatinine)은 근육에서 생성되고 신장을 통해 배출되는 화합물입니다.<br>
                        혈청 크레아티닌 수치는 신장의 건강 상태를 반영하는 중요한 지표로, 신장의 필터링 능력이 감소하면 혈중 크레아티닌 농도가 증가합니다.  <br>
                        <h3>3. eGFR</h3>
                        eGFR(estimated Glomerular Filtration Rate)는 신장의 걸러내기 능력을 추정하는 값입니다.<br>
                        eGFR은 신장의 필터링 능력을 정확하게 평가하여 신장 기능의 정도를 알려주며, 낮은 eGFR 값은 신장 기능이 저하되었음을 나타냅니다.<br>
                        <h3>4. BUN</h3>
                        BUN(Blood Urea Nitrogen)은 혈중에 있는 요소질소의 농도를 측정하는 검사입니다.<br>
                        BUN 수치는 신장의 건강 상태와 기능을 평가하는 데 사용되며, 높은 BUN 수치는 신장의 필터링 능력 저하를 나타낼 수 있습니다.<br>
                    </div>
                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
                    </div>
                </div>
            </div>
        </div>
        <table class="medicalTestTable">
            <thead>
            <tr>
                <th>검사항목</th>
                <th>결과</th>
                <th>참고치</th>
                <th>위험도</th>
                <th>검진기관</th>
                <th>검진날짜</th>
            </tr>
            </thead>
            <tbody class="tableBody">
        <tr>
            <td>creatinine</td> <!-- 검사명 -->
            <td id="creatinine">${hospitalData['PLATELETCOUNT']}</td> <!-- 결과 -->
            <td>0.7 ~ 1.2</td> <!-- 참고치 -->
            <td id="creatinineRisk"></td> <!-- 위험도 -->
            <td>서울성모병원</td> <!-- 검진기관 -->
            <td>2023.08.14</td> <!-- 검진날짜 -->
        </tr>
        <tr>
            <td>eGFR</td> <!-- 검사명 -->
            <td id="egfr">${hospitalData['EGFR']}</td> <!-- 결과 -->
            <td>90≤</td> <!-- 참고치 -->
            <td id="egfrRisk"></td> <!-- 위험도 -->
            <td>서울성모병원</td> <!-- 검진기관 -->
            <td>2023.08.14</td> <!-- 검진날짜 -->
        </tr>
        <tr>
            <td>BUN</td> <!-- 검사명 -->
            <td id="bun">${hospitalData['BUN']}</td> <!-- 결과 -->
            <td>10 ~ 26</td> <!-- 참고치 -->
            <td id="bunRisk"></td> <!-- 위험도 -->
            <td>서울성모병원</td> <!-- 검진기관 -->
            <td>2023.08.14</td> <!-- 검진날짜 -->
        </tr>
            </tbody>
        </table>
    </div>
    <div class="main-feature-section">
        <div class="table-title" style="display: inline-block;">갑상선 검사</div>
        <div class="screenDetail" data-toggle="modal" data-target="#joinModal06" style="display: inline-block;">ℹ️</div>
        <div class="modal" id="joinModal06">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <!-- Modal Header -->
                    <div class="modal-header" style="text-align: left">
                        <h4 class="modal-title">갑상선 검사</h4>
                    </div>
                    <!-- Modal body -->
                    <div class="modal-body" style="text-align: left">
                        <h3>1. 갑상선 검사란?</h3>
                        갑상선 검사는 갑상선의 기능과 건강 상태를 평가하는 데 사용되는 검사입니다.<br>
                        갑상선은 목 부위에 위치한 나비 모양의 장기로, 세포의 에너지 생성과 대사율 조절, 체온 유지 등에 관여하는 갑상선 호르몬을 생산합니다.<br>
                        이러한 호르몬의 불균형은 다양한 건강 문제를 초래할 수 있으므로, 갑상선 검사는 그 농도와 기능을 측정하여 이러한 문제를 식별하고 관리하는 데 도움이 됩니다.<br>
                        <h3>2. freeT4</h3>
                        freeT4는 갑상선에서 생산된 후에 혈장에 떠다니며 여러 기관과 세포로 전달되는 자유 갑상선 호르몬입니다.<br>
                        이 호르몬은 대사율, 에너지 사용, 그리고 세포의 성장과 기능에 영향을 미칩니다. <br>
                        freeT4의 농도는 갑상선 기능의 상태를 평가하는 중요한 지표로 사용됩니다.<br>
                        <h3>3. T3</h3>
                        T3는 갑상선 호르몬 중 하나로, 몸의 에너지 사용률과 대사를 조절하는 역할을 합니다.<br>
                        T3 레벨이 높으면 신진대사가 빨라지고, 낮으면 신진대사가 느려집니다. <br>
                        따라서, T3의 농도 측정은 갑상선 기능 장애를 진단하는 데 중요합니다.<br>
                        <h3>4. TSH</h3>
                        TSH(Thyroid Stimulating Hormone)는 뇌의 뇌하수체에서 분비되어 갑상선 호르몬의 생성과 분비를 조절하는 호르몬입니다.<br>
                        TSH 레벨이 높으면 갑상선 기능 저하증을, 낮으면 갑상선 기능 항진증을 의심할 수 있습니다.<br>
                    </div>
                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
                    </div>
                </div>
            </div>
        </div>
        <table class="medicalTestTable">
            <thead>
            <tr>
                <th>검사항목</th>
                <th>결과</th>
                <th>참고치</th>
                <th>위험도</th>
                <th>검진기관</th>
                <th>검진날짜</th>
            </tr>
            </thead>
            <tbody class="tableBody">
        <tr>
            <td>freeT4</td> <!-- 검사명 -->
            <td id="freet4">${hospitalData['FREET4']}</td> <!-- 결과 -->
            <td>1.1 ~ 1.9</td> <!-- 참고치 -->
            <td id="freet4Risk"></td> <!-- 위험도 -->
            <td>서울성모병원</td> <!-- 검진기관 -->
            <td>2023.08.14</td> <!-- 검진날짜 -->
        </tr>
        <tr>
            <td>T3</td> <!-- 검사명 -->
            <td id="t3">${hospitalData['T3']}</td> <!-- 결과 -->
            <td>60 ~ 179</td> <!-- 참고치 -->
            <td id="t3Risk"></td> <!-- 위험도 -->
            <td>서울성모병원</td> <!-- 검진기관 -->
            <td>2023.08.14</td> <!-- 검진날짜 -->
        </tr>
        <tr>
            <td>TSH</td> <!-- 검사명 -->
            <td id="tsh">${hospitalData['TSH']}</td> <!-- 결과 -->
            <td>≤3.9</td> <!-- 참고치 -->
            <td id="tshRisk"></td> <!-- 위험도 -->
            <td>서울성모병원</td> <!-- 검진기관 -->
            <td>2023.08.14</td> <!-- 검진날짜 -->
        </tr>
            </tbody>
        </table>
    </div>
    <div class="main-feature-section">
        <div class="table-title" style="display: inline-block;">소변 검사</div>
        <div class="screenDetail" data-toggle="modal" data-target="#joinModal07" style="display: inline-block;">ℹ️</div>
        <div class="modal" id="joinModal07">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <!-- Modal Header -->
                    <div class="modal-header" style="text-align: left">
                        <h4 class="modal-title">소변 검사</h4>
                    </div>
                    <!-- Modal body -->
                    <div class="modal-body" style="text-align: left">
                        <h3>1. 소변 검사란?</h3>
                        소변 검사는 소변의 물리적, 화학적, 현미경적 특성을 분석하여 건강 상태를 평가하고 다양한 질환을 진단하는 검사입니다.<br>
                        소변은 신장에서 생성되어 체내의 불필요한 물질과 폐기물을 배출하는 중요한 경로로, 그 구성 성분과 특성이 개인의 건강 상태와 직접적으로 관련이 있습니다.<br>
                        <h3>2. ketone urine</h3>
                        ketone urine은 소변에서 케톤체의 존재를 확인하는 항목입니다. <br>
                        케톤체는 몸이 지방을 에너지로 사용할 때 생기는 화합물로, 일반적으로 혈당 농도가 낮을 때 또는 식이섬유소가 부족할 때 발생합니다.<br>
                        케톤체가 소변에 나타나는 것은 당뇨병, 금식, 고지방 식단 등에서 자주 관찰됩니다.<br>
                        <h3>3. pH urine</h3>
                        pH urine은 소변의 산도를 측정하는 값입니다. <br>
                        소변의 pH 레벨은 식이나 건강 상태에 따라 변할 수 있으며, 정상 범위는 대개 4.6에서 8.0 사이입니다. <br>
                        pH 레벨은 각종 질환의 진단과 모니터링, 그리고 치료 반응의 평가에 사용됩니다.<br>
                        <h3>4. protein urine</h3>
                        protein urine은 소변에서 단백질의 존재를 검사하는 항목입니다.<br>
                        정상적으로는 소변에 단백질이 거의 없거나 아예 없어야 하지만, 신장에 문제가 있을 경우 단백질이 소변에 누출될 수 있습니다.<br>
                        따라서 소변 단백질 검사는 주로 신장 질환의 진단과 진행 상태 모니터링에 활용됩니다.<br>
                    </div>
                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
                    </div>
                </div>
            </div>
        </div>
        <table class="medicalTestTable">
            <thead>
            <tr>
                <th>검사항목</th>
                <th>결과</th>
                <th>참고치</th>
                <th>위험도</th>
                <th>검진기관</th>
                <th>검진날짜</th>
            </tr>
            </thead>
            <tbody class="tableBody">
        <tr>
            <td>ketone urine</td> <!-- 검사명 -->
            <td id="ketoneurine">${hospitalData['KETONEURINE']}</td> <!-- 결과 -->
            <td>≤5</td> <!-- 참고치 -->
            <td id="ketoneurineRisk"></td> <!-- 위험도 -->
            <td>서울성모병원</td> <!-- 검진기관 -->
            <td>2023.08.14</td> <!-- 검진날짜 -->
        </tr>
        <tr>
            <td>pH urine</td> <!-- 검사명 -->
            <td id="phurine">${hospitalData['PHURINE']}</td> <!-- 결과 -->
            <td>4.0 ~ 7.9</td> <!-- 참고치 -->
            <td id="phurineRisk"></td> <!-- 위험도 -->
            <td>서울성모병원</td> <!-- 검진기관 -->
            <td>2023.08.14</td> <!-- 검진날짜 -->
        </tr>
        <tr>
            <td>protein urine</td> <!-- 검사명 -->
            <td id="proteinurine">${hospitalData['PROTEINURINE']}</td> <!-- 결과 -->
            <td>0 or 1 (neg or pos)</td> <!-- 참고치 -->
            <td id="proteinurineRisk">-</td> <!-- 위험도 -->
            <td>서울성모병원</td> <!-- 검진기관 -->
            <td>2023.08.14</td> <!-- 검진날짜 -->
        </tr>
            </tbody>
        </table>
    </div>
    <div class="main-feature-section">
        <div class="table-title" style="display: inline-block;">폐기능 검사</div>
        <div class="screenDetail" data-toggle="modal" data-target="#joinModal08" style="display: inline-block;">ℹ️</div>
        <div class="modal" id="joinModal08">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <!-- Modal Header -->
                    <div class="modal-header" style="text-align: left">
                        <h4 class="modal-title">폐기능 검사</h4>
                    </div>
                    <!-- Modal body -->
                    <div class="modal-body" style="text-align: left">
                        <h3>1. 폐기능 검사란?</h3>
                        폐기능 검사는 폐의 작동과 호흡 기능을 평가하기 위한 시리즈의 검사입니다.<br>
                        이 검사는 폐가 공기를 효과적으로 받아들이고 배출하는 능력을 측정하며, 폐와 호흡기 질환의 진단, 평가, 모니터링에 널리 사용됩니다.<br>
                        <h3>2. FVC</h3>
                        FVC (Forced Vital Capacity)는 강제적으로 한 번에 호흡할 수 있는 최대 공기량을 의미합니다. <br>
                        이 값은 폐의 최대 확장 및 수축 능력을 나타내며, 폐 질환의 진단과 진행 상태를 판단하는 데 중요한 척도입니다.<br>
                        <h3>3. FEV1	</h3>
                        FEV1 (Forced Expiratory Volume in 1 second)는 강제 호흡 시 1초 동안에 배출할 수 있는 공기량을 나타냅니다. <br>
                        FEV1은 폐기능의 제한 상태를 평가하는데 주로 사용되며, 특히 천식, 만성 폐쇄성 폐 질환 (COPD) 등의 진단에 유용합니다.<br>
                        <h3>4. FEV1/FVC</h3>
                        FEV1/FVC 비율은 FEV1을 FVC로 나눈 값으로, 폐의 배출 능력을 평가하는 지표입니다.<br>
                        이 비율이 낮으면 폐쇄성 폐 질환의 가능성을 나타내고, 높으면 제한적 폐 질환의 가능성을 나타낼 수 있습니다.<br>
                        <h3>5. Postbronchdilator test</h3>
                        Postbronchodilator test는 환자에게 기관지 확장제를 투여한 후 폐기능을 재평가하는 검사입니다.<br>
                        이 검사는 폐쇄성 폐 질환의 진단과 진행 정도, 그리고 기관지 확장제의 효과를 평가하는데 사용됩니다.<br>
                    </div>
                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
                    </div>
                </div>
            </div>
        </div>
        <table class="medicalTestTable">
            <thead>
            <tr>
                <th>검사항목</th>
                <th>결과</th>
                <th>참고치</th>
                <th>위험도</th>
                <th>검진기관</th>
                <th>검진날짜</th>
            </tr>
            </thead>
            <tbody class="tableBody">
        <tr>
            <td>FVC</td> <!-- 검사명 -->
            <td id="fvc">${hospitalData['FVC']}</td> <!-- 결과 -->
            <td>4.0≤</td> <!-- 참고치 -->
            <td id="fvcRisk"></td> <!-- 위험도 -->
            <td>서울성모병원</td> <!-- 검진기관 -->
            <td>2023.08.14</td> <!-- 검진날짜 -->
        </tr>
        <tr>
            <td>FEV1</td> <!-- 검사명 -->
            <td id="fev1">${hospitalData['FEV1']}</td> <!-- 결과 -->
            <td>3.2≤</td> <!-- 참고치 -->
            <td id="fev1Risk"></td> <!-- 위험도 -->
            <td>서울성모병원</td> <!-- 검진기관 -->
            <td>2023.08.14</td> <!-- 검진날짜 -->
        </tr>
        <tr>
            <td>FEV1/FVC</td> <!-- 검사명 -->
            <td id="fev1fvc">${hospitalData['FEV1FVC']}</td> <!-- 결과 -->
            <td>5.6≤</td> <!-- 참고치 -->
            <td id="fev1fvcRisk"></td> <!-- 위험도 -->
            <td>서울성모병원</td> <!-- 검진기관 -->
            <td>2023.08.14</td> <!-- 검진날짜 -->
        </tr>
        <tr>
            <td>Postbronchdilator test</td> <!-- 검사명 -->
            <td id="pbdtest">${hospitalData['PBDTEST']}</td> <!-- 결과 -->
            <td>12.0≤</td> <!-- 참고치 -->
            <td id="pbdtestRisk"></td> <!-- 위험도 -->
            <td>서울성모병원</td> <!-- 검진기관 -->
            <td>2023.08.14</td> <!-- 검진날짜 -->
        </tr>
        </tbody>
    </table>
    </div>
</div>
</div>


<div class="content-section">
    <div class="section-header">약물 복용 이력</div>
    <div class="section-description">
        식품의약품안전처의 "e약은요" 서비스를 통해 현재 복용 중인 약물을 조회, 입력합니다.<br>
        <button class="complete-button" id="showModalBtn">조회하기</button>
    </div>
    <div id="medicineModal" class="medicineModal">
        <div class="medicineModal-content">
            <div class="medicineModal-header">
                <span class="close">&times;</span>
                <h1>약물 조회</h1>
                <p>식품의약품안전처의 "e약은요" 서비스를 통해 복용 약물을 조회합니다.</p>
            </div>
            <div class="medicineModal-body" id="medicineModal-body">
                <div id="input-section">

                    <div class="input-group">
                        <label for="product-name">제품명</label>
                        <input type="text" id="product-name" placeholder="제품명을 입력하세요.">
                    </div>

                    <div class="input-group">
                        <label for="company-name">회사명</label>
                        <input type="text" id="company-name" placeholder="회사명을 입력하세요.">
                    </div>

                    <button id="search">조회</button>
                </div>
                <div id="result" class="drugResultHidden" style="overflow-y: auto; max-height: 400px;"></div>
            </div>
        </div>
    </div>

</div>
<div class="main-feature-section">
    <div class="table-title">약물 복용 이력 결과</div>
    <div id="selected-items-section">
        <!-- 선택된 약물 정보 표시 -->
    </div>
</div>

<button class="complete-button"
        onclick="window.location.href='<%= request.getContextPath() %>/predict03'">질병예측하기
</button>

<footer style="background: #00a39e; padding: 40px 0; color: #fff; text-align: center;">
    <p style="font-size: 16px; margin: 0;">© 2023 1Q Insurance. All rights reserved.</p>
    <p style="font-size: 14px; margin: 10px 0 0;">인천 서구 에코로 167 하나금융그룹 통합데이터센터 비전센터</p>
</footer>
<script src="${pageContext.request.contextPath}/js/function.js"></script>
<script src="${pageContext.request.contextPath}/js/hospitalDataRiskCheck.js"></script>
<script src="${pageContext.request.contextPath}/js/drugOpenAPI.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.0.7/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>

