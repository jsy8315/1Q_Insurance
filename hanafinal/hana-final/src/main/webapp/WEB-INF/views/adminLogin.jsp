<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리자 로그인</title>
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
        #login_box {
            height: 350px;
            /* 기존 스타일들 */
        }
        body {
            font-family: Hana2-Medium, sans-serif;
            background-color: #fff;
            margin: 0;
        }
    </style>
</head>
</head>
<body>
<div id="login_wrap">
    <div id="login_box" >
        <div class="login_con">
            <div class="login_tit">
                <h2>빠르게 한번에</h2>
                <p><i>원큐</i>보험</p>
                <h2>관리자 로그인</h2>
            </div>
            <div class="login_input">
                    <ul>
                        <li>
                            <label for="adminid" class="skip_info">관리자 아이디</label>
                            <input type="text" id="adminid" name="adminid" placeholder="관리자 아이디 입력" title="아이디" />
                        </li>
                        <li>
                            <label for="adminpw" class="skip_info">비밀번호</label>
                            <input type="password" id="adminpw" name="adminpw"  placeholder="관리자 비밀번호 입력" title="비밀번호"/>
                        </li>
                    </ul>
                    <button type="button" onclick="window.location.href='<%= request.getContextPath() %>/adminHome'" class="login_btn">관리자 로그인</button>
                    <button type="button" onclick="openSignupPopup();" class="signup_btn">관리자 등록</button>
            </div>
        </div>
    </div>
</div>
</body>
</html>
