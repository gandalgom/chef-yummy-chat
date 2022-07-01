import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NewMessage extends StatefulWidget {
  const NewMessage({Key? key}) : super(key: key);

  @override
  State<NewMessage> createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {
  final _controller = TextEditingController();

  var _userInputMessage = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8.0),
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              maxLines: null,
              decoration: const InputDecoration(labelText: 'Send a message...'),
              onChanged: (value) => setState(() => _userInputMessage = value),
            )
          ),
          IconButton(
            onPressed: _userInputMessage.trim().isEmpty ? null
                : () => _sendMessage(context),
            icon: const Icon(Icons.send),
            color: Colors.blue,
          ),
        ],
      ),
    );
  }

  void _sendMessage(BuildContext context) {
    FocusScope.of(context).unfocus();

    FirebaseFirestore.instance.collection('chat').add({
      'userID': FirebaseAuth.instance.currentUser!.uid,
      'text': _userInputMessage,
      'time': Timestamp.now(),
    });

    _controller.clear();
  }
}
