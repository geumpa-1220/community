<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>실시간 채팅</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        /* 전체 레이아웃 */
        .chat-container {
            display: flex;
            height: 70vh;
            background-color: #f9f9f9;
        }

        /* 사이드바 */
        .sidebar {
            width: 250px;
            background-color: #333;
            color: white;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }

        /* 주민 리스트와 메시지 목록 버튼 스타일 */
        .sidebar .menu-item {
            padding: 15px;
            text-align: center;
            cursor: pointer;
            border-bottom: 1px solid #444;
            color: white;
        }

        .sidebar .menu-item:hover {
            background-color: #444;
        }

        /* 사이드바의 스크롤 가능한 리스트 */
        .scrollable-list {
            flex: 1;
            overflow-y: auto;
        }

        .scrollable-list ul {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .scrollable-list li {
            padding: 10px;
            border-bottom: 1px solid #555;
            cursor: pointer;
        }

        .scrollable-list li:hover {
            background-color: #444;
        }

        /* 메인 채팅 영역 */
        .chat-main {
            flex: 1;
            display: flex;
            flex-direction: column;
            background-color: white;
        }

        .chat-header {
            padding: 15px;
            background-color: #444;
            color: white;
            text-align: center;
        }

        .chat-messages {
            flex: 1;
            padding: 15px;
            overflow-y: auto;
            background-color: #f1f1f1;
        }

        .chat-messages .message {
            margin-bottom: 10px;
        }

        .chat-messages .message p {
            margin: 0;
        }

        .message.user {
            text-align: right;
        }

        .message.system {
            text-align: center;
            color: #888;
        }

        /* 채팅 입력 영역 */
        .chat-input {
            display: flex;
            padding: 10px;
            background-color: #f1f1f1;
            border-top: 1px solid #ddd;
        }

        .chat-input input {
            flex: 1;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 1em;
        }

        .chat-input button {
            margin-left: 10px;
            padding: 10px 20px;
            background-color: #444;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .chat-input button:hover {
            background-color: #333;
        }
    </style>
</head>
<body>

<div class="chat-container">
    <!-- 왼쪽 사이드바 -->
    <div class="sidebar">
        <div class="menu-item" id="residents-btn">
            주민 리스트
        </div>
        <div class="menu-item" id="messages-btn">
            메시지 목록
        </div>

        <!-- 스크롤 가능한 주민 목록 또는 메시지 목록 -->
        <div class="scrollable-list" id="list-container">
            <!-- 주민 리스트 또는 메시지가 여기에 표시됩니다. -->
            <ul id="dynamic-list">
                <!-- 주민 리스트 또는 메시지가 표시될 공간 -->
            </ul>
        </div>
    </div>

    <!-- 중앙 채팅 영역 -->
    <div class="chat-main">
        <div class="chat-header">
            채팅방
        </div>
        <div class="chat-messages" id="chat-box">
            <!-- 채팅 메시지가 여기에 표시됩니다. -->
        </div>
        <div class="chat-input">
            <input type="text" placeholder="메시지를 입력하세요" id="message-input">
            <button type="button" id="send-btn">전송</button>
        </div>
    </div>
</div>

<!-- WebSocket 스크립트 -->
<script>
    var socket = new WebSocket("ws://localhost:8080/ws/chat");

    socket.onopen = function() {
        console.log("연결 성공");
    };

    socket.onmessage = function(event) {
        var message = event.data;
        var chatBox = document.getElementById("chat-box");
        var messageElement = document.createElement("div");
        messageElement.classList.add("message", "user");
        messageElement.innerHTML = '<p>' + message + '</p>';
        chatBox.appendChild(messageElement);
    };

    socket.onclose = function(event) {
        console.log("연결 종료");
    };

    socket.onerror = function(error) {
        console.log("오류 발생: " + error.message);
    };

    document.getElementById("send-btn").addEventListener("click", function() {
        var message = document.getElementById("message-input").value;
        if (message.trim() !== "") {
            socket.send(message);
            document.getElementById("message-input").value = "";
        }
    });
</script>

</body>
</html>
