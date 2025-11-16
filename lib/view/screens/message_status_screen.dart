import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vouch/constants/app_images.dart';
import 'package:vouch/utils/colors.dart';
import 'package:vouch/view/screens/chat_screen.dart';

class MessageStatusScreen extends StatefulWidget {
  const MessageStatusScreen({super.key});

  @override
  State<MessageStatusScreen> createState() => _MessageStatusScreenState();
}

class _MessageStatusScreenState extends State<MessageStatusScreen> {
  int selectedTabIndex = 0;
  final List<String> tabs = ['All', 'Unread', 'Read'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        title: const Text(
          'Messages',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: tabs.asMap().entries.map((entry) {
                final int index = entry.key;
                final String tab = entry.value;
                final bool isSelected = selectedTabIndex == index;
                
                return Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedTabIndex = index;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: isSelected ? AppColors.primary : Colors.transparent,
                            width: 2,
                          ),
                        ),
                      ),
                      child: Text(
                        tab,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: isSelected ? AppColors.primary : Colors.grey,
                          fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 16),
          // Message limit notification
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.primary.withOpacity(0.3)),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.info_outline,
                  color: AppColors.primary,
                  size: 20,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'You have 5 messages left. Upgrade to send unlimited messages.',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          // Messages list based on selected tab
          Expanded(
            child: _buildMessagesList(),
          ),
        ],
      ),
    );
  }

  Widget _buildMessagesList() {
    // Mock data based on selected tab
    List<MessageItem> messages = [];
    
    switch (selectedTabIndex) {
      case 0: // All
        messages = [
          MessageItem(
            name: 'Beth Kim',
            message: 'Hey! Are you free tonight?',
            time: '9:41',
            avatar: AppImages.profileIcon,
            isOnline: true,
            unreadCount: 2,
            status: MessageStatus.unread,
          ),
          MessageItem(
            name: 'Sarah Jane',
            message: 'Thanks for the wonderful evening!',
            time: '9:41',
            avatar: AppImages.profileIcon,
            isOnline: false,
            unreadCount: 0,
            status: MessageStatus.read,
          ),
        ];
        break;
      case 1: // Unread
        messages = [
          MessageItem(
            name: 'Beth Kim',
            message: 'Hey! Are you free tonight?',
            time: '9:41',
            avatar: AppImages.profileIcon,
            isOnline: true,
            unreadCount: 2,
            status: MessageStatus.unread,
          ),
        ];
        break;
      case 2: // Read
        messages = [
          MessageItem(
            name: 'Sarah Jane',
            message: 'Thanks for the wonderful evening!',
            time: '9:41',
            avatar: AppImages.profileIcon,
            isOnline: false,
            unreadCount: 0,
            status: MessageStatus.read,
          ),
        ];
        break;
    }

    if (messages.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.message_outlined,
              size: 80,
              color: Colors.grey[300],
            ),
            const SizedBox(height: 16),
            Text(
              'No ${tabs[selectedTabIndex].toLowerCase()} messages',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[600],
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Start a conversation with someone!',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[500],
              ),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      itemCount: messages.length,
      itemBuilder: (context, index) {
        return _buildMessageTile(messages[index]);
      },
    );
  }

  Widget _buildMessageTile(MessageItem message) {
    return InkWell(
      onTap: () {
        Get.to(() => ChatScreen(
          conversationId: message.name.toLowerCase().replaceAll(' ', '_'),
          userName: message.name,
          userAvatar: message.avatar,
          isOnline: message.isOnline,
        ));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            // Avatar with online indicator
            Stack(
              children: [
                CircleAvatar(
                  radius: 28,
                  backgroundImage: AssetImage(message.avatar),
                ),
                if (message.isOnline)
                  Positioned(
                    bottom: 2,
                    right: 2,
                    child: Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        color: const Color(0xFF4CAF50),
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(width: 12),
            // Message content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        message.name,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: message.status == MessageStatus.unread 
                              ? FontWeight.w700 
                              : FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            message.time,
                            style: TextStyle(
                              fontSize: 12,
                              color: message.status == MessageStatus.unread 
                                  ? AppColors.primary 
                                  : Colors.grey,
                              fontWeight: message.status == MessageStatus.unread 
                                  ? FontWeight.w600 
                                  : FontWeight.normal,
                            ),
                          ),
                          if (message.status == MessageStatus.read)
                            const SizedBox(width: 8),
                          if (message.status == MessageStatus.read)
                            Icon(
                              Icons.done_all,
                              size: 16,
                              color: AppColors.primary,
                            ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          message.message,
                          style: TextStyle(
                            fontSize: 14,
                            color: message.status == MessageStatus.unread 
                                ? Colors.black87 
                                : Colors.grey,
                            fontWeight: message.status == MessageStatus.unread 
                                ? FontWeight.w500 
                                : FontWeight.normal,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      if (message.unreadCount > 0)
                        Container(
                          padding: const EdgeInsets.all(6),
                          decoration: const BoxDecoration(
                            color: AppColors.primary,
                            shape: BoxShape.circle,
                          ),
                          child: Text(
                            message.unreadCount.toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MessageItem {
  final String name;
  final String message;
  final String time;
  final String avatar;
  final bool isOnline;
  final int unreadCount;
  final MessageStatus status;

  MessageItem({
    required this.name,
    required this.message,
    required this.time,
    required this.avatar,
    required this.isOnline,
    required this.unreadCount,
    required this.status,
  });
}

enum MessageStatus {
  read,
  unread,
  sent,
  delivered,
}