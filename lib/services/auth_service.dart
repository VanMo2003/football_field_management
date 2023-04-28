import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:football_field_management_demo/core/constants/check_permistion.dart';
import 'package:football_field_management_demo/models/account.dart';
import 'package:football_field_management_demo/services/manage_database_services.dart';
import 'package:football_field_management_demo/services/user_database_services.dart';

class AuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //! create user obj based on FirebaseUser
  AccountModel? _userFromFirebaseUser(User? user) {
    return user != null ? AccountModel(uid: user.uid) : null;
  }

  //! auth change user stream
  Stream<AccountModel?> get user {
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }

  //! sign with email & password
  Future signWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential? result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      _userFromFirebaseUser(result.user);
      return 'Successfully';
    } on FirebaseAuthException catch (e) {
      debugPrint('Failed with error code: ${e.code}');
      return e.message;
    }
  }

  //! registor with email & password
  Future registorWithEmailAndPassword(
      String email, String password, String permission) async {
    try {
      UserCredential? result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? user = result.user;

      //! create a new document for the user with the uid
      if (CheckPermission.checkPermission(permission)) {
        await ManageDatabaseServices(uid: user!.uid)
            .updateManage('', '', '', 0);
      } else {
        await UserDatabaseServices(uid: user!.uid).updateManage('', '');
      }

      _userFromFirebaseUser(user);
      return 'Successfully';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        return 'The account already exists for that email.';
      }
      return e.message;
    }
  }

  //! sign in anon
  Future signInAnon() async {
    try {
      UserCredential? result = await _auth.signInAnonymously();

      User? user = result.user;

      return _userFromFirebaseUser(user);
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  //! sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }
}
