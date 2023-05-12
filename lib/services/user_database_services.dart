import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:football_field_management_demo/models/user.dart';

class UserDatabaseServices {
  UserDatabaseServices({required this.uid});
  String? uid;

  final CollectionReference _collectionReference =
      FirebaseFirestore.instance.collection('user');

  Future updateManage(
      String nameUser, String phoneNumber, bool permission) async {
    return await _collectionReference.doc(uid).set({
      'name_user': nameUser,
      'phone_number': phoneNumber,
      'permission': permission,
    }).then((value) => debugPrint('$_collectionReference'));
  }

  User _userDataWithID(DocumentSnapshot snapshot) {
    dynamic data = snapshot.data() as Map<String, dynamic>;
    return User(
      nameUser: data['name_user'],
      numberPhone: data['phone_number'],
    );
  }

  Stream<User> get user {
    return _collectionReference.doc(uid).snapshots().map(_userDataWithID);
  }
}
