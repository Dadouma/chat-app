import 'package:chat_app/auth/authservice.dart';
import 'package:flutter/material.dart';

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
      body: Container(
        child: Container(
          margin: EdgeInsets.only(top: 5, left: 15, right: 15),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 30),
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10))),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(60),
                            child: Image(
                              image: AssetImage('assets/anis.jpg'),
                              width: 70,
                              height: 70,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 10.0,
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Anis Hammouda',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 20.0),
                                  ),
                                  SizedBox(
                                    width: 60.0,
                                  ),
                                  Text(
                                    '16:30',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black45),
                                  ),
                                ],
                              ),
                              Text(
                                'ahla b sahbi day!',
                                style: TextStyle(
                                    fontSize: 16.0, color: Colors.black45),
                              )
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(60),
                            child: Image(
                              image: AssetImage('assets/rjiba.jpg'),
                              width: 70,
                              height: 70,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 10.0,
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Ahmed Rjiba',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 20.0),
                                  ),
                                  SizedBox(
                                    width: 60.0,
                                  ),
                                  Text(
                                    '16:30',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black45),
                                  ),
                                ],
                              ),
                              Text(
                                'ahla b sahbi day!',
                                style: TextStyle(
                                    fontSize: 16.0, color: Colors.black45),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
