import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/repositories/user_repository.dart';

class FirebaseUserRepository extends UserRepository {
  const FirebaseUserRepository();

  /// Email of the signed user
  @override
  String get signedEmail {
    final user = FirebaseAuth.instance.currentUser;
    return user?.email! ?? "";
  }

  /// Authentication on Firebase with username and password
  @override
  Future<bool> authenticate(String username, String password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: username, password: password);
      return true;
    } on FirebaseAuthException catch (e) {
      debugPrint(e.message);
      return false;
    }
  }

  /// Registration on Firebase with username and password
  @override
  Future<bool> register(String username, String password) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: username,
        password: password,
      );

      return true;
    } on FirebaseAuthException catch (e) {
      debugPrint(e.message);
      return false;
    }
  }

  /// Logout from Firebase
  @override
  Future<void> logOut() => FirebaseAuth.instance.signOut();
}