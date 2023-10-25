<%--
  Created by IntelliJ IDEA.
  User: JungSuyoung
  Date: 2023-08-29
  Time: 오후 3:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
  @font-face {
    font-family: Hana2-Medium;
    src: url('<%= request.getContextPath() %>/fonts/Hana2-Medium.ttf');
  }
  body {!important;
    font-family: Hana2-Medium, sans-serif;
    background-color: #fff;
    margin: 0;
  }

  .navbar {!important;
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 10px 50px;
    background-color: #fff;
  }

  .navbar-left {!important;
    display: flex;
    align-items: center;
  }

  .navbar-left img {!important;
    height: 50px;
    margin-right: 15px;
  }

  .navbar-left span {!important;
    font-size: 32px;
  }

  .navbar-center {!important;
    display: flex;
    gap: 30px;
  }

  .navbar-right {!important;
    width: 220px;
    height: 40px;
    display: flex;
    gap: 15px;
  }

  .btn {!important;
    padding: 10px 20px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
  }

  .btn-signup {!important;
    background-color: transparent;
    border: 1px solid #00a39e;
    color: #00a39e;
  }

  .btn-login {!important;
    background-color: #00a39e;
    border: 1px solid #00a39e;
    color: #fff;
  }
</style>
<div class="navbar">
  <div class="navbar-left">
    <a href="${pageContext.request.contextPath}/">
      <img src="${pageContext.request.contextPath}/img/원큐보험로고02.png" alt="원큐보험 로고">
    </a>
  </div>
  <div class="navbar-center">
    <span style="cursor:pointer;" onclick="location.href='${pageContext.request.contextPath}/'">홈</span>
    <span style="cursor:pointer;" onclick="location.href='${pageContext.request.contextPath}/'">원큐보험소개</span>
    <span style="cursor:pointer;" onclick="location.href='${pageContext.request.contextPath}/predict01'">보험 추천</span>
    <span style="cursor:pointer;" onclick="location.href='${pageContext.request.contextPath}/claim01'">보험금 청구</span>
    <span style="cursor:pointer;" onclick="location.href='${pageContext.request.contextPath}/myFamily'">가족 관리</span>
    <span style="cursor:pointer;" onclick="location.href='${pageContext.request.contextPath}/adminLogin'">고객센터</span>
    <span style="cursor:pointer;" onclick="location.href='${pageContext.request.contextPath}/adminLogin'">관리자</span>
  </div>
  <div class="navbar-right">
    <% if (session.getAttribute("loginMember") == null) { %>
    <button class="btn btn-signup" onclick="location.href='${pageContext.request.contextPath}/login'">회원가입</button>
    <button class="btn btn-login" onclick="location.href='${pageContext.request.contextPath}/login'">로그인</button>
    <% } else { %>
    <button class="btn btn-signup" onclick="location.href='${pageContext.request.contextPath}/mypage'">마이페이지</button>
    <form action="${pageContext.request.contextPath}/logout" method="post">
      <button type="submit" class="btn btn-login">
        <span class="skip_info">로그아웃</span>
      </button>
    </form>
    <% } %>
  </div>
</div>

