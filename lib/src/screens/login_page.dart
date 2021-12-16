import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:la_terminal/src/firebase/firebase_auth_service.dart';

import 'package:la_terminal/src/screens/register_page.dart';
import 'package:la_terminal/src/screens/users/home_page.dart';

class LoginPage extends StatefulWidget {
  static const routeName = 'loginPage';

  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  Timer? _timer;

  @override
  void initState() {
    User? _currentUser = FirebaseAuth.instance.currentUser;

    _timer = Timer(const Duration(seconds: 1), () {
      if (_currentUser != null) {
        Navigator.of(context).pushReplacementNamed(HomePage.routeName);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AuthenticationService(FirebaseAuth.instance, context);
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                autoPlay: true,
                aspectRatio: 2.0,
                enlargeCenterPage: true,
              ),
              items: [
                SizedBox(
                  height: size.height * 0.26,
                  width: size.width,
                  child: Image.asset(
                    "assets/cityPlaceholder/ef3-placeholder-image.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.26,
                  width: size.width,
                  child: Image.asset(
                    "assets/cityPlaceholder/ef3-placeholder-image.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(
                    top: 10.0, right: 8.0, bottom: 5, left: 8.0),
                decoration: BoxDecoration(
                  color: const Color(0xffEEF9F6),
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                      bottomLeft: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      spreadRadius: 3,
                      blurRadius: 7,
                      offset: const Offset(2, 0),
                    )
                  ],
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 20.0),
                        child: const Text(
                          "BIENVENIDOS!",
                          style: TextStyle(
                              color: Color(0xff1D3557),
                              fontFamily: 'OpenSans',
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 0.5),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 20.0),
                        child: const Text(
                          "Lorem Ipsum is simply dummy text.",
                          style: TextStyle(
                              color: Color(0xff457B9D),
                              fontFamily: 'OpenSans',
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 0.5),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10.0),
                        padding: const EdgeInsets.all(30.0),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              TextFormField(
                                controller: _emailController,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    suffixIcon: const Icon(Icons.email_rounded),
                                    labelText: "Correo: ",
                                    hintText: "ejemplo@ejemplo.com"),
                                autovalidateMode: AutovalidateMode.disabled,
                                validator: (value) {
                                  return (!value!.contains("@"))
                                      ? "Ingresa un correo valido"
                                      : null;
                                },
                              ),
                              const SizedBox(
                                height: 30.0,
                              ),
                              TextFormField(
                                obscureText: true,
                                controller: _passController,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  labelText: "Contraseña: ",
                                  suffixIcon:
                                      const Icon(Icons.visibility_rounded),
                                ),
                                autovalidateMode: AutovalidateMode.disabled,
                                validator: (value) {
                                  return (value!.isEmpty)
                                      ? "Ingresa una contraseña valida"
                                      : null;
                                },
                              ),
                              Container(
                                margin: const EdgeInsets.only(
                                  top: 0.5,
                                ),
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: TextButton(
                                    onPressed: () {},
                                    child: const Text(
                                      "Olvidaste tu contraseña.",
                                      style: TextStyle(
                                          color: Color(0xff457B9D),
                                          fontFamily: 'OpenSans',
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          letterSpacing: 0.5),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 20.0),
                                width: MediaQuery.of(context).size.width * 0.4,
                                height:
                                    MediaQuery.of(context).size.height * 0.07,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      spreadRadius: 3,
                                      blurRadius: 2,
                                      offset: const Offset(0, 1),
                                    )
                                  ],
                                ),
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                    ),
                                    backgroundColor: MaterialStateProperty.all(
                                        const Color(0xff457B9D)),
                                  ),
                                  onPressed: () async {
                                    if (_formKey.currentState!.validate()) {
                                      await AuthenticationService(
                                              FirebaseAuth.instance, context)
                                          .signinWithErrorMessage(
                                              _emailController.text,
                                              _passController.text);
                                    }
                                    Navigator.pushNamedAndRemoveUntil(context,
                                        HomePage.routeName, (route) => false);
                                  },
                                  child: const Text(
                                    "INGRESAR",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'OpenSans',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        letterSpacing: 0.5),
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton(
                                      onPressed: () {},
                                      icon: SvgPicture.asset(
                                        'assets/icons/google-browser.svg',
                                        color: const Color(0xffE63946),
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: SvgPicture.asset(
                                        'assets/icons/facebook.svg',
                                        color: const Color(0xff1D3557),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(
                                  top: 10.0,
                                ),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: TextButton(
                                    onPressed: () {
                                      Navigator.of(context)
                                          .pushNamed(RegisterPage.routeName);
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: const [
                                        Text(
                                          "No tienes cuenta, ",
                                          style: TextStyle(
                                              color: Color(0xff457B9D),
                                              fontFamily: 'OpenSans',
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              letterSpacing: 0.5),
                                        ),
                                        Text(
                                          "REGISTRATE. ",
                                          style: TextStyle(
                                              color: Color(0xff1D3557),
                                              fontFamily: 'OpenSans',
                                              fontSize: 14,
                                              fontWeight: FontWeight.w700,
                                              letterSpacing: 0.5),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _formKey.currentState?.dispose();
    _timer?.cancel();
    super.dispose();
  }
}
