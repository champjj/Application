// import 'dart:ui';
import 'package:application/Menupage.dart';
import 'package:application/Register.dart';
import 'package:application/utility/alertDialogmsg.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(Myapp());

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Helvetica'),
      home: Homepage(),
    );
  }
}

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String email, password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: MediaQuery.of(context).padding,
              decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(100)),
                  color: Color.fromRGBO(16, 75, 145, 1)),
              height: 140,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 40,
                  ),
                  Text(
                    'Sign in',
                    style: TextStyle(
                        fontFamily: 'Helvetica',
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 100, right: 100, top: 100),
              child: Container(
                decoration: BoxDecoration(
                    border: Border(
                        bottom:
                            BorderSide(color: Color.fromRGBO(16, 75, 145, 1)))),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) => email = value.trim(),
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'E-mail',
                      icon: Icon(Icons.email_rounded),
                      hintStyle:
                          TextStyle(color: Colors.grey[400], fontSize: 20)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 100, right: 100),
              child: Container(
                decoration: BoxDecoration(
                    border: Border(
                        bottom:
                            BorderSide(color: Color.fromRGBO(16, 75, 145, 1)))),
                child: TextFormField(
                  onChanged: (value) => password = value.trim(),
                  obscureText: true,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Password',
                      icon: Icon(Icons.lock_rounded),
                      hintStyle:
                          TextStyle(color: Colors.grey[400], fontSize: 20)),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),

            // button sign in
            Padding(
              padding: const EdgeInsets.only(left: 90, right: 90),
              child: GestureDetector(
                onTap: () {
                  if (email.isNotEmpty ?? true && password.isNotEmpty ?? true) {
                    checkuser();
                  }
                },
                child: Container(
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(16, 75, 145, 1),
                        borderRadius: BorderRadius.circular(33)),
                    height: 50,
                    child: Center(
                      child: Text(
                        'Sign in',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 20),
                      ),
                    )),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegisterPage()));
                  },
                  child: RichText(
                      text: TextSpan(
                          text: 'Click here to ',
                          style: TextStyle(
                            color: Color.fromRGBO(16, 75, 145, 1),
                          ),
                          children: <TextSpan>[
                        TextSpan(
                            text: 'Sign up',
                            style: TextStyle(fontWeight: FontWeight.bold))
                      ])),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

//////////////////////  sing in user  //////////////////////////////////////
  Future<void> checkuser() async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Menupage())))
        .catchError((error) {
      switch (error.code) {
        case "ERROR_WRONG_PASSWORD":
          dialogmsg(context, 'Error Sign in', 'Wrong pasword');
          break;
        case "ERROR_INVALID_EMAIL":
          dialogmsg(
              context, 'Error Sign in', "Email is not correct! Try again");
          break;
        case "ERROR_USER_NOT_FOUND":
          dialogmsg(
              context, 'Error Sign in', "User not found! Register first!");
          break;
        case "ERROR_USER_DISABLED":
          dialogmsg(
              context, 'Error Sign in', "User has been disabled! Try again");
          break;
        case "ERROR_TOO_MANY_REQUESTS":
          dialogmsg(context, 'Error Sign in',
              "Sign in disabled due to too many requests from this user! Try again");
          break;
        case "ERROR_OPERATION_NOT_ALLOWED":
          dialogmsg(context, 'Error Sign in',
              "Operation not allowed! Please enable it in the firebase console");
          break;
        default:
          dialogmsg(context, 'Fail', 'Sign in fail. try again');
      }
    });
  }
  /////////////////////////////////////////////////////////////////////////////
}
