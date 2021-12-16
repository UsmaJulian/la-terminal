import 'package:flutter/material.dart';
import 'package:la_terminal/src/widgets/users/custom_history_appbar_widget.dart';

class HistoryPage extends StatelessWidget {
  static const routeName = 'historyPage';

  const HistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customHistoryAppBarWidget(context),
        body: _buildHistoryBody(context));
  }

  _buildHistoryBody(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Column(
              children: [
                Row(
                  children: const [
                    Icon(
                      Icons.car_rental,
                      size: 40.0,
                      color: Colors.black,
                    ),
                    Text(
                      "Viajes",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 10.0),
                    Text(
                      "(2)",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.95,
                  height: MediaQuery.of(context).size.height * 0.25,
                  child: Card(
                    elevation: 2.0,
                    child: Container(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    "Invoice: Nº-ID.Invoice",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 15.0),
                                  Text(
                                    "Fecha del viaje",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 15.0),
                                  Text(
                                    "Conductor: conductor.name",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              const SizedBox(width: 30.0),
                              Image.asset(
                                "assets/cityPlaceholder/ef3-placeholder-image.jpg",
                                scale: 9.0,
                                fit: BoxFit.cover,
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: const [
                              Expanded(
                                child: Text(
                                  "Ciudad: ciudad.name",
                                  style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Icon(Icons.pin_drop, size: 25.0),
                              SizedBox(width: 15.0),
                              Icon(Icons.phone_android, size: 25.0),
                              SizedBox(width: 10.0),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.95,
                  height: MediaQuery.of(context).size.height * 0.25,
                  child: Card(
                    elevation: 2.0,
                    child: Container(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    "Invoice: Nº-ID.Invoice",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 15.0),
                                  Text(
                                    "Fecha del viaje",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 15.0),
                                  Text(
                                    "Conductor: conductor.name",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              const SizedBox(width: 30.0),
                              Image.asset(
                                "assets/cityPlaceholder/ef3-placeholder-image.jpg",
                                scale: 9.0,
                                fit: BoxFit.cover,
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: const [
                              Expanded(
                                child: Text(
                                  "Ciudad: ciudad.name",
                                  style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Icon(Icons.pin_drop, size: 25.0),
                              SizedBox(width: 15.0),
                              Icon(Icons.phone_android, size: 25.0),
                              SizedBox(width: 10.0),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 30.0,
            ),
            Column(
              children: [
                Row(
                  children: const [
                    Icon(
                      Icons.local_shipping,
                      size: 40.0,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      "Envios",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 10.0),
                    Text(
                      "(2)",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.95,
                  height: MediaQuery.of(context).size.height * 0.25,
                  child: Card(
                    elevation: 2.0,
                    child: Container(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    "Invoice: Nº-ID.Invoice",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 15.0),
                                  Text(
                                    "Fecha del viaje",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 15.0),
                                  Text(
                                    "Conductor: conductor.name",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              const SizedBox(width: 30.0),
                              Image.asset(
                                "assets/cityPlaceholder/ef3-placeholder-image.jpg",
                                scale: 9.0,
                                fit: BoxFit.cover,
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: const [
                              Expanded(
                                child: Text(
                                  "Ciudad: ciudad.name",
                                  style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Icon(Icons.pin_drop, size: 25.0),
                              SizedBox(width: 15.0),
                              Icon(Icons.phone_android, size: 25.0),
                              SizedBox(width: 10.0),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.95,
                  height: MediaQuery.of(context).size.height * 0.25,
                  child: Card(
                    elevation: 2.0,
                    child: Container(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    "Invoice: Nº-ID.Invoice",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 15.0),
                                  Text(
                                    "Fecha del viaje",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 15.0),
                                  Text(
                                    "Conductor: conductor.name",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              const SizedBox(width: 30.0),
                              Image.asset(
                                "assets/cityPlaceholder/ef3-placeholder-image.jpg",
                                scale: 9.0,
                                fit: BoxFit.cover,
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: const [
                              Expanded(
                                child: Text(
                                  "Ciudad: ciudad.name",
                                  style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Icon(Icons.pin_drop, size: 25.0),
                              SizedBox(width: 15.0),
                              Icon(Icons.phone_android, size: 25.0),
                              SizedBox(width: 10.0),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
