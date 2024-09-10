<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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

        .chat-container {
            display: flex;
            height: 70vh;
            background-color: #f9f9f9;
        }

        .sidebar {
            width: 250px;
            background-color: #333;
            color: white;
            display: flex;
            flex-direction: column;
        }

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
        .message.user {
           text-align: right;
           background-color: #d4edda;
           padding: 10px;
           border-radius: 10px;
           margin: 5px 0;
       }

        .message.other {
          text-align: left;
          background-color: #f8d7da;
          padding: 10px;
          border-radius: 10px;
          margin: 5px 0;
}
        
    </style>
</head>
<body>

<div class="chat-container">
    <div class="sidebar">
        <div class="menu-item" id="residents-btn">주민 리스트</div>
        <div class="menu-item" id="messages-btn">채팅방 목록</div>

        <div class="scrollable-list" id="list-container">
            <ul id="dynamic-list"></ul>
        </div>
    </div>

    <div class="chat-main">
        <div class="chat-header" id="chat-header">채팅방</div>
        <div class="chat-messages" id="chat-box"></div>
        <div class="chat-input">
            <input type="text" placeholder="메시지를 입력하세요" id="message-input">
            <button type="button" id="send-btn">전송</button>
        </div>
    </div>
</div>

<script>
    // WebSocket 객체를 선언합니다.
    let socket;
    let chatUser = null;  // 현재 대화 중인 사용자

    // 페이지가 로드되면 WebSocket 연결을 설정합니다.
    window.onload = function () {
        // WebSocket 서버와 연결을 설정합니다.
        socket = new WebSocket("ws://localhost:8080/chat");

        // 연결이 열렸을 때 호출되는 이벤트 핸들러
        socket.onopen = function (event) {
            console.log("WebSocket 연결이 열렸습니다.");
        };

        // WebSocket 연결이 닫혔을 때 호출되는 이벤트 핸들러
        socket.onclose = function (event) {
            console.log("WebSocket 연결이 닫혔습니다.");
        };

        // 오류가 발생했을 때 호출되는 이벤트 핸들러
        socket.onerror = function (event) {
            console.error("WebSocket 오류가 발생했습니다:", event);
        };

        // 전송 버튼을 클릭하면 메시지를 서버로 전송합니다.
        document.getElementById("send-btn").addEventListener("click", function () {
            const messageInput = document.getElementById("message-input");
            const message = messageInput.value;
            if (message && chatUser) {
                const payload = JSON.stringify({
                    to: chatUser.id, // 대화 상대방 ID
                    message: message
                });
                socket.send(payload);  // WebSocket을 통해 서버로 메시지 전송
                messageInput.value = "";  // 입력 필드 초기화
            }
        });

     // 서버로부터 메시지를 받았을 때 호출되는 이벤트 핸들러
        socket.onmessage = function (event) {
            const chatBox = document.getElementById("chat-box");
            const receivedMessage = JSON.parse(event.data);

            // 서버에서 받은 메시지는 상대방이 보낸 것이므로 바로 출력
            const message = document.createElement("div");
            message.className = "message other";  // 상대방의 메시지
            message.innerText = receivedMessage.message;
            chatBox.appendChild(message);

            chatBox.scrollTop = chatBox.scrollHeight;  // 스크롤을 최신 메시지로 이동
        };


    // 클라이언트에서 API 호출하여 주민 리스트 출력
    document.getElementById("residents-btn").addEventListener("click", function () {
        fetch("/userlist")
            .then(response => response.json())
            .then(users => {
                const listContainer = document.getElementById("dynamic-list");
                listContainer.innerHTML = "";  // 기존 리스트 초기화

                users.forEach(user => {
                    const listItem = document.createElement("li");
                    listItem.innerText = user.username;  // 사용자 이름 출력

                    // 사용자 클릭 시 채팅방으로 연결하는 로직 추가
                    listItem.addEventListener("click", function () {
                        chatUser = user;
                        document.getElementById("chat-header").innerText = chatUser.username;

                        // 이전 채팅 기록 불러오기
                        const userId = "${sessionScope.id}";
                        fetch(`/chat/messages/${chatUser.id}?userId=${userId}`)
                            .then(response => response.json())
                            .then(messages => {
                                const chatBox = document.getElementById("chat-box");
                                chatBox.innerHTML = "";  // 기존 메시지 초기화

                                messages.forEach(message => {
                                    const messageDiv = document.createElement("div");
                                    // 발신자가 사용자인지 상대방인지에 따라 다른 스타일 적용
                                    messageDiv.className = message.sender === userId ? "message user" : "message other";
                                    messageDiv.innerText = message.text;  // 저장된 메시지 출력
                                    chatBox.appendChild(messageDiv);
                                });

                                chatBox.scrollTop = chatBox.scrollHeight;  // 스크롤을 최신 메시지로 이동
                            })
                            .catch(error => console.error("Error fetching chat history:", error));
                    });
                    listContainer.appendChild(listItem);
                });
            })
            .catch(error => console.error("Error fetching users:", error));
    });
</script>


</body>
</html>
