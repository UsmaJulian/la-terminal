import 'package:flutter/material.dart';
import 'package:la_terminal/src/screens/login_page.dart';
import 'package:la_terminal/src/screens/register_page.dart';
import 'package:la_terminal/src/screens/users/cities_page.dart';
import 'package:la_terminal/src/screens/users/history_page.dart';
import 'package:la_terminal/src/screens/users/home_page.dart';
import 'package:la_terminal/src/screens/users/notification_page.dart';
import 'package:la_terminal/src/screens/users/profile_page.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    HomePage.routeName: (
      BuildContext context,
    ) =>
        const HomePage(),
    ProfilePage.routeName: (BuildContext context) => const ProfilePage(),
    CitiesPage.routeName: (BuildContext context) => const CitiesPage(),
    HistoryPage.routeName: (BuildContext context) => const HistoryPage(),
    // SecurityPage.routeName: (BuildContext context) => SecurityPage(),
    // SettingsPage.routeName: (BuildContext context) => SettingsPage(),
    // SupportPage.routeName: (BuildContext context) => SupportPage(),
    // SocialNetworksPage.routeName: (BuildContext context) =>
    //     SocialNetworksPage(),
    // PersonalInformationPage.routeName: (BuildContext context) =>
    //     PersonalInformationPage(),
    NotificationPage.routeName: (BuildContext context) =>
        const NotificationPage(),
    LoginPage.routeName: (BuildContext context) => const LoginPage(),
    RegisterPage.routeName: (BuildContext context) => const RegisterPage(),
    // TravelPage.routeName: (BuildContext context) => TravelPage(),
    // ShipPage.routeName: (BuildContext context) => ShipPage(),
    // HomeDriverPage.routeName: (BuildContext context) => HomeDriverPage(),
    // SignUpDriver.routeName: (BuildContext context) => SignUpDriver(),
  };
}
