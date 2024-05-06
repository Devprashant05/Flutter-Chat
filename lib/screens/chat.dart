import 'package:chat_app/widgets/chat_messages.dart';
import 'package:chat_app/widgets/new_messages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  void _setupPushNotification() async {
    final fcm = FirebaseMessaging.instance;
    await fcm.requestPermission();

    //for group/channel type chatting
    //fcm.subscribeToTopic('chat');

    //for single targeted device
    // final token = await fcm.getToken();
    // print(token);
  }

  @override
  void initState() {
    super.initState();
    _setupPushNotification();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
            },
            icon: Icon(
              Icons.exit_to_app_rounded,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ],
        title: const Text('FlutterChat'),
      ),
      body: const Column(
        children: [
          Expanded(
            child: ChatMessages(),
          ),
          NewMessages(),
        ],
      ),
    );
  }
}
