import 'package:application/Addproduct.dart';
import 'package:application/Products.dart';
import 'package:application/Report.dart';
import 'package:application/Sellproducts.dart';
import 'package:application/Profilepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:floating_action_bubble/floating_action_bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'main.dart';

class Menupage extends StatefulWidget {
  @override
  _MenupageState createState() => _MenupageState();
}

class _MenupageState extends State<Menupage> with TickerProviderStateMixin {
  Animation<double> _animation;
  AnimationController _animationController;

  String usershopname = 'Loading';
  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 150),
    );

    final curvedAnimation =
        CurvedAnimation(curve: Curves.easeInOut, parent: _animationController);
    _animation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);

    super.initState();
    displayshop();
  }

  Future<void> displayshop() async {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Color.fromRGBO(16, 75, 145, 1),
              ),
              constraints: BoxConstraints.tightForFinite(),
              width: 280,

              //ListViewMenu
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: ListTile(
                      title: Center(
                          child: Icon(Icons.supervised_user_circle_rounded,
                              color: Colors.white)),
                      subtitle: Center(
                          child: Text(
                        'Shop: $usershopname',
                        style: TextStyle(
                            fontFamily: 'Helvetica',
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                            color: Colors.white),
                      )),
                    ),
                  ),
                  ListTile(
                    leading: Image.asset('asset/sellproduct.png'),
                    title: Text(
                      '      Sell Products',
                      style: TextStyle(
                          fontFamily: 'Helvetica',
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          color: Colors.white),
                    ),
                    trailing: Icon(
                      Icons.keyboard_arrow_right_outlined,
                      color: Colors.white,
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Sellproducts()));
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ListTile(
                    leading: Image.asset('asset/product.png'),
                    title: Text(
                      '    Products',
                      style: TextStyle(
                          fontFamily: 'Helvetica',
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          color: Colors.white),
                    ),
                    trailing: Icon(
                      Icons.keyboard_arrow_right_outlined,
                      color: Colors.white,
                    ),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Products()));
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ListTile(
                    leading: Image.asset('asset/addproduct.png'),
                    title: Text(
                      ' Add Products',
                      style: TextStyle(
                          fontFamily: 'Helvetica',
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          color: Colors.white),
                    ),
                    trailing: Icon(
                      Icons.keyboard_arrow_right_outlined,
                      color: Colors.white,
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Addproduct()));
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ListTile(
                    leading: Image.asset('asset/report.png'),
                    title: Text(
                      '     Report',
                      style: TextStyle(
                          fontFamily: 'Helvetica',
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          color: Colors.white),
                    ),
                    trailing: Icon(
                      Icons.keyboard_arrow_right_outlined,
                      color: Colors.white,
                    ),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Report()));
                    },
                  ),
                ],
              ),
            ),
          ],
        ),

        //floatingButtonControll
        //Menu in button
        // floatingActionButtonLocation: FloatingActionButtonLocation.,
        floatingActionButton: FloatingActionBubble(
          items: <Bubble>[
            Bubble(
              title: "Profile",
              iconColor: Colors.white,
              bubbleColor: Colors.blue,
              icon: Icons.settings,
              titleStyle: TextStyle(
                  fontFamily: 'Helvetica',
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  color: Colors.white),
              onPress: () {
                _animationController.reverse();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Settingpage()));
              },
            ),
            Bubble(
              title: "Log out",
              iconColor: Colors.white,
              bubbleColor: Colors.blue,
              icon: Icons.logout,
              titleStyle: TextStyle(
                  fontFamily: 'Helvetica',
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  color: Colors.white),
              onPress: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => Homepage()));
                _animationController.reverse();
              },
            ),
          ],
          animation: _animation,
          onPress: _animationController.isCompleted
              ? _animationController.reverse
              : _animationController.forward,
          iconColor: Colors.blue,
          animatedIconData: AnimatedIcons.menu_close,
          backGroundColor: null,
        ),
      ),
    );
  }
}
