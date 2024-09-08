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

        /* 메뉴 스타일 */
        .menu-item {
            padding: 15px;
            text-align: center;
            cursor: pointer;
            border-bottom: 1px solid #444;
            color: white;
            transition: background-color 0.3s ease;
        }

        .menu-item:hover {
            background-color: #444;
        }

        /* 스크롤 가능한 리스트 */
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
            transition: background-color 0.3s ease;
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

        .message {
            margin-bottom: 10px;
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
            transition: background-color 0.3s ease;
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
        <div class="menu-item" id="residents-btn">주민 리스트</div>
        <div class="menu-item" id="messages-btn">메시지 목록</div>

        <!-- 스크롤 가능한 주민 목록 또는 메시지 목록 -->
        <div class="scrollable-list" id="list-container">
            <ul id="dynamic-list"></ul>
        </div>
    </div>

    <!-- 중앙 채팅 영역 -->
    <div class="chat-main">
        <div class="chat-header">채팅방</div>
        <div class="chat-messages" id="chat-box"></div>
        <div class="chat-input">
            <input type="text" placeholder="메시지를 입력하세요" id="message-input">
            <button type="button" id="send-btn">전송</button>
        </div>
    </div>
</div>

<!-- WebSocket 및 AJAX 스크립트 -->
<script>
    // WebSocket 연결
    var socket = new WebSocket("ws://localhost:8080/ws/chat");

    // WebSocket이 성공적으로 열렸을 때
    socket.onopen = function() {
        console.log("WebSocket 연결 성공");
    };

    // 서버에서 메시지를 받을 때
    socket.onmessage = function(event) {
        var message = event.data;
        appendMessage(message, "user"); // 사용자 메시지 추가
    };

    // 오류 처리
    socket.onerror = function(error) {
        console.error("WebSocket 오류:", error);
    };

    // 연결이 닫혔을 때
    socket.onclose = function() {
        console.log("WebSocket 연결 종료");
    };

    // 메시지 추가 처리 함수
    function appendMessage(message, type) {
        var chatBox = document.getElementById("chat-box");
        var messageElement = document.createElement("div");
        messageElement.classList.add("message", type);
        messageElement.innerHTML = `<p>${message}</p>`;
        chatBox.appendChild(messageElement);

        // 스크롤을 최신 메시지로 이동
        chatBox.scrollTop = chatBox.scrollHeight;
    }

    // 메시지 전송 처리
    document.getElementById("send-btn").addEventListener("click", function() {
        var message = document.getElementById("message-input").value.trim();
        if (message) {
            socket.send(message);
            appendMessage(message, "user"); // 사용자 메시지 추가
            document.getElementById("message-input").value = "";
        }
    });

    // 주민 리스트 요청 (AJAX)
    document.getElementById("residents-btn").addEventListener("click", function() {
        var xhr = new XMLHttpRequest();
        xhr.open("GET", "/residents/list", true); // 서버에서 주민 리스트 가져옴
        xhr.onreadystatechange = function() {
            if (xhr.readyState === 4 && xhr.status === 200) {
                var residents = JSON.parse(xhr.responseText);
                updateList(residents, "resident"); // 리스트 업데이트
            }
        };
        xhr.send();
    });

    // 메시지 목록 요청 (AJAX)
    document.getElementById("messages-btn").addEventListener("click", function() {
        var xhr = new XMLHttpRequest();
        xhr.open("GET", "/api/messages", true); // 서버에서 메시지 목록 가져옴
        xhr.onreadystatechange = function() {
            if (xhr.readyState === 4 && xhr.status === 200) {
                var messages = JSON.parse(xhr.responseText);
                updateList(messages, "message"); // 리스트 업데이트
            }
        };
        xhr.send();
    });

    // 리스트 업데이트 함수
    function updateList(data, type) {
        var listContainer = document.getElementById("dynamic-list");
        listContainer.innerHTML = ""; // 기존 리스트 초기화

        data.forEach(function(item) {
            var li = document.createElement("li");
            li.textContent = type === "resident" ? item.name : item.content;
            li.addEventListener("click", function() {
                if (type === "resident") {
                    appendMessage(`${item.name}님과의 대화를 시작합니다.`, "system"); // 시스템 메시지
                } else if (type === "message") {
                    appendMessage(item.content, "user"); // 사용자가 클릭한 메시지 추가
                }
            });
            listContainer.appendChild(li);
        });
    }
</script>

</body>
</html>
