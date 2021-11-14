import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class register {
  final FirebaseFirestore database = FirebaseFirestore.instance;

  registerUser(
      String idUser, String password, String shopname, String phone) async {
    await database.collection('user').doc(idUser).set({
      'idUser': idUser,
      'password': password,
      'shopname': shopname,
      'phone': phone,
    }).then((value) => print('Register success'));
  }
}
