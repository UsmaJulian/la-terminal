// ignore_for_file: file_names

import 'package:flutter/material.dart';

class UserInfoProvider with ChangeNotifier {
  Map<String, dynamic>? _userData;
  String? _userId;

//Get
  get getUserId {
    return _userId;
  }

//Set
  set setUserId(String _userID) {
    _userId = _userID;
    notifyListeners();
  }

//GET
  Map<String, dynamic>? get getUserData {
    return _userData;
  }

//SET
  void setUserInfo(Map<String, dynamic> userData) {
    _userData = userData;
    notifyListeners();
  }
}
