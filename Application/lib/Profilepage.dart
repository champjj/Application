import 'package:application/Menupage.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Settingpage extends StatefulWidget {
  @override
  _SettingpageState createState() => _SettingpageState();
}

class _SettingpageState extends State<Settingpage> {
  TextEditingController shopname = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Color.fromRGBO(16, 75, 145, 1),
            ),
            constraints: BoxConstraints.tightForFinite(),
            width: 280,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ListView(
                children: [
                  ListTile(
                      //LOGO
                      ),
                  ListTile(
                    leading: Text('Shopname :',
                        style: TextStyle(
                            fontFamily: 'Helvetica',
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold)),
                    title: Container(
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  color: Color.fromRGBO(16, 75, 145, 1)))),
                      child: TextField(
                        controller: shopname,
                        onChanged: (value) {},
                        style: TextStyle(
                            fontFamily: 'Helvetica',
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Shopname',
                            hintStyle: TextStyle(
                                fontFamily: 'Helvetica',
                                color: Colors.grey[400],
                                fontSize: 14,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Text('      Phone : ',
                        style: TextStyle(
                            fontFamily: 'Helvetica',
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold)),
                    title: Container(
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  color: Color.fromRGBO(16, 75, 145, 1)))),
                      child: TextField(
                        onChanged: (value) {},
                        keyboardType: TextInputType.number,
                        style: TextStyle(
                            fontFamily: 'Helvetica',
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Phonenumber',
                            hintStyle: TextStyle(
                                fontFamily: 'Helvetica',
                                color: Colors.grey[400],
                                fontSize: 14,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),

      //FloatingButton Save
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // editusershop();
        },
        child: Icon(
          Icons.save,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
    );
  }

  // Future<Null> editusershop() async {
  //   FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  //   await firebaseAuth.currentUser().then((value) {
  //     UserUpdateInfo userUpdateInfo = UserUpdateInfo();
  //     userUpdateInfo.displayName = shopname.text.trim();
  //     value.updateProfile(userUpdateInfo);
  //     Navigator.pushReplacement(
  //         context, MaterialPageRoute(builder: (context) => Menupage()));
  //   });
  // }
}
