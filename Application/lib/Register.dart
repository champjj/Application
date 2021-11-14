import 'package:application/Database/registerUser.dart';
import 'package:application/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  //////////////  TextController  /////////////////////
  FirebaseAuth _auth = FirebaseAuth.instance;
  String textId;
  String textpassword;
  String textconfirmpassword;
  String textshopname;
  String textphone;
  ////////////////////////////////////////////////////

/////////////////////  Signin   //////////////////////////////////

  onCheckDuplicateUser(String idUser) async {
    final UserData = FirebaseFirestore.instance.collection('user').doc(idUser);
    await UserData.get().then((value) => {
          if (value['idUser'] == idUser)
            {dialogmsgok(context, 'Register fail', 'ID user is already used')}
          else
            {
              register()
                  .registerUser(textId, textpassword, textshopname, textphone),
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => Myapp()))
            }
        });
  }

  ////////////////////////////////////////////////////////////////

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
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
                          bottom: BorderSide(
                              color: Color.fromRGBO(16, 75, 145, 1)))),
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter ID';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      textId = value;
                    },
                    // keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'ID',
                        icon: Icon(Icons.person),
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
                          bottom: BorderSide(
                              color: Color.fromRGBO(16, 75, 145, 1)))),
                  child: TextFormField(
                    obscureText: true,
                    keyboardType: TextInputType.visiblePassword,
                    validator: (value) {
                      if (value.length < 6) {
                        return 'Enter Password more than 5 character';
                      }
                      return null;
                    },
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
                          bottom: BorderSide(
                              color: Color.fromRGBO(16, 75, 145, 1)))),
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter Confire password';
                      } else if (value != textpassword) {
                        return "password Don't match";
                      }
                      return null;
                    },
                    onChanged: (value) {
                      textconfirmpassword = value;
                    },
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Confirm-Password',
                        icon: Icon(Icons.verified_rounded),
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
                          bottom: BorderSide(
                              color: Color.fromRGBO(16, 75, 145, 1)))),
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter shopname';
                      }
                      return null;
                    },
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
                          bottom: BorderSide(
                              color: Color.fromRGBO(16, 75, 145, 1)))),
                  child: TextFormField(
                    onChanged: (value) {
                      textphone = value;
                    },
                    keyboardType: TextInputType.phone,
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
                    //////////// Register ////////////////
                    if (!_formkey.currentState.validate()) {
                      return;
                    } else {
                      onCheckDuplicateUser(textId);
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
      ),
    );
  }
}
