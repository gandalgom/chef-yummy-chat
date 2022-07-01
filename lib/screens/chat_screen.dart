import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
      body: StreamBuilder(
        builder: (BuildContext context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          final docs = snapshot.data!.docs;
          return ListView.builder(
            itemCount: docs.length,
            itemBuilder: (context, index) => Container(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                docs[index]['text'],
                style: const TextStyle(fontSize: 20.0),
              ),
            ),
          );
        },
        stream: FirebaseFirestore.instance
            .collection('/chats/6of9E1Lp8yPUwYT0KwEm/message')
            .snapshots(),
      )
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
