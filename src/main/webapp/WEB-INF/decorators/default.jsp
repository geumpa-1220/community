<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오피스텔 주민 커뮤니티</title>
<style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    /* 헤더 스타일 */
    header {
        background-color: #333;
        color: white;
        padding: 10px 20px;
    }

    /* 네비게이션 바 스타일 */
    nav {
        background-color: #444;
        color: white;
        padding: 10px 20px;
        display: flex;
        justify-content: space-between;
        align-items: center;
    }

    nav a {
        color: white;
        margin: 0 10px;
        text-decoration: none;
        font-size: 1em;
    }

    nav div {
        display: flex;
        align-items: center;
    }

    nav h1 a {
        color: white;
        text-decoration: none;
    }

    /* 메인 컨테이너 스타일 */
    .container {
        display: flex;
        flex-direction: column;
        padding: 20px;
        margin-top: 20px; /* 헤더와의 간격 추가 */
    }

    /* 메인 콘텐츠 스타일 */
    main {
        width: 100%;
        padding: 20px;
        background-color: #f9f9f9;
        border-radius: 5px;
    }

    /* 푸터 스타일 */
    footer {
    background-color: #333;
    color: white;
    text-align: center;
    padding: 10px;
    width: 100%;
  }

</style>

<sitemesh:write property="head"/>
</head>
<body>

<!-- 헤더 -->
<header>
    <nav>
        <c:choose>
            <c:when test="${ not empty sessionScope.username }">
                <div>
                    <a href="#">COMMUNITY</a>
                    <a href="/qna/questionList">Q&A</a>
                </div>
                <div>
                    <h1><a href="/">  우리 오피스텔 주민 커뮤니티  </a></h1>
                </div>
                <div>
                    <a href="/user/profile">${ sessionScope.username}님</a> |
                    <a href="/logout">LOG OUT</a>
                </div>
            </c:when>
            <c:otherwise>
                <div>
                    <a href="/user/login">COMMUNITY</a>
                    <a href="/user/login">Q&A</a>
                </div>
                <div>
                    <h1><a href="/">오피스텔 주민 커뮤니티</a></h1>
                </div>
                <div>
                    <a href="/user/login">Login</a> |
                    <a href="/user/signUp">Sign Up</a>
                </div>
            </c:otherwise>
        </c:choose>
    </nav>
</header>

<!-- 메인 컨텐츠 -->
<div class="container">
    <sitemesh:write property="body"/>
</div>

<!-- 푸터 -->
<footer>
    <p>&copy; 2024 오피스텔 주민 커뮤니티</p>
</footer>

</body>
</html>
