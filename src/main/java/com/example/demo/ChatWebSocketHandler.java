package com.example.demo;

import com.example.demo.dto.MessageDto;
import com.example.demo.service.CommunityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;
import org.springframework.web.util.UriTemplate;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

public class ChatWebSocketHandler extends TextWebSocketHandler {

    private final Map<String, WebSocketSession> sessions = new ConcurrentHashMap<>();

    @Autowired
    private CommunityService communityService;

    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
        String path = session.getUri().getPath();
        UriTemplate template = new UriTemplate("/ws/chat/{username}");
        Map<String, String> variables = template.match(path);
        String sender = variables.get("username");

        String[] messageParts = message.getPayload().split(":", 2);
        if (messageParts.length < 2) {
            session.sendMessage(new TextMessage("잘못된 메시지 형식입니다. 형식: 대상: 메시지"));
            return;
        }
        String receiver = messageParts[0].trim();
        String content = messageParts[1].trim();

        // 메시지 저장
        MessageDto messageDto = new MessageDto();
        messageDto.setSender(sender);
        messageDto.setReceiver(receiver);
        messageDto.setContent(content);
        messageDto.setMessagetime(String.valueOf(System.currentTimeMillis()));
        communityService.saveMessage(messageDto);

        // 수신자에게 메시지 전송
        WebSocketSession targetSession = sessions.get(receiver);
        if (targetSession != null && targetSession.isOpen()) {
            targetSession.sendMessage(new TextMessage(sender + ": " + content));
        } else {
            session.sendMessage(new TextMessage(receiver + "님이 연결되어 있지 않습니다."));
        }
    }

    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        String path = session.getUri().getPath();
        UriTemplate template = new UriTemplate("/ws/chat/{username}");
        Map<String, String> variables = template.match(path);
        String username = variables.get("username");

        sessions.put(username, session);
        System.out.println(username + "님이 연결되었습니다.");
    }

    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
        String path = session.getUri().getPath();
        UriTemplate template = new UriTemplate("/ws/chat/{username}");
        Map<String, String> variables = template.match(path);
        String username = variables.get("username");

        sessions.remove(username);
        System.out.println(username + "님이 연결이 종료되었습니다.");
    }
}

