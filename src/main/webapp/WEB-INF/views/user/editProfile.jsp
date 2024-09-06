<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>정보 수정</title>
    <style>
        /* 전체 레이아웃 설정 */
        .edit-profile-container {
            width: 85%;
            margin: 20px auto;
            padding: 20px;
            background-color: #f9f9f9;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 1);
        }

        /* 폼 스타일 */
        form {
            display: flex;
            flex-direction: column;
            gap: 15px;
        }

        label {
            font-weight: bold;
            margin-bottom: 5px;
        }

        input[type="text"], input[type="email"], input[type="password"], textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-sizing: border-box;
            font-size: 1.1em;
        }

        textarea {
            resize: vertical;
            height: 100px;
        }

        .btn-submit {
            background-color: #444;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 1.1em;
            transition: background-color 0.3s ease;
        }

        .btn-submit:hover {
            background-color: #333;
        }

        .btn-cancel {
            background-color: #999;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 1.1em;
            text-align: center;
            text-decoration: none;
        }

        .btn-cancel:hover {
            background-color: #777;
        }

        .btn-container {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
        }
    </style>
</head>
<body>

<div class="edit-profile-container">
    <h2>정보 수정</h2>
    <form action="/user/editProfile" method="post">
        <!-- 사용자 이름 -->
        <label for="username">사용자 이름</label>
        <input type="text" id="username" name="username" value="${user.username}" required>
        
        <!-- 이메일 -->
        <label for="email">이메일</label>
        <input type="email" id="email" name="email" value="${user.email}" required>
        
        <!-- 거주 층 -->
        <label for="floor">거주 층</label>
        <input type="text" id="floor" name="floor" value="${user.floor}" required>
        
        <!-- 자기소개 -->
        <label for="bio">자기소개</label>
        <textarea id="bio" name="bio">${user.bio}</textarea>
        
        <!-- 비밀번호 변경 -->
        <label for="pwd">비밀번호</label>
        <input type="password" id="pwd" name="pwd" placeholder="새 비밀번호를 입력하세요 (변경하지 않을 경우 비워두세요)">
        
        <!-- 버튼 컨테이너 -->
        <div class="btn-container">
            <button type="submit" class="btn-submit">저장</button>
            <a href="/user/profile" class="btn-cancel">취소</a>
        </div>
    </form>
</div>

</body>
</html>
