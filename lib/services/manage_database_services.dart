import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:football_field_management_demo/models/manage.dart';

class ManageDatabaseServices {
  ManageDatabaseServices({required this.uid});
  final String uid;

  final CollectionReference _collectionReference =
      FirebaseFirestore.instance.collection('manage');

  Future updateManage(
    String nameManage,
    String nameField,
    String address,
    int numberYard,
  ) async {
    return await _collectionReference.doc(uid).set({
      'name_manage': nameManage,
      'name_field': nameField,
      'address': address,
      'number_yard': numberYard,
    }).then((value) => debugPrint('$_collectionReference'));
  }

  Manage _userDataWithID(DocumentSnapshot snapshot) {
    dynamic data = snapshot.data() as Map<String, dynamic>;
    return Manage(
        nameManage: data['name_manage'],
        nameField: data['name_field'],
        address: data['address'],
        numberYard: data['number_yard']);
  }

  Stream<Manage?> get manage {
    return _collectionReference.doc(uid).snapshots().map(_userDataWithID);
  }
}
