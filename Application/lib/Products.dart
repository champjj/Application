import 'package:flutter/material.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(16, 75, 145, 1),
          title: Text(
            'Product',
            style: TextStyle(
              fontFamily: 'Helvetica',
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
        ),
        body: ListView(children: [
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: ListTile(
              title: TextField(
                  style: TextStyle(
                      fontFamily: 'Helvetica',
                      color: Color.fromRGBO(16, 75, 145, 1),
                      fontSize: 20,
                      height: 0.5,
                      fontWeight: FontWeight.bold),
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                          borderSide: BorderSide(
                              color: Color.fromRGBO(16, 75, 145, 1))),
                      hintText: '    Search....',
                      hintStyle: TextStyle(
                          fontFamily: 'Helvetica',
                          color: Colors.grey[400],
                          fontSize: 17,
                          fontWeight: FontWeight.bold))),
              trailing: InkWell(
                child: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, border: Border.all()),
                    margin: EdgeInsets.all(5),
                    width: 30,
                    height: 50,
                    child: Icon(Icons.search_rounded)),
                onTap: () {
                  //TAP EVENT
                },
              ),
            ),
          ),
        ]),
      ),
    );
    // ListView.builder(itemBuilder: itemBuilder)
  }
}
