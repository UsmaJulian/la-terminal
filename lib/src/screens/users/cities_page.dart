import 'package:flutter/material.dart';

class CitiesPage extends StatelessWidget {
  static const routeName = 'citiesPage';

  const CitiesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
      ),
      body: const Center(
        child: Text('Cities page'),
      ),
    );
  }
}
