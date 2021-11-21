import 'package:application/Menupage.dart';
import 'package:application/Register.dart';
import 'package:application/utility/alertDialogmsg.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  await WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((res) => runApp(const Myapp()));
}

class Myapp extends StatelessWidget {
  const Myapp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Helvetica'),
      home: const Homepage(),
    );
  }
}

class Homepage extends StatefulWidget {
  const Homepage({Key key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  final Future<FirebaseApp> firebase = Firebase.initializeApp();

  String textId, textPassword, textShopname, textPhone;

  CollectionReference database = FirebaseFirestore.instance.collection('users');
  //////////////////////  Login user  //////////////////////////////////////

  Future<void> onCheckDuplicateUser(String idUser, String password) async {
    await database
        .where('idUser', isEqualTo: idUser)
        .where('password', isEqualTo: password)
        .get()
        .then((value) => {
              print(value.size),
              if (value.size == 0)
                {
                  dialogmsgok(
                      context, 'Sign in fail', 'ID or Password is Wrong')
                }
              else if (value.size == 1)
                {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => Menupage())),
                }
            });
  }

  /////////////////////////////////////////////////////////////////////////////

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
                        padding: const EdgeInsets.only(
                            left: 100, right: 100, top: 100),
                        child: Container(
                          decoration: const BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: Color.fromRGBO(16, 75, 145, 1)))),
                          child: TextFormField(
                            onChanged: (value) => textId = value.trim(),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Enter ID';
                              }
                              return null;
                            },
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
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Enter Password';
                              }
                              return null;
                            },
                            onChanged: (value) => textPassword = value.trim(),
                            obscureText: true,
                            keyboardType: TextInputType.visiblePassword,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Password',
                                icon: const Icon(Icons.lock_rounded),
                                hintStyle: TextStyle(
                                    color: Colors.grey[400], fontSize: 20)),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),

                      // button sign in
                      Padding(
                        padding: const EdgeInsets.only(left: 90, right: 90),
                        child: GestureDetector(
                          onTap: () {
                            if (_formkey.currentState.validate()) {
                              onCheckDuplicateUser(textId, textPassword);
                            }
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                  color: const Color.fromRGBO(16, 75, 145, 1),
                                  borderRadius: BorderRadius.circular(33)),
                              height: 50,
                              child: const Center(
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
                      const SizedBox(
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
                                      builder: (context) =>
                                          const RegisterPage()));
                            },
                            child: RichText(
                                text: const TextSpan(
                                    text: 'Click here to ',
                                    style: TextStyle(
                                      color: Color.fromRGBO(16, 75, 145, 1),
                                    ),
                                    children: <TextSpan>[
                                  TextSpan(
                                      text: 'Sign up',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold))
                                ])),
                          )
                        ],
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
