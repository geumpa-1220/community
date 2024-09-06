<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login - 오피스텔 주민 커뮤니티</title>
<style>
    /* 메인 컨테이너 스타일 */
    .container {
        display: flex;
        justify-content: center;
        align-items: center;
        padding: 20px;
        margin-top: 20px;
        height: 80vh; /* 화면 높이의 80%로 설정 */
    }

    /* 로그인 폼 스타일 */
    .login-form {
        width: 300px;
        padding: 20px;
        background-color: #f9f9f9;
        border-radius: 5px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 1);
    }

    .login-form h2 {
        text-align: center;
        margin-bottom: 20px;
    }

    .login-form input[type="text"],
    .login-form input[type="password"] {
        width: 100%;
        padding: 10px;
        margin-bottom: 15px;
        border: 1px solid #ddd;
        border-radius: 5px;
        box-sizing: border-box;
    }

    .login-form input[type="submit"] {
        width: 100%;
        padding: 10px;
        background-color: #333;
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        font-size: 1em;
    }

    .login-form input[type="submit"]:hover {
        background-color: #444;
    }
     #error{
        color:red;
    }
</style>

</head>
<body>

<!-- 메인 컨텐츠 -->
<div class="container">
    <div class="login-form">
        <h2>Login</h2>
        <form action="../user/login" method="post" >
            <input type="text" name="userid" placeholder="UserId" required>
            <input type="password" name="pwd" placeholder="Password" required>
            <input type="submit" value="Login">
        </form>
        
        <c:if test="${ not empty error }">
             <div id="error">${ error }</div>
        </c:if>
        
    </div>
</div>

</body>
</html>
