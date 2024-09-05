<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>질문 작성</title>
    <style>
        /* 메인 폼 스타일 */
        form {
            max-width: 800px;
            margin: 0 auto;
            background-color: #f9f9f9;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 1);
        }

        label {
            font-weight: bold;
            margin-top: 10px;
            display: block;
        }

        input[type="text"], textarea {
            width: 100%;
            padding: 10px;
            margin: 10px 0 20px 0;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-sizing: border-box;
        }

        textarea {
            height: 200px;
            resize: vertical;
        }

        /* 제출 버튼 스타일 */
        .btn-submit {
            display: inline-block;
            padding: 10px 20px;
            background-color: #444; /* 일관성 있는 색상 */
            color: white;
            text-decoration: none;
            font-size: 1.1em;
            border-radius: 5px;
            border: none;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .btn-submit:hover {
            background-color: #333; /* hover 상태의 어두운 색상 */
        }

        /* 취소 버튼 스타일 */
        .btn-cancel {
            display: inline-block;
            padding: 10px 20px;
            background-color: #ccc; /* 일관성 있는 중립색 */
            color: black;
            text-decoration: none;
            font-size: 1.1em;
            border-radius: 5px;
            border: none;
            margin-left: 10px;
            cursor: pointer;
        }

        .btn-cancel:hover {
            background-color: #999; /* hover 시 약간 어두운 색상 */
        }

        /* 컨테이너 스타일 */
        .container {
            margin-top: 20px;
            padding: 20px;
        }

        h2 {
            text-align: center;
            color: #444; /* 일관성 있는 헤더 색상 */
        }
    </style>
</head>
<body>

<!-- 메인 컨텐츠 영역 -->
<div class="container">

    <!-- 질문 작성 폼 -->
    <form action="/qna/writeQuestion" method="post">
        <h2>질문 작성하기</h2>

        <label for="title">질문 제목</label>
        <input type="text" id="title" name="title" placeholder="질문 제목을 입력하세요" required>

        <label for="content">질문 내용</label>
        <textarea id="content" name="content" placeholder="질문 내용을 입력하세요" required></textarea>

        <button type="submit" class="btn-submit">질문 제출</button>
        <a href="/qna/questionList" class="btn-cancel">취소</a>
    </form>

</div>

</body>
</html>
