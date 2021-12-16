import 'package:flutter/material.dart';
import 'package:la_terminal/src/providers/user_info_provider.dart';
import 'package:la_terminal/src/widgets/users/custom_general_appbar_widget.dart';
import 'package:provider/provider.dart';

class NotificationPage extends StatefulWidget {
  static const routeName = 'notificationPage';

  const NotificationPage({Key? key}) : super(key: key);

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<UserInfoProvider>(context).getUserData;
    return Scaffold(
      appBar: customGeneralAppBarWidget(context, 'Notificaciones'),
      body: Container(),
    );
  }
}
