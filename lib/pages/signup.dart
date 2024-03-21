import 'package:chat_app/services/auth/authservice.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SignUp extends StatelessWidget {
  final void Function()? onTap;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
  final TextEditingController _confirmpwController = TextEditingController();
  SignUp({super.key, required this.onTap});

  void register(BuildContext context) {
    final _auth = AuthService();
    if (_pwController.text == _confirmpwController.text) {
      try {
        _auth.signUpWithEmailPassword(
            _emailController.text, _pwController.text);
      } catch (e) {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text(e.toString()),
                ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Stack(children: [
          Container(
            height: MediaQuery.of(context).size.height / 4.0,
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
            padding: EdgeInsets.only(top: 70.0),
            child: Center(
              child: Column(
                children: [
                  Text(
                    'Sign Up',
                    style: TextStyle(
                        color: Color.fromARGB(255, 212, 206, 255),
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Create an account',
                    style: TextStyle(
                      color: Color(0xFFbbb0ff),
                      fontSize: 18.0,
                    ),
                  ),
                  Container(
                    margin:
                        EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),
                    child: Material(
                      elevation: 5.0,
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 30.0, horizontal: 20.0),
                        height: MediaQuery.of(context).size.height / 1.45,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 255, 255, 255),
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 10.0),
                              Text(
                                'Name',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 10.0),
                              Container(
                                child: TextField(
                                  controller: _nameController,
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.add_moderator_outlined,
                                      color: Color(0xFF7f30fe),
                                    ),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                    hintText: 'Enter a name',
                                  ),
                                ),
                              ),
                              SizedBox(height: 10.0),
                              Text(
                                'Email',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 10.0),
                              Container(
                                child: TextField(
                                  controller: _emailController,
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.email_outlined,
                                      color: Color(0xFF7f30fe),
                                    ),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                    hintText: 'Enter an email',
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
                                  obscureText: true,
                                  controller: _pwController,
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.password,
                                      color: Color(0xFF7f30fe),
                                    ),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                    hintText: 'Enter a password',
                                  ),
                                ),
                              ),
                              SizedBox(height: 10.0),
                              Text(
                                'Confirm your password',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 10.0),
                              Container(
                                child: TextField(
                                  obscureText: true,
                                  controller: _confirmpwController,
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.password,
                                      color: Color(0xFF7f30fe),
                                    ),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                    hintText: 'Confirm the password',
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              Center(
                                child: Container(
                                  width: 150,
                                  child: Material(
                                    elevation: 5.0,
                                    child: Center(
                                      child: GestureDetector(
                                        onTap: () => register(context),
                                        child: Container(
                                          padding: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: Color(0xFF7f30fe)),
                                          child: Center(
                                            child: Text(
                                              "Sign Up",
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
                                ),
                              ),
                            ]),
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account?",
                        style: TextStyle(fontSize: 16.0),
                      ),
                      GestureDetector(
                        onTap: onTap,
                        child: Text(
                          ' Sign In Now!',
                          style: TextStyle(
                              color: Color(0xFF7f30fe), fontSize: 16.0),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
