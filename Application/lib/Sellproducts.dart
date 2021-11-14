import 'package:flutter/material.dart';

class Sellproducts extends StatefulWidget {
  @override
  _SellproductsState createState() => _SellproductsState();
}

class _SellproductsState extends State<Sellproducts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Color.fromRGBO(16, 75, 145, 1),
              ),
              constraints: BoxConstraints.tightForFinite(),
              height: 140,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 50),
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        image: AssetImage('asset/clear.PNG'),
                      )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 50),
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        image: new DecorationImage(
                          image: ExactAssetImage('asset/calculate.PNG'),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
