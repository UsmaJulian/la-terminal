import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:la_terminal/src/providers/user_info_provider.dart';
import 'package:la_terminal/src/screens/users/notification_page.dart';
import 'package:provider/provider.dart';

AppBar customAppBarWidget(
  BuildContext context,
  scaffoldkey,
) {
  final userData = Provider.of<UserInfoProvider>(context).getUserData;
  // print("Dataaaa: ${userData?['name']}");
  return AppBar(
    backgroundColor: const Color(0xff1D3557),
    shape: const ContinuousRectangleBorder(
      borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(20.0),
          bottomLeft: Radius.circular(20.0)),
    ),
    automaticallyImplyLeading: false,
    leading: Container(
      margin: const EdgeInsets.only(top: 8.0, right: 8.0, bottom: 8.0, left: 3),
      decoration: BoxDecoration(
          color: const Color(0xff457B9D),
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(20.0),
            bottomRight: Radius.circular(20.0),
            bottomLeft: Radius.circular(10.0),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.white.withOpacity(0.1),
              spreadRadius: 3,
              blurRadius: 5,
              offset: const Offset(2, 0),
            )
          ]),
      child: IconButton(
        icon: SvgPicture.asset(
          'assets/icons/menu.svg',
          width: 24,
          height: 24,
          color: Colors.white,
        ),
        onPressed: () => scaffoldkey.currentState!.openDrawer(),
      ),
    ),
    title: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          userData?['name'] ?? '',
          style: const TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
              fontSize: 16,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.5),
        ),
        const Text(
          'Usuario.City',
          style: TextStyle(
              color: Color(0xffA8DADC),
              fontFamily: 'OpenSans',
              fontSize: 14,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.5),
        ),
      ],
    ),
    actions: [
      Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: EdgeInsets.zero,
        width: 55,
        height: 40,
        decoration: BoxDecoration(
            color: const Color(0xff457B9D),
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0),
                bottomLeft: Radius.circular(20.0),
                topLeft: Radius.circular(20.0)),
            boxShadow: [
              BoxShadow(
                color: Colors.white.withOpacity(0.1),
                spreadRadius: 3,
                blurRadius: 5,
                offset: const Offset(2, 0),
              )
            ]),
        child: IconButton(
          tooltip: 'Cambiar a conductor',
          icon: SvgPicture.asset(
            'assets/icons/chauffer.svg',
            color: Colors.white,
            height: 50,
            width: 50,
          ),
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                      title: const Text("Bienvenido al modo socio conductor"),
                      content: const Text(
                          "Permítenos confirmar si te encuentras en nuestra base de datos"),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text(
                            "Cancelar",
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                        TextButton(
                            onPressed: () {},
                            child: const Text(
                              "Comprobar",
                              style: TextStyle(color: Color(0xff1D3557)),
                            )),
                        TextButton(
                            onPressed: () {
                              // Navigator.of(context)
                              //     .pushNamed(SignUpDriver.routeName);
                            },
                            child: const Text(
                              "Registrarse",
                              style: TextStyle(color: Color(0xff457B9D)),
                            )),
                      ],
                    ));
          },
        ),
      ),
      const SizedBox(
        width: 10,
      ),
      Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          padding: EdgeInsets.zero,
          width: 35,
          height: 35,
          decoration: BoxDecoration(
              color: const Color(0xff457B9D),
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0),
                  bottomLeft: Radius.circular(20.0),
                  topLeft: Radius.circular(20.0)),
              boxShadow: [
                BoxShadow(
                  color: Colors.white.withOpacity(0.1),
                  spreadRadius: 3,
                  blurRadius: 5,
                  offset: const Offset(2, 0),
                )
              ]),
          child: IconButton(
            icon: SvgPicture.asset(
              'assets/icons/bell.svg',
              color: Colors.white,
              width: 24,
              height: 24,
            ),
            onPressed: () {
              Navigator.of(context).pushNamed(NotificationPage.routeName);
            },
          )),
      const SizedBox(
        width: 10,
      ),
    ],
  );
}
