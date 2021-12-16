
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:la_terminal/src/providers/user_info_provider.dart';

import 'package:la_terminal/src/routes/get_application_routes.dart';
import 'package:la_terminal/src/screens/login_page.dart';
import 'package:la_terminal/src/utils/navigator_service_util.dart';
import 'package:provider/provider.dart';

import 'src/providers/cities_selection_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserInfoProvider()),
        ChangeNotifierProvider(create: (context) => CitiesSelection()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: NavigationService.navigationKey,
        // theme: themeCustom,
        title: 'La Terminal',
        initialRoute: LoginPage.routeName,
        routes: getApplicationRoutes(),
      ),
    );
  }
}
