import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  final _authentication = FirebaseAuth.instance;

  User? currentUser;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat screen'),
        actions: [
          IconButton(
            onPressed: () {
              _authentication.signOut();
              Navigator.pop(context);
            },
            icon: const Icon(Icons.exit_to_app_sharp, color: Colors.white),
          ),
        ],
      ),
      body: Center(
        child: Text(currentUser != null
          ? '${currentUser?.email} 님 반갑습니다'
          : 'Chat screen'
        ),
      ),
    );
  }

  void getCurrentUser() {
    try {
      User? user = _authentication.currentUser;
      if (user != null) {
        currentUser = user;
      }
    } on Exception catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString()))
      );
    }
  }
}