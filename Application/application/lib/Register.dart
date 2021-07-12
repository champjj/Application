import 'package:application/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:application/utility/alertDialogmsg.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Helvetica'),
      home: Registerpage(),
    );
  }
}

class Registerpage extends StatefulWidget {
  @override
  _RegisterpageState createState() => _RegisterpageState();
}

class _RegisterpageState extends State<Registerpage> {
  //////////////  TextController  /////////////////////
  FirebaseAuth _auth = FirebaseAuth.instance;
  String textemail;
  String textpassword;
  String textconfirmpassword;
  String textshopname;
  ////////////////////////////////////////////////////

/////////////////////  Signin   ////////////////////////////////
  Future<void> signinEmail() async {
    await _auth
        .createUserWithEmailAndPassword(
            email: textemail, password: textpassword)
        .then((user) => {
              creatshopname(),
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => Homepage()))
            })
        .catchError((error) => dialogmsg(context, 'Alert!', error));
  }

  Future<void> creatshopname() async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    await firebaseAuth.currentUser().then((res) {
      UserUpdateInfo userUpdateInfo = UserUpdateInfo();
      userUpdateInfo.displayName = textshopname.trim();
      res.updateProfile(userUpdateInfo);
    });
  }
  ////////////////////////////////////////////////////////////////

  @override
  Widget build(BuildContext context) {
    //////////sign with database/////////

    ////////////////////////////////////

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
                    'Sign up',
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
              padding: const EdgeInsets.only(left: 100, right: 100, top: 30),
              child: Container(
                decoration: BoxDecoration(
                    border: Border(
                        bottom:
                            BorderSide(color: Color.fromRGBO(16, 75, 145, 1)))),
                child: TextFormField(
                  onChanged: (value) {
                    textemail = value;
                  },
                  keyboardType: TextInputType.emailAddress,
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
                  obscureText: true,
                  keyboardType: TextInputType.visiblePassword,
                  onChanged: (value) {
                    textpassword = value;
                  },
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Password',
                      icon: Icon(Icons.lock_rounded),
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
                  onChanged: (value) {
                    textconfirmpassword = value;
                  },
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: '  Confirm - Password',
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
                  onChanged: (value) {
                    textshopname = value;
                  },
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Shopname',
                      icon: Icon(Icons.storefront_rounded),
                      hintStyle:
                          TextStyle(color: Colors.grey[400], fontSize: 20)),
                ),
              ),
            ),
            Padding(padding: const EdgeInsets.only(left: 100, right: 100)),
            Padding(
              padding: const EdgeInsets.only(left: 100, right: 100),
              child: Container(
                decoration: BoxDecoration(
                    border: Border(
                        bottom:
                            BorderSide(color: Color.fromRGBO(16, 75, 145, 1)))),
                child: TextFormField(
                  onChanged: (value) {},
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Phone',
                      icon: Icon(Icons.smartphone_rounded),
                      hintStyle:
                          TextStyle(color: Colors.grey[400], fontSize: 20)),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 90, right: 90),
              child: InkWell(
                onTap: () {
                  ////////////  check if Register  ////////////////
                  if ((textemail?.isEmpty ?? true) &&
                      (textpassword.trim()?.isEmpty ?? true)) {
                    dialogmsg(context, 'Empty Field', 'Plese Fill Every Black');
                  } else if (textpassword.trim() !=
                      textconfirmpassword.trim()) {
                    dialogmsg(
                        context, 'Password Confirm', 'Password Not Match');
                  } else if (textpassword.length < 5) {
                    dialogmsg(context, 'Password',
                        'Password must not be less than 6 characters');
                  } else {
                    dialogmsg(context, 'Register Success', 'Success');
                    signinEmail();
                  }
                  ///////////////////////////////////////////////////
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(16, 75, 145, 1),
                      borderRadius: BorderRadius.circular(33)),
                  height: 50,
                  child: Center(
                    child: Text(
                      'Sign up',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
