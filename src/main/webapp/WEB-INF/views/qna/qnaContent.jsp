<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>질문 내용</title>
    <style>
        /* 기본 페이지 설정 */
        html, body {
            height: 100%;
            margin: 0;
            padding: 0;
            overflow-y: auto; /* 페이지 스크롤 활성화 */
        }

        /* 컨테이너 스타일 */
        .content-container {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
            background-color: #f9f9f9;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        /* 질문 정보 스타일 */
        .question-info {
            padding: 20px;
            background-color: #fff;
            margin-bottom: 20px;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-sizing: border-box; /* 테두리 및 패딩을 너비에 포함 */
        }

        .question-info h2 {
            margin-top: 0;
            color: #333;
        }

        .question-info p {
            margin: 10px 0;
        }

        .meta-info {
            font-size: 0.9em;
            color: #555;
        }

        /* 답글 섹션 스타일 */
        .answers-section {
            margin-top: 30px;
        }

        .answer {
            padding: 15px;
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 5px;
            margin-bottom: 15px;
            display: flex;
            justify-content: space-between; /* 답글 내용과 버튼을 양쪽에 배치 */
            align-items: center; /* 내용과 버튼을 수직 중앙 정렬 */
        }

        .answer-content {
            flex: 1;
            margin-right: 10px; /* 버튼과의 간격 조절 */
        }

        .answer p {
            margin: 5px 0;
        }

        .answer .meta-info {
            font-size: 0.8em;
            color: #777;
        }

        /* 삭제 버튼 스타일 */
        .btn-delete {
            background-color: #ff4d4d;
            color: white;
            padding: 5px 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .btn-delete:hover {
            background-color: #ff1a1a;
        }

        /* 답글 작성 폼 스타일 */
        .answer-form {
            margin-top: 30px;
            max-width: 800px;
        }

        .answer-form textarea {
            width: 100%;
            max-width: 800px;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
            resize: vertical;
            box-sizing: border-box; /* 너비에 패딩과 보더 포함 */
        }

        .answer-form button {
            background-color: #444;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .answer-form button:hover {
            background-color: #333;
        }
    </style>
</head>
<body>

<div class="content-container">
    <!-- 질문 정보 출력 -->
    <div class="question-info">
        <h2>${question.title}</h2>
        <p class="meta-info">작성자: ${question.username} | 작성 시간: ${question.questiontime}</p>
        <p>${question.content}</p>
    </div>

    <!-- 답글 섹션 출력 -->
    <div class="answers-section">
        <h3>답글 목록</h3>
        <c:forEach var="answer" items="${answer}">
            <div class="answer">
                <!-- 답글 내용 -->
                <div class="answer-content">
                    <p>${answer.content}</p>
                    <p class="meta-info">
                        작성자: ${answer.username} | 답글 시간: ${answer.answertime}
                    </p>
                </div>
                <!-- 삭제 버튼 -->
                <c:if test="${ answer.username == sessionScope.username }">
                    <form action="/qna/deleteAnswer" method="post" style="display:inline;">
                        <input type="hidden" name="answerId" value="${ answer.id }">
                        <input type="hidden" name="questionId" value="${ question.id }">
                        <button type="submit" class="btn-delete">DELETE</button>
                    </form>
                </c:if>
            </div>
        </c:forEach>
    </div>

    <!-- 답글 작성 폼 -->
    <div class="answer-form">
        <h3>답글 작성하기</h3>
        <form action="/qna/addAnswer" method="post">
            <input type="hidden" name="qid" value="${ question.id }">
            <input type="hidden" name="username" value="${ sessionScope.username }">
            <textarea name="content" placeholder="답글을 입력하세요" required></textarea>
            <button type="submit">답글 제출</button>
        </form>
    </div>
</div>

</body>
</html>
