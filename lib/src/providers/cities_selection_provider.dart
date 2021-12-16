import 'package:flutter/material.dart';

class CitiesSelection with ChangeNotifier {
  String _cityTrip = '';
  String _cityShip = '';
//GET
  get getCityTrip {
    return _cityTrip;
  }

//SET
  set setCityTrip(String cityTrip) {
    _cityTrip = cityTrip;
    notifyListeners();
  }

//GET
  get getCityShip {
    return _cityShip;
  }

//SET
  set setCityShip(String cityShip) {
    _cityShip = cityShip;
    notifyListeners();
  }
}