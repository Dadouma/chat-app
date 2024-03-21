import 'package:chat_app/pages/chat.dart';
import 'package:chat_app/services/auth/authservice.dart';
import 'package:chat_app/services/chat/chat_service.dart';
import 'package:flutter/material.dart';

import '../components/user_tile.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void logout() {
    final _auth = AuthService();
    _auth.signOut();
  }

  final _chatService = ChatService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF553370),
      appBar: AppBar(
        title: Text(
          "Home",
          style: TextStyle(
              color: Colors.white, fontSize: 25.0, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
              onPressed: logout,
              icon: Icon(
                Icons.logout,
                color: Colors.white,
              ))
        ],
        backgroundColor: Color(0xFF553370),
      ),
      body: _buildUserList(),
    );
  }

  Widget _buildUserList() {
    return StreamBuilder(
      stream: _chatService.getUsersStream(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text("Error f laabed mon frere");
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("loading...");
        }
        return ListView(
          children: snapshot.data!
              .map<Widget>(
                (userdata) => _buildUserListItem(userdata, context),
              )
              .toList(),
        );
      },
    );
  }

  Widget _buildUserListItem(
      Map<String, dynamic> userData, BuildContext context) {
    return UserTile(
      text: userData["email"],
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Chat(
                      receiverEmail: userData["email"],
                    )));
      },
    );
  }
}
