<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>사용자 프로필</title>
    <style>
        /* 프로필 전체 레이아웃 */
        .profile-container {
            width: 85%;
            margin: 20px auto;
            padding: 20px;
            background-color: #f9f9f9;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 1);
        }

        /* 사용자 정보 스타일 */
        .profile-header {
            text-align: center;
            margin-bottom: 20px;
        }

        .profile-header h1 {
            font-size: 2em;
            margin: 10px 0;
        }

        .profile-info {
            font-size: 1.1em;
            color: #555;
            margin-bottom: 20px;
        }

        /* 버튼 스타일 */
        .btn {
            padding: 10px 20px;
            margin: 10px 0;
            color: white;
            background-color: #444;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
            display: inline-block;
        }

        .btn:hover {
            background-color: #333;
        }

        .btn-container {
            text-align: center;
            margin-bottom: 20px;
        }

        /* 질문 및 답글 목록 스타일 */
        .section {
            margin-bottom: 30px;
        }

        .section h2 {
            margin-bottom: 10px;
            color: #333;
        }

        .question-list, .answer-list {
            list-style-type: none;
            padding: 0;
        }

        .question-list li, .answer-list li {
            padding: 10px;
            margin-bottom: 5px;
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        .question-list li:hover, .answer-list li:hover {
            background-color: #f1f1f1;
        }

        .question-list a, .answer-list a {
            text-decoration: none;
            color: #007bff;
        }

        .question-list a:hover, .answer-list a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

<div class="profile-container">
    <!-- 사용자 정보 -->
    <div class="profile-header">
        <h1>${user.username}님</h1>
        <p>${user.bio}</p> <!-- 간단한 자기소개 -->
    </div>

    <!-- 기본 정보 -->
    <div class="profile-info">
        <p><strong>이메일:</strong> ${user.email}</p>
        <p><strong>거주 층:</strong> ${user.floor}층</p>
        <p><strong>가입일자:</strong> ${user.usertime}</p>
    </div>

    <!-- 정보 수정 및 비밀번호 변경 버튼 -->
    <div class="btn-container">
        <a href="/user/editProfile" class="btn">정보 수정</a>
        <a href="/user/changePassword" class="btn">비밀번호 변경</a>
    </div>

    <!-- 내가 작성한 질문 목록 -->
    <div class="section">
        <h2>내가 작성한 질문 목록</h2>
        <ul class="question-list">
            <c:forEach var="question" items="${user.questions}">
                <li>
                    <a href="/qna/qnaContent/${question.id}">${question.title}</a>
                </li>
            </c:forEach>
        </ul>
    </div>

    <!-- 내가 답변한 질문 목록 -->
    <div class="section">
        <h2>내가 답변한 질문 목록</h2>
        <ul class="answer-list">
            <c:forEach var="answer" items="${user.answers}">
                <li>
                    <a href="/qna/qnaContent/${answer.questionId}">질문: ${answer.questionTitle}</a> <br>
                    답변: ${answer.content}
                </li>
            </c:forEach>
        </ul>
    </div>
</div>

</body>
</html>
