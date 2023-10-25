window.onload = function() {
    // 성별
    var sex = document.getElementById("sex").innerText;
    if (parseInt(sex) === 1) {
        document.getElementById("sex").innerText = "남성"; // 남성
    } else if (parseInt(sex) === 2) {
        document.getElementById("sex").innerText = "여성"; // 여성
    }

    //  BMI
    var height = parseFloat(document.getElementById("height").innerText); // cm 단위
    var weight = parseFloat(document.getElementById("weight").innerText); // kg 단위

    height = height / 100; // cm를 m로 변환

    var bmi = weight / (height * height); // BMI 계산

    document.getElementById("bmi").innerText = bmi.toFixed(2); // 소수 둘째자리까지 표시

    // BMI에 따른 위험도 판단
    var bmiRisk = document.getElementById("bmiRisk");
    if (bmi < 18.5) {
        bmiRisk.innerText = "저체중";
    } else if (bmi >= 18.5 && bmi < 23) {
        bmiRisk.innerText = "정상";
    } else if (bmi >= 23 && bmi < 25) {
        bmiRisk.innerText = "과체중";
    } else {
        bmiRisk.innerText = "비만";
    }

    // Waistline
    var waistline = document.getElementById("waistline").innerText;
    var waistlineRisk = document.getElementById("waistlineRisk");
    if (parseInt(waistline) >= 85) {
        waistlineRisk.innerHTML = '<span style="color:red;">▲</span>'; // 빨간색 세모
    } else {
        waistlineRisk.innerHTML = '<span style="color:blue;">▼</span>'; // 파란색 세모
    }

    // SBP
    var sbp = document.getElementById("sbp").innerText;
    var sbpRisk = document.getElementById("sbpRisk");
    if (parseInt(sbp) >= 120) {
        sbpRisk.innerHTML = '<span style="color:red;">▲</span>'; // 빨간색 세모
    } else {
        sbpRisk.innerHTML = '<span style="color:blue;">▼</span>'; // 파란색 세모
    }

    // DBP
    var dbp = document.getElementById("dbp").innerText;
    var dbpRisk = document.getElementById("dbpRisk");
    if (parseInt(dbp) >= 120) {
        dbpRisk.innerHTML = '<span style="color:red;">▲</span>'; // 빨간색 세모
    } else {
        dbpRisk.innerHTML = '<span style="color:blue;">▼</span>'; // 파란색 세모
    }

    // fbg
    var fbg = document.getElementById("fbg").innerText;
    var fbgRisk = document.getElementById("fbgRisk");
    if (parseInt(fbg) >= 99) {
        fbgRisk.innerHTML = '<span style="color:red;">▲</span>'; // 빨간색 세모
    } else {
        fbgRisk.innerHTML = '<span style="color:blue;">▼</span>'; // 파란색 세모
    }

    // tc, 총콜레스테롤
    var tc = document.getElementById("tc").innerText;
    var tcRisk = document.getElementById("tcRisk");
    if (parseInt(tc) >= 179) {
        tcRisk.innerHTML = '<span style="color:red;">▲</span>'; // 빨간색 세모
    } else {
        tcRisk.innerHTML = '<span style="color:blue;">▼</span>'; // 파란색 세모
    }
    
    // tg, 트리글리세라이드
    var tg = document.getElementById("tg").innerText;
    var tgRisk = document.getElementById("tgRisk");
    if (parseInt(tg) >= 149) {
        tgRisk.innerHTML = '<span style="color:red;">▲</span>'; // 빨간색 세모
    } else {
        tgRisk.innerHTML = '<span style="color:blue;">▼</span>'; // 파란색 세모
    }

    // HDL
    var hdl = document.getElementById("hdl").innerText;
    var hdlRisk = document.getElementById("hdlRisk");
    if (parseInt(hdl) >= 60) {
        hdlRisk.innerHTML = '<span style="color:red;">▲</span>'; // 빨간색 세모
    } else {
        hdlRisk.innerHTML = '<span style="color:blue;">▼</span>'; // 파란색 세모
    }

    // LDL
    var ldl = document.getElementById("ldl").innerText;
    var ldlRisk = document.getElementById("ldlRisk");
    if (parseInt(ldl) >= 129) {
        ldlRisk.innerHTML = '<span style="color:red;">▲</span>'; // 빨간색 세모
    } else {
        ldlRisk.innerHTML = '<span style="color:blue;">▼</span>'; // 파란색 세모
    }

    // HB
    var hb = document.getElementById("hb").innerText;
    var hbRisk = document.getElementById("hbRisk");
    if (parseFloat(hb) > 17.9) {
        hbRisk.innerHTML = '<span style="color:red;">▲</span>'; // 빨간색 세모
    } else if ( 17.9 >= parseFloat(hb) && parseFloat(hb) >= 13.0){
        hbRisk.innerHTML = '<span style="color:black;">-</span>';
    } else {
        hbRisk.innerHTML = '<span style="color:blue;">▼</span>'; // 파란색 세모
    }

    // AST
    var ast = document.getElementById("ast").innerText;
    var astRisk = document.getElementById("astRisk");
    if (parseInt(ast) > 39) {
        astRisk.innerHTML = '<span style="color:red;">▲</span>'; // 빨간색 세모
    } else if ( 39 >= parseInt(ast) && parseInt(ast) >= 0){
        astRisk.innerHTML = '<span style="color:black;">-</span>';
    } else {
        astRisk.innerHTML = '<span style="color:blue;">▼</span>'; // 파란색 세모
    }


    // ALT
    var alt = document.getElementById("alt").innerText;
    var altRisk = document.getElementById("altRisk");
    if (parseInt(alt) > 39) {
        altRisk.innerHTML = '<span style="color:red;">▲</span>'; // 빨간색 세모
    } else if ( 39 >= parseInt(alt) && parseInt(alt) >= 0){
        altRisk.innerHTML = '<span style="color:black;">-</span>';
    } else {
        altRisk.innerHTML = '<span style="color:blue;">▼</span>'; // 파란색 세모
    }

    // ALP
    var alp = document.getElementById("alp").innerText;
    var alpRisk = document.getElementById("alpRisk");
    if (parseInt(alt) > 129) {
        alpRisk.innerHTML = '<span style="color:red;">▲</span>'; // 빨간색 세모
    } else if ( 129 >= parseInt(alp) && parseInt(alp) >= 40){
        alpRisk.innerHTML = '<span style="color:black;">-</span>';
    } else {
        alpRisk.innerHTML = '<span style="color:blue;">▼</span>'; // 파란색 세모
    }

    // γGTP
    var ggtp = document.getElementById("ggtp").innerText;
    var ggtpRisk = document.getElementById("ggtpRisk");
    if (parseInt(ggtp) > 69) {
        ggtpRisk.innerHTML = '<span style="color:red;">▲</span>'; // 빨간색 세모
    } else if ( 69 >= parseInt(ggtp) && parseInt(ggtp) >= 10){
        ggtpRisk.innerHTML = '<span style="color:black;">-</span>';
    } else {
        ggtpRisk.innerHTML = '<span style="color:blue;">▼</span>'; // 파란색 세모
    }
    
    // 혈청크레아티닌
    var serumcreatinine = document.getElementById("serumcreatinine").innerText;
    var serumcreatinineRisk = document.getElementById("serumcreatinineRisk");
    if (parseInt(serumcreatinine) > 1.4) {
        serumcreatinineRisk.innerHTML = '<span style="color:red;">▲</span>'; // 빨간색 세모
    } else if ( 1.4 >= parseInt(serumcreatinine) && parseInt(serumcreatinine) >= 0.5){
        serumcreatinineRisk.innerHTML = '<span style="color:black;">-</span>';
    } else {
        serumcreatinineRisk.innerHTML = '<span style="color:blue;">▼</span>'; // 파란색 세모
    }

    // 총 빌리루빈
    var bilirubin = document.getElementById("bilirubin").innerText;
    var bilirubinRisk = document.getElementById("bilirubinRisk");
    if (parseFloat(bilirubin) > 1.2) {
        bilirubinRisk.innerHTML = '<span style="color:red;">▲</span>'; // 빨간색 세모
    } else if ( 1.2 >= parseFloat(bilirubin) && parseFloat(bilirubin) >= 0.0){
        bilirubinRisk.innerHTML = '<span style="color:black;">-</span>';
    } else {
        bilirubinRisk.innerHTML = '<span style="color:blue;">▼</span>'; // 파란색 세모
    }

    // 알부민
    var albumin = document.getElementById("albumin").innerText;
    var albuminRisk = document.getElementById("albuminRisk");
    if (parseFloat(albumin) > 5.2) {
        albuminRisk.innerHTML = '<span style="color:red;">▲</span>'; // 빨간색 세모
    } else if ( 5.2 >= parseFloat(albumin) && parseFloat(albumin) >= 3.5){
        albuminRisk.innerHTML = '<span style="color:black;">-</span>';
    } else {
        albuminRisk.innerHTML = '<span style="color:blue;">▼</span>'; // 파란색 세모
    }

    // prothrombin time
    var prothrombintime = document.getElementById("prothrombintime").innerText;
    var prothrombintimeRisk = document.getElementById("prothrombintimeRisk");
    if (parseFloat(prothrombintime) > 15.4) {
        prothrombintimeRisk.innerHTML = '<span style="color:red;">▲</span>'; // 빨간색 세모
    } else if ( 15.4 >= parseFloat(prothrombintime) && parseFloat(prothrombintime) >= 11.4){
        prothrombintimeRisk.innerHTML = '<span style="color:black;">-</span>';
    } else {
        prothrombintimeRisk.innerHTML = '<span style="color:blue;">▼</span>'; // 파란색 세모
    }

    // prothrombin time
    var totalprotein = document.getElementById("totalprotein").innerText;
    var totalproteinRisk = document.getElementById("totalproteinRisk");
    if (parseFloat(prothrombintime) > 8.9) {
        totalproteinRisk.innerHTML = '<span style="color:red;">▲</span>'; // 빨간색 세모
    } else if ( 8.9 >= parseFloat(totalprotein) && parseFloat(totalprotein) >= 6.0){
        totalproteinRisk.innerHTML = '<span style="color:black;">-</span>';
    } else {
        totalproteinRisk.innerHTML = '<span style="color:blue;">▼</span>'; // 파란색 세모
    }

    // smoking
    var smoking = document.getElementById("smoking").innerText;
    if (parseInt(smoking) === 1) {
        document.getElementById("smoking").innerText = "흡연"; // 남성
    } else if (parseInt(smoking) === 0) {
        document.getElementById("smoking").innerText = "비흡연"; // 여성
    }

    // drinking
    var drinking = document.getElementById("drinking").innerText;
    if (parseInt(drinking) === 1) {
        document.getElementById("drinking").innerText = "음주"; // 남성
    } else if (parseInt(drinking) === 0) {
        document.getElementById("drinking").innerText = "비음주"; // 여성
    }

    // HbA1c
    var hba1c = document.getElementById("hba1c").innerText;
    var hba1cRisk = document.getElementById("hba1cRisk");
    if (parseFloat(hba1c) > 6.0) {
        hba1cRisk.innerHTML = '<span style="color:red;">▲</span>'; // 빨간색 세모
    } else if ( 6.0 >= parseFloat(hba1c) && parseFloat(hba1c) >= 4.4){
        hba1cRisk.innerHTML = '<span style="color:black;">-</span>';
    } else {
        hba1cRisk.innerHTML = '<span style="color:blue;">▼</span>'; // 파란색 세모
    }

    // WBC Count
    var wbccount = document.getElementById("wbccount").innerText;
    var wbccountRisk = document.getElementById("wbccountRisk");
    if (parseFloat(wbccount) > 9.9) {
        wbccountRisk.innerHTML = '<span style="color:red;">▲</span>'; // 빨간색 세모
    } else if ( 9.9 >= parseFloat(wbccount) && parseFloat(wbccount) >= 4.0){
        wbccountRisk.innerHTML = '<span style="color:black;">-</span>';
    } else {
        wbccountRisk.innerHTML = '<span style="color:blue;">▼</span>'; // 파란색 세모
    }

    // Platelet Count
    var plateletcount = document.getElementById("plateletcount").innerText;
    var plateletcountRisk = document.getElementById("plateletcountRisk");
    if (parseInt(plateletcount) > 449) {
        plateletcountRisk.innerHTML = '<span style="color:red;">▲</span>'; // 빨간색 세모
    } else if ( 449 >= parseInt(plateletcount) && parseInt(plateletcount) >= 150){
        plateletcountRisk.innerHTML = '<span style="color:black;">-</span>';
    } else {
        plateletcountRisk.innerHTML = '<span style="color:blue;">▼</span>'; // 파란색 세모
    }

    // creatinine
    var creatinine = document.getElementById("creatinine").innerText;
    var creatinineRisk = document.getElementById("creatinineRisk");
    if (parseFloat(creatinine) > 1.2) {
        creatinineRisk.innerHTML = '<span style="color:red;">▲</span>'; // 빨간색 세모
    } else if ( 1.2 >= parseFloat(creatinine) && parseFloat(creatinine) >= 0.7){
        creatinineRisk.innerHTML = '<span style="color:black;">-</span>';
    } else {
        creatinineRisk.innerHTML = '<span style="color:blue;">▼</span>'; // 파란색 세모
    }

    // eGFR
    var egfr = document.getElementById("egfr").innerText;
    var egfrRisk = document.getElementById("egfrRisk");
    if (parseInt(egfr) >= 90) {
        egfrRisk.innerHTML = '<span style="color:red;">▲</span>'; // 빨간색 세모
    }  else {
        egfrRisk.innerHTML = '<span style="color:blue;">▼</span>'; // 파란색 세모
    }

    // BUN
    var bun = document.getElementById("bun").innerText;
    var bunRisk = document.getElementById("bunRisk");
    if (parseInt(bun) > 26) {
        bunRisk.innerHTML = '<span style="color:red;">▲</span>'; // 빨간색 세모
    } else if ( 26 >= parseInt(bun) && parseInt(bun) >= 10){
        bunRisk.innerHTML = '<span style="color:black;">-</span>';
    } else {
        bunRisk.innerHTML = '<span style="color:blue;">▼</span>'; // 파란색 세모
    }

    // freeT4
    var freet4 = document.getElementById("freet4").innerText;
    var freet4Risk = document.getElementById("freet4Risk");
    if (parseFloat(freet4) > 1.9) {
        freet4Risk.innerHTML = '<span style="color:red;">▲</span>'; // 빨간색 세모
    } else if ( 1.9 >= parseFloat(freet4) && parseFloat(freet4) >= 1.1){
        freet4Risk.innerHTML = '<span style="color:black;">-</span>';
    } else {
        freet4Risk.innerHTML = '<span style="color:blue;">▼</span>'; // 파란색 세모
    }

    // T3
    var t3 = document.getElementById("t3").innerText;
    var t3Risk = document.getElementById("t3Risk");
    if (parseInt(bun) > 26) {
        t3Risk.innerHTML = '<span style="color:red;">▲</span>'; // 빨간색 세모
    } else if ( 26 >= parseInt(t3) && parseInt(t3) >= 10){
        t3Risk.innerHTML = '<span style="color:black;">-</span>';
    } else {
        t3Risk.innerHTML = '<span style="color:blue;">▼</span>'; // 파란색 세모
    }

    // TSH
    var tsh = document.getElementById("tsh").innerText;
    var tshRisk = document.getElementById("tshRisk");
    if (parseFloat(tsh) >= 3.9) {
        tshRisk.innerHTML = '<span style="color:red;">▲</span>'; // 빨간색 세모
    }  else {
        tshRisk.innerHTML = '<span style="color:blue;">▼</span>'; // 파란색 세모
    }

    // ketone urine
    var ketoneurine = document.getElementById("ketoneurine").innerText;
    var ketoneurineRisk = document.getElementById("ketoneurineRisk");
    if (parseInt(tsh) >= 5) {
        ketoneurineRisk.innerHTML = '<span style="color:red;">▲</span>'; // 빨간색 세모
    }  else {
        ketoneurineRisk.innerHTML = '<span style="color:blue;">▼</span>'; // 파란색 세모
    }

    // pH urine
    var phurine = document.getElementById("phurine").innerText;
    var phurineRisk = document.getElementById("phurineRisk");
    if (parseFloat(phurine) >= 7.9) {
        phurineRisk.innerHTML = '<span style="color:red;">▲</span>'; // 빨간색 세모
    } else if ( 7.9 >= parseFloat(phurine) && parseFloat(phurine) >= 4.0){
        phurineRisk.innerHTML = '<span style="color:black;">-</span>';
    } else {
        phurineRisk.innerHTML = '<span style="color:blue;">▼</span>'; // 파란색 세모
    }

    // FVC
    var fvc = document.getElementById("fvc").innerText;
    var fvcRisk = document.getElementById("fvcRisk");
    if (parseFloat(fvc) >= 4.0) {
        fvcRisk.innerHTML = '<span style="color:red;">▲</span>'; // 빨간색 세모
    } else {
        fvcRisk.innerHTML = '<span style="color:blue;">▼</span>'; // 파란색 세모
    }
    // FEV1
    var fev1 = document.getElementById("fev1").innerText;
    var fev1Risk = document.getElementById("fev1Risk");
    if (parseFloat(fev1) >= 3.2) {
        fev1Risk.innerHTML = '<span style="color:red;">▲</span>'; // 빨간색 세모
    } else {
        fev1Risk.innerHTML = '<span style="color:blue;">▼</span>'; // 파란색 세모
    }
    // FEV1/FVC
    var fev1fvc = document.getElementById("fev1fvc").innerText;
    var fev1fvcRisk = document.getElementById("fev1fvcRisk");
    if (parseFloat(fev1fvc) >= 5.6) {
        fev1fvcRisk.innerHTML = '<span style="color:red;">▲</span>'; // 빨간색 세모
    } else {
        fev1fvcRisk.innerHTML = '<span style="color:blue;">▼</span>'; // 파란색 세모
    }
    // Postbronchdilator test
    var pbdtest = document.getElementById("pbdtest").innerText;
    var pbdtestRisk = document.getElementById("pbdtestRisk");
    if (parseFloat(pbdtest) >= 12.0) {
        pbdtestRisk.innerHTML = '<span style="color:red;">▲</span>'; // 빨간색 세모
    } else {
        pbdtestRisk.innerHTML = '<span style="color:blue;">▼</span>'; // 파란색 세모
    }

}
