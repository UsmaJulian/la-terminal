// ignore_for_file: avoid_print

import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:la_terminal/src/firebase/cloud_firestore_service.dart';
import 'package:la_terminal/src/providers/user_info_provider.dart';

import 'package:provider/provider.dart';

class AuthenticationService {
  final FirebaseAuth _auth;
  final BuildContext _context;

  AuthenticationService(
    this._auth,
    this._context,
  ) {
    _init();
  }

//State Changes

  void _init() async {
    _auth.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else if (user.uid.isNotEmpty) {
        print('User is signed in! ${user.uid}');
        Provider.of<UserInfoProvider>(_context, listen: false).setUserId =
            user.uid;
      }
    });
  }

// create a new account

  Future newUserWithErrorMessage(String _name, String _email, String _pass,
      String _lastname, String _idCard, String _phone) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: _email, password: _pass);
      FirestoreService()
          .makeUserDB(userCredential, _name, _lastname, _idCard, _phone);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }
// signin account

  Future signinWithErrorMessage(
    String _email,
    String _pass,
  ) async {
    try {
      // UserCredential userCredential =
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: _email, password: _pass);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  //logOut User
  singOut() async {
    await FirebaseAuth.instance
        .signOut()
        .then((value) => null)
        .catchError((onError) {
      print("error caught: $onError");
    });
  }
}
