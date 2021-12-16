import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:la_terminal/src/firebase/firebase_auth_service.dart';
import 'package:la_terminal/src/providers/user_info_provider.dart';
import 'package:la_terminal/src/screens/login_page.dart';
import 'package:la_terminal/src/screens/users/home_page.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  static const routeName = 'registerPage';

  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _idCardController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _formKey.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AuthenticationService(FirebaseAuth.instance, context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffEEF9F6),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 40.0),
                child: const Text(
                  "REGISTRARTE",
                  style: TextStyle(
                      color: Color(0xff1D3557),
                      fontFamily: 'OpenSans',
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.5),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10.0),
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
                margin: const EdgeInsets.only(top: 20.0),
                padding: const EdgeInsets.all(30.0),
                child: Form(
                  child: Column(children: [
                    TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        suffixIcon: const Icon(Icons.person_rounded),
                        labelText: "Nombre Completo: ",
                      ),
                      autovalidateMode: AutovalidateMode.disabled,
                      validator: (value) {
                        return (value!.length <= 12)
                            ? "Ingresa un nombre valido"
                            : null;
                      },
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    TextFormField(
                      controller: _idCardController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        suffixIcon: const Icon(Icons.document_scanner),
                        labelText: "Número de documento: ",
                      ),
                      autovalidateMode: AutovalidateMode.disabled,
                      validator: (value) {
                        return (value!.length <= 6)
                            ? "Ingresa un documento válido"
                            : null;
                      },
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    TextFormField(
                      controller: _phoneController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        suffixIcon: const Icon(Icons.phone_android_rounded),
                        labelText: "Número de teléfono: ",
                      ),
                      autovalidateMode: AutovalidateMode.disabled,
                      validator: (value) {
                        return (value!.length <= 10)
                            ? "Ingresa un teléfono válido"
                            : null;
                      },
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          suffixIcon: const Icon(Icons.email_rounded),
                          labelText: "Correo Electronico: ",
                          hintText: "example@example.com"),
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
                        suffixIcon: const Icon(Icons.visibility_rounded),
                      ),
                      autovalidateMode: AutovalidateMode.disabled,
                      validator: (value) {
                        return (value!.isEmpty)
                            ? "Ingresa una contraseña valida"
                            : null;
                      },
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 40.0),
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: MediaQuery.of(context).size.height * 0.07,
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
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                          backgroundColor: MaterialStateProperty.all(
                              const Color(0xff457B9D)),
                        ),
                        onPressed: () async {
                          await AuthenticationService(
                                  FirebaseAuth.instance, context)
                              .newUserWithErrorMessage(
                                  _nameController.text,
                                  _emailController.text,
                                  _passController.text,
                                  _nameController.text,
                                  _idCardController.text,
                                  _phoneController.text);
                          Navigator.pushNamedAndRemoveUntil(
                              context, HomePage.routeName, (route) => false);
                        },
                        child: const Text(
                          "REGISTRAR",
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
                      margin: const EdgeInsets.only(top: 15.0),
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed(LoginPage.routeName);
                        },
                        child: Align(
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                "Ya tienes cuenta, ",
                                style: TextStyle(
                                    color: Color(0xff457B9D),
                                    fontFamily: 'OpenSans',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: 0.5),
                              ),
                              Text(
                                "INGRESAR.",
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
                  ]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
