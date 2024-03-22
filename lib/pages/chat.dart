import 'package:chat_app/services/auth/authservice.dart';
import 'package:chat_app/services/chat/chat_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Chat extends StatefulWidget {
  final String receiverEmail;
  final String receiverID;
  final String receiverName;
  Chat(
      {super.key,
      required this.receiverEmail,
      required this.receiverID,
      required this.receiverName});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  final TextEditingController _messageController = TextEditingController();

  final ChatService _chatService = ChatService();

  final AuthService _authService = AuthService();

  //FocusNode myFocusMode = FocusNode();

  void sendMessage() async {
    if (_messageController.text.isNotEmpty) {
      await _chatService.sendMessage(
          widget.receiverID, _messageController.text);
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF553370),
          title: Text(
            widget.receiverName,
            style: TextStyle(fontSize: 22.0, color: Colors.white),
          ),
        ),
        backgroundColor: Color(0xFF553370),
        body: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(12)),
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Expanded(
                child: _buildMessageList(),
              ),
              _buildUserInput(),
            ],
          ),
        ));
  }

  Widget _buildMessageList() {
    String senderID = _authService.getCurrentUser()!.uid;
    return StreamBuilder(
        stream: _chatService.getMessages(widget.receiverID, senderID),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text('ERREURRR');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text('Loading......');
          }
          return ListView(
            children: snapshot.data!.docs
                .map((doc) => _buildMessageItem(doc))
                .toList(),
          );
        });
  }

  Widget _buildMessageItem(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    bool isCurrentUser = data['senderID'] == _authService.getCurrentUser()!.uid;
    var alignment =
        isCurrentUser ? Alignment.centerRight : Alignment.centerLeft;

    return Container(
        margin: EdgeInsets.only(bottom: 5),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: isCurrentUser ? Color(0xFF553370) : Colors.grey,
            borderRadius: BorderRadius.circular(12)),
        alignment: alignment,
        child: Text(
          data['message'],
          style: TextStyle(color: Colors.white, fontSize: 17.0),
        ));
  }

  Widget _buildUserInput() {
    return Row(
      children: [
        Expanded(
          child: Container(
            child: TextField(
              controller: _messageController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                hintText: 'Enter a Message',
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 2),
          decoration: BoxDecoration(
            color: Color(0xFF553370),
            shape: BoxShape.circle,
          ),
          child: IconButton(
            onPressed: sendMessage,
            icon: Icon(
              Icons.arrow_upward,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}
