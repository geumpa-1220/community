<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>질문 목록</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        table, th, td {
            border: 1px solid #ddd;
        }
        th, td {
            padding: 12px;
            text-align: left;
        }
        th {
            background-color: #444;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        tr:hover {
            background-color: #f1f1f1;
        }

        .btn-write {
            display: inline-block;
            width: 100%;
            max-width: 250px; /* 최대 너비 지정 */
            padding: 15px 20px;
            background-color: #444; /* default.jsp와 일관성 있는 색상 */
            color: white;
            text-align: center;
            text-decoration: none;
            font-size: 1.1em;
            border-radius: 5px;
            margin-bottom: 20px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .btn-write:hover {
            background-color: #333; /* hover 시 일관성 있는 어두운 색상 */
        }

        /* 버튼을 가운데 정렬 */
        .btn-container {
            display: flex;
            justify-content: center;
            margin-bottom: 20px;
        }

        /* 질문 제목 링크 스타일 */
        .question-link {
            color: #007bff; /* 일관성 있는 파란색 */
            text-decoration: none; /* 밑줄 제거 */
            font-weight: bold; /* 굵은 텍스트 */
        }

        /* 링크 hover 시 스타일 */
        .question-link:hover {
            color: #0056b3; /* hover 시 더 어두운 파란색 */
            text-decoration: underline; /* hover 시 밑줄 추가 */
        }

        /* 삭제 버튼 스타일 */
        .btn-delete {
            background-color: #ff4d4d;
            color: white;
            padding: 5px 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            float: right;
            margin-left: 10px;
            font-size: 0.9em;
        }

        .btn-delete:hover {
            background-color: #ff1a1a;
        }

        /* 테이블 내의 삭제 버튼이 오른쪽 끝에 위치하도록 설정 */
        td {
            position: relative;
        }
        td .btn-delete {
            position: absolute;
            right: 10px;
            top: 50%;
            transform: translateY(-50%);
        }
    </style>
</head>
<body>

<!-- 질문 작성 버튼 -->
<div class="btn-container">
    <a href="/qna/writeQuestion" class="btn-write">질문 작성하기</a>
</div>

<!-- 질문 리스트 테이블 -->
<table>
    <thead>
        <tr>
            <th>작성자</th>
            <th>질문</th>
            <th>작성 시간</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="question" items="${qdto}">
            <tr>
                <td>${question.username}</td> <!-- 작성자 필드 -->
                <td>
                    <a href="/qna/qnaContent/${question.id}" class="question-link">${question.title}</a>
                </td>
                <td>
                    ${question.questiontime}
                    <c:if test="${ question.username == sessionScope.username }">
                        <form action="/qna/deleteQuestion" method="post" style="display:inline;">
                            <input type="hidden" name="questionId" value="${ question.id }">
                            <button type="submit" class="btn-delete">DELETE</button>
                        </form>
                    </c:if>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>

</body>
</html>
