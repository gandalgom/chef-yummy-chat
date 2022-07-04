import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../widgets/chat_bubble.dart';

class Messages extends StatelessWidget {
  const Messages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('chat')
          .orderBy('time', descending: true)
          .snapshots(),
      builder: (context,
          AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        final chatDocs = snapshot.data!.docs;
        final user = FirebaseAuth.instance.currentUser;

        return ListView.builder(
          itemCount: chatDocs.length,
          itemBuilder: (context, index) =>
              ChatBubbles(
                chatDocs[index]['userName'],
                chatDocs[index]['text'],
                chatDocs[index]['avatar'],
                chatDocs[index]['userID'].toString() == user!.uid,
              ),
          reverse: true,
        );
      },
    );
  }
}
