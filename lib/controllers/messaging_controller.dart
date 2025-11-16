import 'package:get/get.dart';
import 'package:vouch/constants/app_images.dart';

class MessagingController extends GetxController {
  var conversations = <ConversationModel>[].obs;
  var currentChatMessages = <MessageModel>[].obs;
  var isTyping = false.obs;

  @override
  void onInit() {
    super.onInit();
    _initializeConversations();
  }

  void _initializeConversations() {
    conversations.addAll([
      ConversationModel(
        id: '1',
        userName: 'Beth Kim',
        userAvatar: AppImages.profileIcon,
        lastMessage: 'Message description here...',
        lastMessageTime: '04:12 PM',
        isOnline: true,
        unreadCount: 2,
        isMessageRead: false,
      ),
      ConversationModel(
        id: '2',
        userName: 'Sarah Jane',
        userAvatar: AppImages.profileIcon,
        lastMessage: 'Message description here...',
        lastMessageTime: '04:12 PM',
        isOnline: true,
        unreadCount: 0,
        isMessageRead: true,
      ),
    ]);
  }

  void sendMessage(String conversationId, String message) {
    if (message.trim().isEmpty) return;

    final newMessage = MessageModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      senderId: 'me',
      message: message.trim(),
      timestamp: DateTime.now(),
      isRead: false,
      messageType: MessageType.text,
    );

    currentChatMessages.add(newMessage);
    
    // Update conversation last message
    final conversationIndex = conversations.indexWhere((c) => c.id == conversationId);
    if (conversationIndex != -1) {
      conversations[conversationIndex] = conversations[conversationIndex].copyWith(
        lastMessage: message.trim(),
        lastMessageTime: _formatTime(DateTime.now()),
        isMessageRead: true,
      );
    }
  }

  void markMessagesAsRead(String conversationId) {
    final conversationIndex = conversations.indexWhere((c) => c.id == conversationId);
    if (conversationIndex != -1) {
      conversations[conversationIndex] = conversations[conversationIndex].copyWith(
        unreadCount: 0,
        isMessageRead: true,
      );
    }
  }

  void loadChatMessages(String conversationId) {
    // Simulate loading messages for a conversation
    currentChatMessages.clear();
    currentChatMessages.addAll([
      MessageModel(
        id: '1',
        senderId: conversationId,
        message: 'Hello! How are you?',
        timestamp: DateTime.now().subtract(const Duration(minutes: 30)),
        isRead: true,
        messageType: MessageType.text,
      ),
      MessageModel(
        id: '2',
        senderId: 'me',
        message: 'Hi! I\'m doing great, thanks for asking!',
        timestamp: DateTime.now().subtract(const Duration(minutes: 25)),
        isRead: true,
        messageType: MessageType.text,
      ),
      MessageModel(
        id: '3',
        senderId: conversationId,
        message: 'That\'s wonderful to hear!',
        timestamp: DateTime.now().subtract(const Duration(minutes: 20)),
        isRead: true,
        messageType: MessageType.text,
      ),
    ]);
  }

  String _formatTime(DateTime dateTime) {
    final hour = dateTime.hour > 12 ? dateTime.hour - 12 : dateTime.hour;
    final minute = dateTime.minute.toString().padLeft(2, '0');
    final period = dateTime.hour >= 12 ? 'PM' : 'AM';
    return '$hour:$minute $period';
  }
}

class ConversationModel {
  final String id;
  final String userName;
  final String userAvatar;
  final String lastMessage;
  final String lastMessageTime;
  final bool isOnline;
  final int unreadCount;
  final bool isMessageRead;

  ConversationModel({
    required this.id,
    required this.userName,
    required this.userAvatar,
    required this.lastMessage,
    required this.lastMessageTime,
    required this.isOnline,
    required this.unreadCount,
    required this.isMessageRead,
  });

  ConversationModel copyWith({
    String? id,
    String? userName,
    String? userAvatar,
    String? lastMessage,
    String? lastMessageTime,
    bool? isOnline,
    int? unreadCount,
    bool? isMessageRead,
  }) {
    return ConversationModel(
      id: id ?? this.id,
      userName: userName ?? this.userName,
      userAvatar: userAvatar ?? this.userAvatar,
      lastMessage: lastMessage ?? this.lastMessage,
      lastMessageTime: lastMessageTime ?? this.lastMessageTime,
      isOnline: isOnline ?? this.isOnline,
      unreadCount: unreadCount ?? this.unreadCount,
      isMessageRead: isMessageRead ?? this.isMessageRead,
    );
  }
}

class MessageModel {
  final String id;
  final String senderId;
  final String message;
  final DateTime timestamp;
  final bool isRead;
  final MessageType messageType;
  final String? imageUrl;
  final String? voiceUrl;

  MessageModel({
    required this.id,
    required this.senderId,
    required this.message,
    required this.timestamp,
    required this.isRead,
    required this.messageType,
    this.imageUrl,
    this.voiceUrl,
  });
}

enum MessageType {
  text,
  image,
  voice,
  location,
}