import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Editproduct extends StatefulWidget {
  @override
  _EditproductState createState() => _EditproductState();
}

class _EditproductState extends State<Editproduct> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(16, 75, 145, 1),
          title: Text(
            'Add Product',
            style: TextStyle(
              fontFamily: 'Helvetica',
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
          child: ListView(
            children: [
              ListTile(
                leading: Icon(
                  Icons.description_outlined,
                  size: 30,
                ),
                title: TextField(
                    style: TextStyle(
                        fontFamily: 'Helvetica',
                        color: Color.fromRGBO(16, 75, 145, 1),
                        fontSize: 15,
                        height: 0.5,
                        fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100),
                            borderSide: BorderSide(
                                color: Color.fromRGBO(16, 75, 145, 1))),
                        hintText: '    Product ID',
                        hintStyle: TextStyle(
                            fontFamily: 'Helvetica',
                            color: Colors.grey[400],
                            fontSize: 17,
                            fontWeight: FontWeight.bold))),
              ),
              SizedBox(height: 15),
              ListTile(
                leading: Icon(
                  Icons.qr_code_outlined,
                  size: 30,
                ),
                title: TextField(
                    onChanged: (value) {},
                    style: TextStyle(
                        fontFamily: 'Helvetica',
                        color: Color.fromRGBO(16, 75, 145, 1),
                        fontSize: 15,
                        height: 0.5,
                        fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100),
                            borderSide: BorderSide(
                                color: Color.fromRGBO(16, 75, 145, 1))),
                        hintText: '    Barcode ID',
                        hintStyle: TextStyle(
                            fontFamily: 'Helvetica',
                            color: Colors.grey[400],
                            fontSize: 17,
                            fontWeight: FontWeight.bold))),
                trailing: InkWell(
                  child: Image.asset(
                    'asset/scan barcode.png',
                    scale: 30,
                  ),
                  onTap: () {
                    //Tap Event
                  },
                ),
              ),
              SizedBox(height: 15),
              ListTile(
                leading: Icon(
                  Icons.drive_file_rename_outline,
                  size: 30,
                ),
                title: TextField(
                    onChanged: (value) {},
                    style: TextStyle(
                        fontFamily: 'Helvetica',
                        color: Color.fromRGBO(16, 75, 145, 1),
                        fontSize: 15,
                        height: 0.5,
                        fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100),
                            borderSide: BorderSide(
                                color: Color.fromRGBO(16, 75, 145, 1))),
                        hintText: '    Product Name',
                        hintStyle: TextStyle(
                            fontFamily: 'Helvetica',
                            color: Colors.grey[400],
                            fontSize: 17,
                            fontWeight: FontWeight.bold))),
              ),
              SizedBox(height: 15),
              ListTile(
                leading: Icon(
                  Icons.local_offer_outlined,
                  size: 30,
                ),
                title: TextField(
                    onChanged: (value) {},
                    keyboardType: TextInputType.visiblePassword,
                    style: TextStyle(
                        fontFamily: 'Helvetica',
                        color: Color.fromRGBO(16, 75, 145, 1),
                        fontSize: 15,
                        height: 0.5,
                        fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100),
                            borderSide: BorderSide(
                                color: Color.fromRGBO(16, 75, 145, 1))),
                        hintText: '    Price',
                        hintStyle: TextStyle(
                            fontFamily: 'Helvetica',
                            color: Colors.grey[400],
                            fontSize: 17,
                            fontWeight: FontWeight.bold))),
              ),
              SizedBox(height: 15),
              ListTile(
                leading: Icon(
                  Icons.format_list_numbered_outlined,
                  size: 30,
                ),
                title: TextField(
                    onChanged: (value) {},
                    style: TextStyle(
                        fontFamily: 'Helvetica',
                        color: Color.fromRGBO(16, 75, 145, 1),
                        fontSize: 15,
                        height: 0.5,
                        fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100),
                            borderSide: BorderSide(
                                color: Color.fromRGBO(16, 75, 145, 1))),
                        hintText: '    Number of item',
                        hintStyle: TextStyle(
                            fontFamily: 'Helvetica',
                            color: Colors.grey[400],
                            fontSize: 17,
                            fontWeight: FontWeight.bold))),
              ),
              SizedBox(height: 25),
              ListTile(
                title: Padding(
                  padding: const EdgeInsets.only(left: 100, right: 100),
                  child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: Icon(
                        Icons.save_outlined,
                      ),
                      label: Text('Save', style: TextStyle(fontSize: 17))),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
