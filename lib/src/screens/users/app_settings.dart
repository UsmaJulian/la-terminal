import 'package:app_settings/app_settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:la_terminal/src/widgets/users/custom_profile_appBar_widget.dart';

class SettingsPage extends StatefulWidget {
  static const routeName = 'settingsPage';

  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  void initState() {
    /// Call out to intialize platform state.
    initPlatformState();
    super.initState();
  }

  /// Initialize platform state.
  Future<void> initPlatformState() async {
    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customProfileAppBarWidget(context, 'Configuraciones'),
      body: Column(
        children: [
          GestureDetector(
            child: Container(
              margin: const EdgeInsets.only(top: 23, left: 10),
              child: const ListTile(
                leading: Icon(Icons.wifi),
                title: Text(
                  'WIFI',
                  // style: themeCustom.textTheme.button,
                ),
                trailing: Icon(CupertinoIcons.right_chevron),
              ),
            ),
            onTap: () => AppSettings.openWIFISettings(),
          ),
          GestureDetector(
            child: Container(
              margin: const EdgeInsets.only(top: 23, left: 10),
              child: const ListTile(
                leading: Icon(Icons.location_on_rounded),
                title: Text(
                  'localización',
                  // style: themeCustom.textTheme.button,
                ),
                trailing: Icon(CupertinoIcons.right_chevron),
              ),
            ),
            onTap: () => AppSettings.openLocationSettings(),
          ),
          GestureDetector(
            child: Container(
              margin: const EdgeInsets.only(top: 23, left: 10),
              child: const ListTile(
                leading: Icon(Icons.security_update),
                title: Text(
                  'Seguridad',
                  // style: themeCustom.textTheme.button,
                ),
                trailing: Icon(CupertinoIcons.right_chevron),
              ),
            ),
            onTap: () => AppSettings.openSecuritySettings(),
          ),
          GestureDetector(
            child: Container(
              margin: const EdgeInsets.only(top: 23, left: 10),
              child: const ListTile(
                leading: Icon(Icons.notifications_active_rounded),
                title: Text(
                  'Notificaciones',
                  // style: themeCustom.textTheme.button,
                ),
                trailing: Icon(CupertinoIcons.right_chevron),
              ),
            ),
            onTap: () => AppSettings.openNotificationSettings(),
          ),
          GestureDetector(
            child: Container(
              margin: const EdgeInsets.only(top: 23, left: 10),
              child: const ListTile(
                leading: Icon(Icons.storage_rounded),
                title: Text(
                  'Almacenamiento interno',
                  // style: themeCustom.textTheme.button,
                ),
                trailing: Icon(CupertinoIcons.right_chevron),
              ),
            ),
            onTap: () => AppSettings.openInternalStorageSettings(),
          ),
          GestureDetector(
            child: Container(
              margin: const EdgeInsets.only(top: 23, left: 10),
              child: const ListTile(
                leading: Icon(Icons.volume_up_outlined),
                title: Text(
                  'Sonido',
                  // style: themeCustom.textTheme.button,
                ),
                trailing: Icon(CupertinoIcons.right_chevron),
              ),
            ),
            onTap: () => AppSettings.openSoundSettings(),
          ),
        ],
      ),
    );
  }
}
