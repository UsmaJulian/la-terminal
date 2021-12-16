import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:la_terminal/src/providers/cities_selection_provider.dart';
import 'package:provider/provider.dart';

class DropdownCitiesButtonTrip extends StatefulWidget {
  const DropdownCitiesButtonTrip({Key? key}) : super(key: key);

  @override
  State<DropdownCitiesButtonTrip> createState() =>
      _DropdownCitiesButtonTripState();
}

class _DropdownCitiesButtonTripState extends State<DropdownCitiesButtonTrip> {
  late final Stream<QuerySnapshot<Map<String, dynamic>>>? stream;
  dynamic _selectedText;
  List<DropdownMenuItem> ciudadItems = [];
  @override
  void initState() {
    stream = FirebaseFirestore.instance.collection("ciudades").snapshots();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: stream,
      // initialData: [],
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) {
          const Text("Loading.....");
        } else if (ciudadItems.isEmpty ||
            ciudadItems.length <= snapshot.data!.docs.length) {
          for (int i = 0; i < snapshot.data!.docs.length; i++) {
            ciudadItems.add(DropdownMenuItem(
              child: Text(snapshot.data!.docs[i]['nombre']),
              value: snapshot.data!.docs[i]['nombre'],
            ));
          }
        }
        return Consumer<CitiesSelection>(
          builder: (BuildContext context, citiesSelection, _) => Row(
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
                  isExpanded: true,
                  value: _selectedText,
                  hint: const Text('Ciudad de Viaje'),
                  items: ciudadItems.toSet().toList(),
                  onChanged: (dynamic valueSelected) {
                    if (valueSelected != null) {
                      citiesSelection.setCityTrip = valueSelected;
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

// Widget dropdownCitiesButtonTrip(BuildContext context) {
//   List<DropdownMenuItem> ciudadItems = [];
//   return StreamBuilder(
//     stream: FirebaseFirestore.instance.collection("ciudades").snapshots(),
//     // initialData: [],
//     builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//       if (!snapshot.hasData) {
//         const Text("Loading.....");
//       } else if (ciudadItems.isEmpty) {
//         for (int i = 0; i < snapshot.data!.docs.length; i++) {
//           print(snapshot.data!.docs[i]['nombre']);
//           ciudadItems.add(DropdownMenuItem(
//             child: Text(snapshot.data!.docs[i]['nombre']),
//             value: snapshot.data!.docs[i]['nombre'],
//           ));
//         }
//       }
//       return Consumer<CitiesSelection>(
//         builder: (BuildContext context, citiesSelection, _) => Row(
//           children: [
//             Container(
//               margin:const EdgeInsets.only(right: 15),
//               child: SvgPicture.asset(
//                 'assets/icons/cityscape.svg',
//                 color:const Color(0xff1D3557),
//                 height: 30,
//                 width: 30,
//               ),
//             ),
//             SizedBox(
//               width: (MediaQuery.of(context).size.width) - 130,
//               child: DropdownButton(
//                 isDense: false,
//                 isExpanded: true,
//                 hint:const Text('Ciudad de Viaje'),
//                 items: ciudadItems.toSet().toList(),
//                 onChanged: (dynamic valueSelected) {
//                   citiesSelection.setCityTrip = valueSelected;
//                   print('Ciudad viaje seleccionada: ');
//                   print(citiesSelection.getCityTrip);
//                 },
//               ),
//             ),
//           ],
//         ),
//       );
//     },
//   );
  
// }

