import 'package:flutter/material.dart';

class Chat extends StatelessWidget {
  final String receiverEmail;
  const Chat({super.key, required this.receiverEmail});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(receiverEmail),
      ),
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
