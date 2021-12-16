// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:la_terminal/src/providers/cities_selection_provider.dart';
import 'package:provider/provider.dart';

class DropDownCitiesButtonShip extends StatefulWidget {
  const DropDownCitiesButtonShip({Key? key}) : super(key: key);

  @override
  State<DropDownCitiesButtonShip> createState() =>
      _DropDownCitiesButtonShipState();
}

class _DropDownCitiesButtonShipState extends State<DropDownCitiesButtonShip> {
  late final _stream;
  List<DropdownMenuItem> ciudadItems = [];
  dynamic _selectedText2;
  @override
  void initState() {
    _stream = FirebaseFirestore.instance.collection("ciudades").snapshots();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _stream,
      // initialData: [],
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) {
          const Text("Loading.....");
        } else if (ciudadItems.isEmpty) {
          for (int i = 0; i < snapshot.data!.docs.length; i++) {
            print(snapshot.data!.docs[i]['nombre']);
            ciudadItems.add(DropdownMenuItem(
              child: Text(snapshot.data!.docs[i]['nombre']),
              value: snapshot.data!.docs[i]['nombre'],
            ));
          }
        }
        return Consumer<CitiesSelection>(
          builder: (BuildContext context, citiesSelectionship, _) => Row(
            children: [
              Container(
                margin: const EdgeInsets.only(right: 15),
                child: SvgPicture.asset(
                  'assets/icons/cityscape.svg',
                  color: const Color(0xff1D3557),
                  height: 30,
                  width: 30,
                ),
              ),
              SizedBox(
                width: (MediaQuery.of(context).size.width) - 130,
                child: DropdownButtonFormField(
                  value: _selectedText2,
                  isExpanded: true,
                  hint: const Text('Ciudad de Envío'),
                  items: ciudadItems.toSet().toList(),
                  onChanged: (dynamic valueSelected) {
                    if (valueSelected != null) {
                      citiesSelectionship.setCityShip = valueSelected;
                    }
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
