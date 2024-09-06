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

        /* 프로필 헤더 스타일 */
        .profile-header {
            text-align: center;
            margin-bottom: 20px;
        }

        .profile-header h1 {
            font-size: 2.5em;
            color: #333;
            margin-bottom: 20px;
        }

        /* 자기소개 섹션 스타일 */
        .bio-container {
            padding: 20px;
            background-color: #f1f1f1;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 1);
            margin-bottom: 20px;
            text-align: left;
        }

        .bio-title {
            font-size: 1.5em;
            color: #333;
            font-weight: bold;
            margin-bottom: 10px;
        }

        .bio-text {
            font-size: 1.2em;
            color: #555;
            line-height: 1.6;
            padding: 10px;
            border-left: 4px solid #007bff;
            background-color: #fff;
            border-radius: 5px;
        }

        .bio-form {
            display: flex;
            justify-content: center;
            gap: 10px; /* 입력 필드와 버튼 사이 간격 */
        }

        .bio-input {
            padding: 10px;
            font-size: 1.1em;
            width: 300px;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-sizing: border-box;
        }

        .btn-save {
            background-color: #444;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 1.1em;
            transition: background-color 0.3s ease;
        }

        .btn-save:hover {
            background-color: #333;
        }

        /* 사용자 정보 스타일 */
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
            width: 100%;  /* 버튼을 길쭉하게 */
            max-width: 400px;  /* 최대 너비를 지정 */
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

        <div class="bio-section">
            <!-- 사용자가 자기소개를 입력하지 않았을 때 -->
            <c:if test="${empty user.bio}">
                <div class="bio-container">
                    <p class="bio-title">자기소개</p>
                    <p class="bio-text">아직 자기소개를 안했어요.......</p>
                </div>
            </c:if>

            <!-- 사용자의 자기소개가 있을 때 -->
            <c:if test="${!empty user.bio}">
                <div class="bio-container">
                    <p class="bio-title">자기소개</p>
                    <p class="bio-text">${user.bio}</p>
                </div>
            </c:if>
        </div>
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
    </div>

    <!-- 내가 작성한 질문 목록 -->
    <div class="section">
        <h2>내가 작성한 질문 목록</h2>
        <ul class="question-list">
            <c:choose>
                <c:when test="${empty question}">
                    <li>작성한 질문이 없습니다.</li>
                </c:when>
                <c:otherwise>
                    <c:forEach var="qList" items="${question}">
                        <li>
                            <a href="/qna/qnaContent/${qList.id}">${qList.title}</a>
                        </li>
                    </c:forEach>
                </c:otherwise>
            </c:choose>
        </ul>
    </div>

    <!-- 내가 답변한 질문 목록 -->
    <div class="section">
        <h2>내가 답변한 질문 목록</h2>
        <ul class="answer-list">
            <c:choose>
                <c:when test="${empty answer}">
                    <li>답변한 질문이 없습니다.</li>
                </c:when>
                <c:otherwise>
                    <c:forEach var="answer" items="${answer}">
                        <li>
                            <a href="/qna/qnaContent/${answer.qid}"> 답변: ${answer.content}</a> <br> 
                        </li>
                    </c:forEach>
                </c:otherwise>
            </c:choose>
        </ul>
    </div>
</div>

</body>
</html>
