<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/default.css" />
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/common.css" />
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/content.css" />
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/button.css" />
    <style>
        #login_box .signup_btn {background:#00a39e; border:0;  border-radius:50px; width:100%; height:52px; line-height:52px; font-size:16px; color:#fff; text-align:center; margin:0px 0 10px;}
        @font-face {
            font-family: Hana2-Medium;
            src: url('<%= request.getContextPath() %>/fonts/Hana2-Medium.ttf');
        }
        body {
            font-family: Hana2-Medium, sans-serif;
            background-color: #fff;
            margin: 0;
        }
    </style>
</head>

<body>
<div id="login_wrap">
    <div id="login_box" >
        <div class="login_con">
            <div class="login_tit">
                <h2>빠르게 한번에</h2>
                <p><i>원큐</i>보험</p>
            </div>
            <div class="login_input">
                <form id="loginForm" onsubmit="return false;" autocomplete="off">
                    <ul>
                        <li>
                            <label for="name" class="skip_info">이름</label>
                            <input type="text" id="name" name="name" placeholder="이름" title="이름" />
                        </li>
                        <li>
                            <label for="loginId" class="skip_info">휴대전화번호</label>
                            <input type="text" id="loginId" name="loginId" placeholder="휴대전화번호 : -없이 입력" title="휴대전화번호" />
                        </li>
                        <li>
                            <label for="password" class="skip_info">주민등록번호</label>
                            <input type="password" id="password" name="password"  placeholder="주민등록번호 : -없이 입력" title="주민등록번호"/>
                        </li>
                    </ul>
                    <button type="button" onclick="login();" class="login_btn">로그인</button>
                    <button type="button" onclick="openSignupPopup();" class="signup_btn">회원가입</button>
                </form>
            </div>
        </div>
    </div>
</div>

    <!--/* 회원가입 popup */-->
    <div id="signupPopup" class="popLayer">
        <h3>회원가입</h3>
        <div class="pop_container">
            <form id="signupForm" onsubmit="return false;" autocomplete="off">
                <table class="tb tb_row tl">
                    <colgroup>
                        <col style="width:30%;" /><col style="width:70%;" />
                    </colgroup>
                    <tbody>
                    <tr>
                        <th scope="row">이름<span class="es">필수 입력</span></th>
                        <td><input type="text" name="name" placeholder="이름" maxlength="10" /></td>
                    </tr>
                    <tr>
                        <th scope="row">휴대전화번호<span class="es">필수 입력</span></th>
                        <td>
                            <input type="text" name="loginId" placeholder="휴대전화번호" maxlength="20" style="width: 80%;" />
                            <button type="button" id="idCheckBtn" class="btns btn_st5" onclick="checkLoginId();" style="width: 20%; float: right;">중복 확인</button>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row">주민등록번호<span class="es">필수 입력</span></th>
                        <td><input type="password" name="password" placeholder="주민등록번호" maxlength="30" /></td>
                    </tr>
                    <tr>
                        <th scope="row">주민등록번호 재입력<span class="es">필수 입력</span></th>
                        <td><input type="password" name="passwordCheck" placeholder="주민등록번호 재입력" maxlength="30" /></td>
                    </tr>
                    <tr>
                        <th scope="row">이메일<span class="es">필수 입력</span></th>
                        <td><input type="text" name="user_email" placeholder="ex) jsy8315@naver.com" /></td>
                    </tr>
                    <tr>
                        <th scope="row">계좌번호<span class="es">필수 입력</span></th>
                        <td><input type="text" name="user_account" placeholder="-없이 계좌번호 입력" /></td>
                    </tr>
                    </tbody>
                </table>
            </form>
            <p class="btn_set">
                <button type="button" class="btns btn_st2" onclick="saveMember();">가입</button>
                <button type="button" class="btns btn_bdr2" onclick="closeSignupPopup();">취소</button>
            </p>
        </div>
        <button type="button" class="btn_close" onclick="closeSignupPopup();"><span><i class="far fa-times-circle"></i></span></button>
    </div>

<script src="${pageContext.request.contextPath}/js/function.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script src="${pageContext.request.contextPath}/js/common.js"></script>
<script src="https://kit.fontawesome.com/79613ae794.js" crossorigin="anonymous"></script>
<script>

    // Enter 로그인 이벤트 바인딩
    window.onload = () => {
        document.querySelectorAll('#loginId, #password').forEach(element => {
            element.addEventListener('keyup', (e) => {
                if (e.keyCode === 13) {
                    login();
                }
            })
        })
    }


    // 로그인
    function login() {

        const form = document.getElementById('loginForm');

        if ( !form.loginId.value || !form.password.value ) {
            alert('이름, 휴대전화번호, 주민등록번호를 입력해주세요.');
            form.loginId.focus();
            return false;
        }

        $.ajax({
            url : '/login',
            type : 'POST',
            dataType : 'json',
            data : {
                loginId: form.loginId.value,
                password: form.password.value
            },
            async : false,
            success : function (response) {
                location.href = "${pageContext.request.contextPath}/";
            },
            error : function (request, status, error) {
                alert('이름, 휴대전화번호, 주민등록번호를 입력해주세요.');
            }
        })
    }


    // 회원가입 팝업 open
    function openSignupPopup() {
        layerPop('signupPopup')
    }


    // 회원가입 팝업 close
    function closeSignupPopup() {
        const form = document.getElementById('signupForm');
        form.loginId.readOnly = false;
        form.querySelector('#idCheckBtn').disabled = false;
        form.reset();
        layerPopClose();
    }


    // 아이디 중복 체크
    function checkLoginId() {
        const loginId = document.querySelector('#signupForm input[name="loginId"]');
        isValid(loginId, '아이디');
        const count = getJson(`/member-count`, { loginId : loginId.value });

        if (count > 0) {
            alert('이미 가입된 아이디가 있습니다.');
            loginId.focus();
            return false;
        }

        if (confirm('사용 가능한 아이디입니다.\n입력하신 아이디로 결정하시겠어요?')) {
            loginId.readOnly = true;
            document.getElementById('idCheckBtn').disabled = true;
        }
    }


    // 회원 정보 유효성 검사
    function validationMemberInfo(form) {

        const fields = form.querySelectorAll('input:not([type="radio"])');
        const fieldNames = ['아이디', '비밀번호', '비밀번호 재입력', '이름'];

        for (let i = 0, len = fields.length; i < len; i++) {
            isValid(fields[i], fieldNames[i]);
        }

        if (form.loginId.readOnly === false) {
            alert('아이디 중복 체크를 완료해 주세요.');
            throw new Error();
        }

        if (form.password.value !== form.passwordCheck.value) {
            alert('비밀번호가 일치하지 않습니다.');
            form.passwordCheck.focus();
            throw new Error();
        }
    }


    // 회원 정보 저장 (회원가입)
    function saveMember() {

        // 1. 필드 유효성 검사
        const form = document.getElementById('signupForm');
        validationMemberInfo(form);

        // 2. 파라미터 세팅
        const params = {}
        new FormData(form).forEach((value, key) => params[key] = value.trim());
        //params.birthday = params.birthday.replace(/(\d{4})(\d{2})(\d{2})/g, '$1-$2-$3');

        // 3. Save API 호출
        callApi('/members', 'post', params);
        alert('가입을 축하드립니다!\n로그인 후 서비스를 이용해 주세요.');
        closeSignupPopup();
    }



    </script>
</body>
</html>

