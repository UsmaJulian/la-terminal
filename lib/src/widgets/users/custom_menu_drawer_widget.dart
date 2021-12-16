import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:la_terminal/src/firebase/firebase_auth_service.dart';
import 'package:la_terminal/src/providers/user_info_provider.dart';
import 'package:la_terminal/src/screens/login_page.dart';
import 'package:la_terminal/src/screens/users/cities_page.dart';
import 'package:la_terminal/src/screens/users/history_page.dart';
import 'package:la_terminal/src/screens/users/profile_page.dart';
import 'package:provider/provider.dart';

Widget customMenuDrawer(BuildContext context) {
  final userData = Provider.of<UserInfoProvider>(context).getUserData;
  return Container(
    padding: const EdgeInsets.only(top: 0.0),
    width: MediaQuery.of(context).size.width * 0.7,
    height: MediaQuery.of(context).size.height,
    decoration: const BoxDecoration(
        color: Color(0xffEEF9F6),
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(30.0),
            bottomRight: Radius.circular(30.0))),
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
          padding: const EdgeInsets.only(top: 30.0, left: 15.0),
          margin: EdgeInsets.zero,
          decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image:
                      AssetImage("assets/bgImage/5eb95cad17f3c600044a2912.png"),
                  fit: BoxFit.scaleDown)),
          child: Text(
            userData?['name'] ?? '',
            style: const TextStyle(
                color: Color(0xff1D3557),
                fontFamily: 'OpenSans',
                fontSize: 14,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.5),
          ),
        ),
        ListTile(
          leading: const Icon(Icons.person, color: Color(0xff1D3557)),
          title: const Text(
            "Perfil",
            // style: themeCustom.textTheme.button
            //     ?.copyWith(fontSize: 16, color: Color(0xff1D3557)),
          ),
          onTap: () {
            Navigator.popAndPushNamed(context, ProfilePage.routeName);
          },
        ),
        ListTile(
          leading:
              const Icon(Icons.location_city_rounded, color: Color(0xff1D3557)),
          title: const Text(
            "Ciudades",
            // style: themeCustom.textTheme.button
            //     ?.copyWith(fontSize: 16, color: Color(0xff1D3557)),
          ),
          onTap: () {
            Navigator.popAndPushNamed(context, CitiesPage.routeName);
          },
        ),
        ListTile(
          leading: const Icon(Icons.history, color: Color(0xff1D3557)),
          title: const Text(
            "Historial",
            // style: themeCustom.textTheme.button
            //     ?.copyWith(fontSize: 16, color: Color(0xff1D3557)),
          ),
          onTap: () {
            Navigator.popAndPushNamed(context, HistoryPage.routeName);
          },
        ),
        ListTile(
          leading: const Icon(Icons.security_rounded, color: Color(0xff1D3557)),
          title: const Text(
            "Seguridad",
            // style: themeCustom.textTheme.button
            //     ?.copyWith(fontSize: 16, color: Color(0xff1D3557)),
          ),
          onTap: () {
            // Navigator.popAndPushNamed(context, SecurityPage.routeName);
          },
        ),
        ListTile(
          leading: const Icon(Icons.settings, color: Color(0xff1D3557)),
          title: const Text(
            "Configuración",
            // style: themeCustom.textTheme.button
            // ?.copyWith(fontSize: 16, color: Color(0xff1D3557)),
          ),
          onTap: () {
            // Navigator.popAndPushNamed(context, SettingsPage.routeName);
          },
        ),
        ListTile(
          leading: const Icon(Icons.support_agent, color: Color(0xff1D3557)),
          title: const Text(
            "Soporte",
            // style: themeCustom.textTheme.button
            //     ?.copyWith(fontSize: 16, color: Color(0xff1D3557)),
          ),
          onTap: () {
            // Navigator.popAndPushNamed(context, SupportPage.routeName);
          },
        ),
        ListTile(
          leading: const Icon(Icons.article_rounded, color: Color(0xff1D3557)),
          title: const Text(
            "Redes",
            // style: themeCustom.textTheme.button
            //     ?.copyWith(fontSize: 16, color: Color(0xff1D3557)),
          ),
          onTap: () {
            // Navigator.popAndPushNamed(context, SocialNetworksPage.routeName);
          },
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.15,
        ),
        ListTile(
          leading: const Icon(Icons.close_outlined, color: Color(0xff1D3557)),
          title: const Text(
            "Cerrar sesión",
            // style: themeCustom.textTheme.button
            //     ?.copyWith(fontSize: 16, color: Color(0xff1D3557)),
          ),
          onTap: () async {
            await AuthenticationService(FirebaseAuth.instance, context)
                .singOut();
            Navigator.pushNamedAndRemoveUntil(
                context, LoginPage.routeName, (route) => false);
          },
        ),
      ],
    ),
  );
}
