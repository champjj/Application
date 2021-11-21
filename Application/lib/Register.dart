import 'package:application/Database/registerUser.dart';
import 'package:application/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:application/utility/alertDialogmsg.dart';
import 'package:form_field_validator/form_field_validator.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key key}) : super(key: key);

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

  final Future<FirebaseApp> firebase = Firebase.initializeApp();

  //////////////  TextController  /////////////////////
  String textId;
  String textpassword;
  String textconfirmpassword;
  String textshopname;
  String textphone;
  ////////////////////////////////////////////////////

  CollectionReference database = FirebaseFirestore.instance.collection('users');

  Future<void> onCheckDuplicateUser(String idUser, String textId,
      String textpassword, String textshopname, String textphone) async {
    await database.where('idUser', isEqualTo: idUser).get().then((value) => {
          print(value.size),
          if (value.size > 0)
            {dialogmsgok(context, 'Register fail', 'ID user is already used')}
          else if (value.size == 0)
            {
              register()
                  .registerUser(textId, textpassword, textshopname, textphone),
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const Myapp())),
            }
        });
  }

  ////////////////////////////////////////////////////////////////

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: firebase,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Scaffold(
              body: Text('has problem try again \n ${snapshot.error}'),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            return Scaffold(
              body: SingleChildScrollView(
                child: Form(
                  key: _formkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: MediaQuery.of(context).padding,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(100)),
                            color: Color.fromRGBO(16, 75, 145, 1)),
                        height: 140,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
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
                        padding: const EdgeInsets.only(
                            left: 100, right: 100, top: 30),
                        child: Container(
                          decoration: const BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: Color.fromRGBO(16, 75, 145, 1)))),
                          child: TextFormField(
                            validator: RequiredValidator(errorText: 'Enter ID'),
                            onChanged: (value) {
                              textId = value;
                            },
                            // keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'ID',
                                icon: const Icon(Icons.person),
                                hintStyle: TextStyle(
                                    color: Colors.grey[400], fontSize: 20)),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 100, right: 100),
                        child: Container(
                          decoration: const BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: Color.fromRGBO(16, 75, 145, 1)))),
                          child: TextFormField(
                            obscureText: true,
                            keyboardType: TextInputType.visiblePassword,
                            validator: LengthRangeValidator(
                                min: 5,
                                max: 30,
                                errorText: 'Password should more than 5 char'),
                            onChanged: (value) {
                              textpassword = value;
                            },
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Password',
                                icon: const Icon(Icons.lock_rounded),
                                hintStyle: TextStyle(
                                    color: Colors.grey[400], fontSize: 20)),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 100, right: 100),
                        child: Container(
                          decoration: const BoxDecoration(
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
                                icon: const Icon(Icons.verified_rounded),
                                hintStyle: TextStyle(
                                    color: Colors.grey[400], fontSize: 20)),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 100, right: 100),
                        child: Container(
                          decoration: const BoxDecoration(
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
                                icon: const Icon(Icons.storefront_rounded),
                                hintStyle: TextStyle(
                                    color: Colors.grey[400], fontSize: 20)),
                          ),
                        ),
                      ),
                      const Padding(
                          padding: EdgeInsets.only(left: 100, right: 100)),
                      Padding(
                        padding: const EdgeInsets.only(left: 100, right: 100),
                        child: Container(
                          decoration: const BoxDecoration(
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
                                icon: const Icon(Icons.smartphone_rounded),
                                hintStyle: TextStyle(
                                    color: Colors.grey[400], fontSize: 20)),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 90, right: 90),
                        child: InkWell(
                          onTap: () {
                            //////////// Register ////////////////
                            if (_formkey.currentState.validate()) {
                              onCheckDuplicateUser(textId, textId, textpassword,
                                  textshopname, textphone);
                            }
                            ///////////////////////////////////////////////////
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: const Color.fromRGBO(16, 75, 145, 1),
                                borderRadius: BorderRadius.circular(33)),
                            height: 50,
                            child: const Center(
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
                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        });
  }
}
