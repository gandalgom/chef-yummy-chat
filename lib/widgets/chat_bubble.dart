import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble(this.message, this.isMine, {Key? key}) : super(key: key);

  final String message;
  final bool isMine;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isMine
          ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: isMine ? Colors.grey[300] : Colors.blue,
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(12.0),
              topRight: const Radius.circular(12.0),
              bottomRight: isMine
                  ? const Radius.circular(0) : const Radius.circular(12.0),
              bottomLeft: isMine
                  ? const Radius.circular(12.0) : const Radius.circular(0),
            ),
          ),
          width: 160.0,
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
          margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
          child: Text(
            message,
            style: TextStyle(color: isMine ? Colors.black : Colors.white),
          ),
        ),
      ],
    );
  }
}
