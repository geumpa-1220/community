<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
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
        text-align: center;
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

    nav h2 {
        margin: 0;
        font-size: 1.5em;
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

    /* 메인 컨테이너 스타일 */
    .container {
        display: flex;
        padding: 20px;
        margin-top: 20px; /* 헤더와 간격 추가 */
    }

    /* 메인 콘텐츠 스타일 */
    main {
        width: 100%; /* 사이드바가 없으므로 100%로 설정 */
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
        position: fixed;
        bottom: 0;
        width: 100%;
    }
</style>

 <sitemesh:write property="head"/>
</head>
<body>

<!-- 헤더 -->
<header>
    <h1>오피스텔 주민 커뮤니티</h1>
</header>

<!-- 네비게이션 바 -->
<nav>
    <div>
        <h2><a href="#">HOME</a></h2>
    </div>
    <c:choose>
       <c:when test="${ not empty sessionScope.username }">
            <div>
                <a href="#">Community</a>
            </div>
            
            <div>
                <a href="#">${ sessionScope.username}님</a>
            </div> 
       </c:when>
       
       <c:otherwise>
            <div>
                 <a href="#">Community</a>
            </div>
    
            <div>
                 <a href="../user/login">Login</a>
                 <a href="../user/signUp">Sign Up</a>
            </div>
       </c:otherwise>
    </c:choose>

</nav>

 
<div class="container">
    
<sitemesh:write property="body"/>

   
    
</div>

<!-- 푸터 -->
<footer>
    <p>&copy; 2024 오피스텔 주민 커뮤니티 </p>
</footer>

</body>
</html>
