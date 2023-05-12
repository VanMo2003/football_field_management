import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:football_field_management_demo/core/constants/check_permistion.dart';
import 'package:football_field_management_demo/models/account.dart';
import 'package:football_field_management_demo/services/manage_database_services.dart';
import 'package:football_field_management_demo/services/user_database_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

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
      User? user = result.user;
      return _userFromFirebaseUser(user);
    } on FirebaseAuthException catch (e) {
      debugPrint('Failed with error code: ${e.code}');
      return null;
    }
  }

  //! registor with email & password
  Future registorWithEmailAndPassword(
      String email, String password, String permission) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? user = result.user;

      //! create a new document for the user with the uid
      if (CheckPermission.checkPermission(permission)) {
        await ManageDatabaseServices(uid: user!.uid)
            .updateManage('', '', '', 0, true);
      } else {
        await UserDatabaseServices(uid: user!.uid).updateManage('', '', false);
      }

      return _userFromFirebaseUser(user);
    } on FirebaseAuthException catch (e) {
      debugPrint('Failed with error code: ${e.toString()}');
      return null;
    }
  }

  Future<void> setManage(String uid, String permission) async {
    final SharedPreferences prefs = await _prefs;
    await prefs.setBool(uid, true);
  }

  Future<bool?> getPermission(String? uid) async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getBool(uid ?? '');
  }

  //! check login
  bool isLogin() {
    return _auth.currentUser != null;
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
}
