import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          height: MediaQuery.of(context).size.height / 3.0,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(0xFF7f30fe), Color(0xFF6380fb)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
            borderRadius: BorderRadius.vertical(
                bottom: Radius.elliptical(
                    MediaQuery.of(context).size.width, 105.00)),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 100.0),
          child: Center(
            child: Column(
              children: [
                Text(
                  'Sign In',
                  style: TextStyle(
                      color: Color.fromARGB(255, 212, 206, 255),
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'Log In to your account',
                  style: TextStyle(
                    color: Color(0xFFbbb0ff),
                    fontSize: 18.0,
                  ),
                ),
                Container(
                  margin:
                      EdgeInsets.symmetric(vertical: 50.0, horizontal: 20.0),
                  child: Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 30.0, horizontal: 20.0),
                      height: MediaQuery.of(context).size.height / 2.0,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 255, 255, 255),
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10.0),
                            Text(
                              'Email',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 10.0),
                            Container(
                              child: TextField(
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.mail_outline,
                                    color: Color(0xFF7f30fe),
                                  ),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  hintText: 'Enter an Email',
                                ),
                              ),
                            ),
                            SizedBox(height: 10.0),
                            Text(
                              'Password',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 10.0),
                            Container(
                              child: TextField(
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.password,
                                    color: Color(0xFF7f30fe),
                                  ),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  hintText: 'Enter a Password',
                                ),
                                obscureText: true,
                              ),
                            ),
                            SizedBox(height: 20.0),
                            Container(
                              alignment: Alignment.bottomRight,
                              child: Text(
                                'Forgot password?',
                                style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            Center(
                              child: Container(
                                width: 150,
                                child: Material(
                                  elevation: 5.0,
                                  child: Center(
                                    child: Container(
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Color(0xFF7f30fe)),
                                      child: Center(
                                        child: Text(
                                          "SignIn",
                                          style: TextStyle(
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ]),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: TextStyle(fontSize: 16.0),
                    ),
                    Text(
                      ' Sign Up Now!',
                      style:
                          TextStyle(color: Color(0xFF7f30fe), fontSize: 16.0),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ]),
    );
  }
}