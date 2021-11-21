import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class register {
  CollectionReference database = FirebaseFirestore.instance.collection('users');

  Future<void> registerUser(
      String idUser, String password, String shopname, String phone) async {
    await database.add({
      'idUser': idUser,
      'password': password,
      'shopname': shopname,
      'phone': phone,
    }).then((value) => print('Register success'));
  }
}
