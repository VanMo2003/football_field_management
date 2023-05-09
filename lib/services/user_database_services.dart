import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserDatabaseServices {
  UserDatabaseServices({required this.uid});
  String uid;

  final CollectionReference _collectionReference =
      FirebaseFirestore.instance.collection('user');

  Future updateManage(
      String nameUser, String phoneNumber, bool permission) async {
    return await _collectionReference.doc(uid).set({
      'name_user': nameUser,
      'phome_number': phoneNumber,
      'permission': permission,
    }).then((value) => debugPrint('$_collectionReference'));
  }
}
