import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_8.dart';

class ChatBubbles extends StatelessWidget {
  const ChatBubbles(
    this.userName,
    this.message,
    this.isMine,
    {Key? key}
  ) : super(key: key);

  final String userName;
  final String message;
  final bool isMine;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isMine
          ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        if (isMine)
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 5.0, 0),
          child: ChatBubble(
            clipper: ChatBubbleClipper8(type: BubbleType.sendBubble),
            alignment: Alignment.topRight,
            margin: const EdgeInsets.only(top: 20.0),
            backGroundColor: Colors.blue,
            child: Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.7,
              ),
              child: Text(
                message,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
        if (!isMine)
        Padding(
          padding: const EdgeInsets.fromLTRB(5.0, 0, 0, 0),
          child: ChatBubble(
            clipper: ChatBubbleClipper8(type: BubbleType.receiverBubble),
            backGroundColor: const Color(0xffE7E7ED),
            margin: const EdgeInsets.only(top: 20),
            child: Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.7,
              ),
              child: Text(
                message,
                style: const TextStyle(color: Colors.black),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
