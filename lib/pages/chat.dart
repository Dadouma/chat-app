import 'package:flutter/material.dart';

class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF553370),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 80, horizontal: 10),
        decoration: BoxDecoration(color: Colors.white),
        height: MediaQuery.of(context).size.height / 1.15,
        width: MediaQuery.of(context).size.width,
      ),
    );
  }
}
