package com.example.demo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.example.demo.dto.MessageDto;
import com.example.demo.service.CommunityService;
import com.fasterxml.jackson.databind.ObjectMapper;

import java.util.HashMap;
import java.util.Map;
import java.util.Set;
import java.util.HashSet;

@Component
public class ChatWebSocketHandler extends TextWebSocketHandler {

    // 사용자 ID와 WebSocketSession을 매핑하는 맵
    private final Map<String, WebSocketSession> userSessions = new HashMap<>();
    private final Set<WebSocketSession> sessions = new HashSet<>();

    @Autowired
    private CommunityService communityService;

    // WebSocket 연결이 열리면 세션을 추가
    @Override
    public void afterConnectionEstablished(WebSocketSession session ) throws Exception {
        sessions.add(session);
       
    }

    // WebSocket 연결이 닫히면 세션을 제거
    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
        sessions.remove(session);
        userSessions.values().remove(session);  // 세션이 종료되면 사용자 세션 맵에서도 제거
    }

    // 메시지를 수신했을 때 처리하는 메서드
    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
       
    	String payload = message.getPayload();
        ObjectMapper objectMapper = new ObjectMapper();
        Map<String, String> messageData = objectMapper.readValue(payload, Map.class);

        // "register" 타입 메시지를 세션 매핑용으로 처리
        if ("register".equals(messageData.get("mtype"))) {
            String userId = messageData.get("userId");
            userSessions.put(userId, session);  // 사용자 ID와 세션을 매핑
            return;  // 등록 후 추가 처리는 하지 않음
        }

        
        // 일반 메시지 처리
        MessageDto messageDto = objectMapper.readValue(payload, MessageDto.class);

        // 메시지를 DB에 저장
        communityService.saveMessage(messageDto);

        String receiverId = messageDto.getReceiver();
        WebSocketSession receiverSession = userSessions.get(receiverId);

        // 수신자가 접속 중이라면 메시지 전송
        if (receiverSession != null && receiverSession.isOpen()) {
            receiverSession.sendMessage(new TextMessage(objectMapper.writeValueAsString(messageDto)));
        }

        // 발신자에게도 메시지 전송 (본인이 보낸 메시지 확인용)
        session.sendMessage(new TextMessage(objectMapper.writeValueAsString(messageDto)));
    }
}

