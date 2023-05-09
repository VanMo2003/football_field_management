import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:football_field_management_demo/models/manage.dart';

class ManageDatabaseServices {
  ManageDatabaseServices({required this.uid});
  String? uid;

  final CollectionReference _collectionReference =
      FirebaseFirestore.instance.collection('manage');

  Future updateManage(
    String nameManage,
    String nameField,
    String address,
    int numberYard,
    bool permission,
  ) async {
    return await _collectionReference.doc(uid).set({
      'name_manage': nameManage,
      'name_field': nameField,
      'address': address,
      'number_yard': numberYard,
      'permission': permission,
    }).then((value) => debugPrint('$_collectionReference'));
  }

  Manage _userDataWithID(DocumentSnapshot snapshot) {
    dynamic data = snapshot.data() as Map<String, dynamic>;
    return Manage(
      nameManage: data['name_manage'],
      nameField: data['name_field'],
      address: data['address'],
      numberYard: data['number_yard'],
      checkPermission: data['permission'],
    );
  }

  Stream<Manage> get manage {
    return _collectionReference.doc(uid).snapshots().map(_userDataWithID);
  }

  Future<void> getData() async {
    // Get docs from collection reference
    QuerySnapshot querySnapshot = await _collectionReference.get();
    debugPrint('List Doc ID: ${querySnapshot.docs}');
    // Get data from docs and convert map to List
    final allData = querySnapshot.docs.map((doc) {
      debugPrint('doc id : $doc');
      return doc.data();
    }).toList();

    debugPrint('data all : $allData');
  }

  void listDocumentIDManage() {
    debugPrint('${FirebaseFirestore.instance.collection('manage')}');
  }

  // //! get brews with stream
  // Stream<List<String>> get brews {
  //   return _collectionReference.doc();
  // }
}
