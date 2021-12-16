import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:la_terminal/src/providers/cities_selection_provider.dart';
import 'package:la_terminal/src/providers/user_info_provider.dart';

import 'package:la_terminal/src/widgets/users/custom_city_ship.dart';
import 'package:la_terminal/src/widgets/users/custom_city_trip.dart';

import 'package:provider/provider.dart';

final format = DateFormat("yyyy-MM-dd");
final _formKey1 = GlobalKey<FormState>();

class BuildContentViajes extends StatefulWidget {
  const BuildContentViajes({Key? key}) : super(key: key);

  @override
  _BuildContentViajesState createState() => _BuildContentViajesState();
}

class _BuildContentViajesState extends State<BuildContentViajes> {
  final TextEditingController _meetController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _taxController = TextEditingController();
  final TextEditingController _commentsController = TextEditingController();

  final ScrollController _controllerOne =
      ScrollController(initialScrollOffset: 20.0);

  DateTime? date1;
  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<UserInfoProvider>(context).getUserData;
    return Scrollbar(
      controller: _controllerOne,
      isAlwaysShown: true,
      thickness: 5.0,
      radius: const Radius.circular(20.0),
      child: SingleChildScrollView(
        controller: _controllerOne,
        child: Consumer<CitiesSelection>(
          builder: (BuildContext context, citiesSelection, _) => Container(
            padding: const EdgeInsets.all(10.0),
            margin: const EdgeInsets.only(
                top: 28.0, right: 15.0, bottom: 10.0, left: 15.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 3,
                    blurRadius: 7,
                    offset: const Offset(0, 2),
                  )
                ]),
            child: Form(
              key: _formKey1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      padding: const EdgeInsets.only(
                        top: 15.0,
                        right: 15.0,
                        left: 15.0,
                      ),
                      child: const DropdownCitiesButtonTrip()),
                  Container(
                    padding: const EdgeInsets.only(
                      top: 15.0,
                      right: 15.0,
                      left: 15.0,
                    ),
                    child: DateTimeField(
                      format: format,
                      controller: _dateController,
                      decoration: InputDecoration(
                          icon: SvgPicture.asset(
                            'assets/icons/calendar.svg',
                            color: const Color(0xff1D3557),
                            height: 28,
                            width: 28,
                          ),
                          labelText: 'Fecha estimada: ',
                          hintStyle: const TextStyle(
                              fontSize: 12.0, color: Colors.black),
                          hintText: 'En que fecha planeas viajar?'),
                      onShowPicker:
                          (BuildContext context, DateTime? currentValue) async {
                        date1 = await showDatePicker(
                            context: context,
                            firstDate: DateTime(1900),
                            initialDate: currentValue ?? DateTime.now(),
                            lastDate: DateTime(2100));
                        if (date1 != null) {
                          _dateController.text = format.format(date1!);

                          return date1;
                        } else {
                          return currentValue;
                        }
                      },
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                      top: 15.0,
                      right: 15.0,
                      left: 15.0,
                    ),
                    child: TextFormField(
                      controller: _meetController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          icon: SvgPicture.asset(
                            'assets/icons/place.svg',
                            color: const Color(0xff1D3557),
                            height: 35,
                            width: 35,
                          ),
                          labelText: 'Lugar de Encuentro: ',
                          hintStyle: const TextStyle(fontSize: 12.0),
                          hintText:
                              'Donde planeas que sea tu punto de encuentro?'),
                      // validator: (valueMeet) {
                      //   if (valueMeet!.isEmpty) {
                      //     return 'Please enter some text';
                      //   }
                      // },
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                      top: 15.0,
                      right: 15.0,
                      left: 15.0,
                    ),
                    child: TextFormField(
                      controller: _taxController,
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        // if (value.isEmpty) {
                        //   _taxController.text = '0';
                        // }
                        value = _taxController.text;
                      },
                      decoration: InputDecoration(
                          icon: SvgPicture.asset(
                            'assets/icons/money.svg',
                            color: const Color(0xff1D3557),
                            height: 35,
                            width: 35,
                          ),
                          labelText: 'Tarifa del viaje: ',
                          hintStyle: const TextStyle(fontSize: 12.0),
                          hintText: 'Cuanto planeas gastar en tu viaje?'),
                      // validator: (valueTax) {
                      //   if (valueTax!.isEmpty) {
                      //     return 'Please enter some text';
                      //   }
                      // },
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                      top: 15.0,
                      right: 15.0,
                      left: 15.0,
                    ),
                    child: TextFormField(
                      controller: _commentsController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          icon: SvgPicture.asset(
                            'assets/icons/chat.svg',
                            color: const Color(0xff1D3557),
                            height: 35,
                            width: 35,
                          ),
                          labelText:
                              'Comentarios y solicitudes para tu viaje: ',
                          hintStyle: const TextStyle(fontSize: 12.0),
                          hintText:
                              'Tienes algunos comentarios o solicitudes para tu viaje?'),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 30),
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: 150,
                          height: 45,
                          child: TextButton(
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                ),
                                backgroundColor: MaterialStateProperty.all(
                                    const Color(0xff457B9D)),
                              ),
                              onPressed: () {},
                              child: const Text(
                                "Cancelar",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'OpenSans',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: 0.5),
                              )),
                        ),
                        SizedBox(
                          width: 150,
                          height: 45,
                          child: TextButton(
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                ),
                                backgroundColor: MaterialStateProperty.all(
                                    const Color(0xff457B9D)),
                              ),
                              onPressed: () async {
                                // if (_formKey1.currentState!.validate()) {
                                //   await
                                _createTrip(
                                    userData,
                                    _meetController.text,
                                    _dateController.text,
                                    _taxController.text,
                                    _commentsController.text,
                                    citiesSelection.getCityTrip);

                                //TODO:Crear contenido del dialog
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        AlertDialog(
                                          title: const Text(
                                              "Generando solicitud de viaje"),
                                          content: const Text(
                                              "Permítenos confirmar y generar tu solicitud de viaje"),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20.0)),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: const Text(
                                                "Cancelar",
                                                style: TextStyle(
                                                    color: Colors.red),
                                              ),
                                            ),
                                            TextButton(
                                                onPressed: () {},
                                                child: const Text(
                                                  "Generar",
                                                  style: TextStyle(
                                                      color: Color(0xff1D3557)),
                                                )),
                                          ],
                                        ));
                                // navService.pushNamed(
                                //   'travelPage',
                                // );
                                // } else {
                                //   ScaffoldMessenger.of(context).showSnackBar(
                                //       const SnackBar(
                                //           content: Text(
                                //               'Todos lo campos deben estar completos.')));
                                // }
                              },
                              child: const Text(
                                "Viajar",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'OpenSans',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: 0.5),
                              )),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

_createTrip(Map<String, dynamic>? userData, String _meet, String _date,
    String _tax, String _comments, String city) {
  final fecha = DateTime?.parse(_date).add(const Duration(days: 1));
  FirebaseFirestore.instance
      .collection('temptravels')
      .doc(city)
      .collection(userData!['uid'])
      .add({
    "uid": userData['uid'],
    "ciudad": city,
    "fecha": fecha,
    "lugar": _meet,
    "tarifa": _tax,
    "comentarios": _comments,
  });
}

final _formKey2 = GlobalKey<FormState>();

class BuildContentEnvios extends StatefulWidget {
  const BuildContentEnvios({Key? key}) : super(key: key);

  @override
  _BuildContentEnviosState createState() => _BuildContentEnviosState();
}

class _BuildContentEnviosState extends State<BuildContentEnvios> {
  final TextEditingController _meetPackageController = TextEditingController();
  final TextEditingController _datePackageController = TextEditingController();
  final TextEditingController _featuresPackageController =
      TextEditingController();
  final TextEditingController _taxPackageController = TextEditingController();
  final TextEditingController _commentsPackageController =
      TextEditingController();
  final ScrollController _controllerTwo =
      ScrollController(initialScrollOffset: 20.0);
  DateTime? date2;
  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<UserInfoProvider>(context).getUserData;
    return Scrollbar(
      controller: _controllerTwo,
      isAlwaysShown: true,
      thickness: 5.0,
      radius: const Radius.circular(20.0),
      child: SingleChildScrollView(
        controller: _controllerTwo,
        child: Consumer<CitiesSelection>(
          builder: (BuildContext context, citiesSelection, _) => Container(
            padding: const EdgeInsets.all(10.0),
            margin: const EdgeInsets.only(
                top: 28.0, right: 15.0, bottom: 10.0, left: 15.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 3,
                    blurRadius: 7,
                    offset: const Offset(0, 2),
                  )
                ]),
            child: Form(
              key: _formKey2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      padding: const EdgeInsets.only(
                        top: 15.0,
                        right: 15.0,
                        left: 15.0,
                      ),
                      child: const DropDownCitiesButtonShip()),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15.0,
                    ),
                    child: TextFormField(
                      controller: _featuresPackageController,
                      decoration: InputDecoration(
                          icon: SvgPicture.asset(
                            'assets/icons/package.svg',
                            color: const Color(0xff1D3557),
                            height: 30,
                            width: 30,
                          ),
                          labelText: 'Características: ',
                          hintStyle: const TextStyle(fontSize: 12.0),
                          hintText:
                              'Cuales son las características del envío?'),
                      validator: (valueFeaturesPackage) {
                        if (valueFeaturesPackage!.isEmpty) {
                          return 'Please enter some text';
                        }
                      },
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                      top: 0,
                      right: 15.0,
                      left: 15.0,
                    ),
                    child: TextFormField(
                      controller: _meetPackageController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          icon: SvgPicture.asset(
                            'assets/icons/place.svg',
                            color: const Color(0xff1D3557),
                            height: 22,
                            width: 22,
                            fit: BoxFit.fill,
                          ),
                          labelText: 'Lugar de Recogida del paquete: ',
                          hintStyle: const TextStyle(fontSize: 12.0),
                          hintText: 'Donde se recogerá el paquete?'),
                      validator: (valueMeetPackage) {
                        if (valueMeetPackage!.isEmpty) {
                          return 'Please enter some text';
                        }
                      },
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                      top: 15.0,
                      right: 15.0,
                      left: 15.0,
                    ),
                    child: DateTimeField(
                      format: format,
                      controller: _datePackageController,
                      decoration: InputDecoration(
                          icon: SvgPicture.asset(
                            'assets/icons/calendar.svg',
                            color: const Color(0xff1D3557),
                            height: 22,
                            width: 22,
                          ),
                          labelText: 'Fecha estimada del envío: ',
                          hintStyle: const TextStyle(fontSize: 12.0),
                          hintText: 'En que fecha planeas hacer el envío?'),
                      onShowPicker:
                          (BuildContext context, DateTime? currentValue) async {
                        final date = await showDatePicker(
                            context: context,
                            firstDate: DateTime(1900),
                            initialDate: currentValue ?? DateTime.now(),
                            lastDate: DateTime(2100));
                        if (date != null) {
                          _datePackageController.text = format.format(date);
                          return date;
                        } else {
                          return currentValue;
                        }
                      },
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                      top: 15.0,
                      right: 15.0,
                      left: 15.0,
                    ),
                    child: TextFormField(
                      controller: _taxPackageController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          icon: SvgPicture.asset(
                            'assets/icons/money.svg',
                            color: const Color(0xff1D3557),
                            height: 35,
                            width: 35,
                          ),
                          labelText: 'Tarifa del envío: ',
                          hintStyle: const TextStyle(fontSize: 12.0),
                          hintText: 'Cual es el costo del envío?'),
                      validator: (valueTaxPackage) {
                        if (valueTaxPackage!.isEmpty) {
                          return 'Please enter some text';
                        }
                      },
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                      top: 15.0,
                      right: 15.0,
                      left: 15.0,
                    ),
                    child: TextFormField(
                      controller: _commentsPackageController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          icon: SvgPicture.asset(
                            'assets/icons/chat.svg',
                            color: const Color(0xff1D3557),
                            height: 35,
                            width: 35,
                          ),
                          labelText:
                              'Comentarios y solicitudes para tu envío: ',
                          hintStyle: const TextStyle(fontSize: 12.0),
                          hintText:
                              'Tienes algunos comentarios o solicitudes para tu envío?'),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 30),
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: 150,
                          height: 45,
                          child: TextButton(
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                ),
                                backgroundColor: MaterialStateProperty.all(
                                    const Color(0xff457B9D)),
                              ),
                              onPressed: () {},
                              child: const Text(
                                "Cancelar",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'OpenSans',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: 0.5),
                              )),
                        ),
                        SizedBox(
                          width: 150,
                          height: 45,
                          child: TextButton(
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                ),
                                backgroundColor: MaterialStateProperty.all(
                                    const Color(0xff457B9D)),
                              ),
                              onPressed: () {
                                _createShip(
                                    userData,
                                    _meetPackageController.text,
                                    _datePackageController.text,
                                    _featuresPackageController.text,
                                    _taxPackageController.text,
                                    _commentsPackageController.text,
                                    citiesSelection.getCityShip);
                                // if (_formKey2.currentState!.validate()) {
                                //   navService.pushNamed(
                                //     'shipPage',
                                //   );
                                // } else {
                                //   ScaffoldMessenger.of(context).showSnackBar(
                                //       const SnackBar(
                                //           content: Text(
                                //               'Todos lo campos deben estar completos.')));
                                // }
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        AlertDialog(
                                          title: const Text(
                                              "Generando solicitud de envío"),
                                          content: const Text(
                                              "Permítenos confirmar y generar tu solicitud de envío"),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20.0)),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: const Text(
                                                "Cancelar",
                                                style: TextStyle(
                                                    color: Colors.red),
                                              ),
                                            ),
                                            TextButton(
                                                onPressed: () {},
                                                child: const Text(
                                                  "Generar",
                                                  style: TextStyle(
                                                      color: Color(0xff1D3557)),
                                                )),
                                          ],
                                        ));
                              },
                              child: const Text(
                                "Enviar",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'OpenSans',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: 0.5),
                              )),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

_createShip(
    Map<String, dynamic>? userData,
    String _meetpackage,
    String _datepackage,
    String _featurepackage,
    String _taxpackage,
    String _commentspackage,
    String cityShip) {
  final fecha2 = DateTime.parse(_datepackage).add(const Duration(days: 1));
  FirebaseFirestore.instance
      .collection('tempships')
      .doc(cityShip)
      .collection(userData!['uid'])
      .add({
    "uid": userData['uid'],
    "ciudad": cityShip,
    "fecha": fecha2,
    "caracteristicas": _featurepackage,
    "lugar": _meetpackage,
    "tarifa": _taxpackage,
    "comentarios": _commentspackage,
  });
}
