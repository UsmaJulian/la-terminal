// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:la_terminal/src/providers/user_info_provider.dart';

import 'package:la_terminal/src/widgets/custom_share.dart';
import 'package:la_terminal/src/widgets/users/custom_appbar_widget.dart';
import 'package:la_terminal/src/widgets/users/custom_build_content_widgets.dart';
import 'package:la_terminal/src/widgets/users/custom_menu_drawer_widget.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  static const routeName = 'homePage';

  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  TabController? _tabController;
  late List<Widget> _kTabPages;
  // <Widget>[buildContentViajes(), buildContentEnvios()];

  @override
  void initState() {
    super.initState();
    // ignore: unused_local_variable
    TabController _tabController = TabController(vsync: this, length: 2);
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userId = Provider.of<UserInfoProvider>(context).getUserId;

    // print("este es el:$userId");

    FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      Map<String, dynamic> data =
          documentSnapshot.data()! as Map<String, dynamic>;
      if (data.isNotEmpty) {
        Provider.of<UserInfoProvider>(context, listen: false).setUserInfo(data);
      }
    });

    _kTabPages = <Widget>[
      const BuildContentViajes(),
      const BuildContentEnvios(),
    ];
    final _ktabs = <Tab>[
      Tab(
        iconMargin: EdgeInsets.zero,
        icon: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/icons/car.svg',
              color: const Color(0xff1D3557),
              height: 50,
              width: 50,
            ),
            const SizedBox(
              width: 8.0,
            ),
            SvgPicture.asset(
              'assets/icons/motorcycle.svg',
              color: const Color(0xff1D3557),
              height: 50,
              width: 50,
            ),
          ],
        ),
        child: Container(
          margin: const EdgeInsets.only(bottom: 5.0),
          child: const Text(
            "VIAJAR",
            style: TextStyle(
                color: Color(0xff1D3557),
                fontFamily: 'OpenSans',
                fontSize: 10,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.5),
          ),
        ),
      ),
      Tab(
        iconMargin: EdgeInsets.zero,
        icon: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/icons/package.svg',
              height: 30,
              width: 30,
              color: const Color(0xff1D3557),
            ),
            const SizedBox(
              width: 8.0,
            ),
            SvgPicture.asset(
              'assets/icons/delivery-truck.svg',
              height: 50,
              width: 50,
              color: const Color(0xff1D3557),
            ),
          ],
        ),
        child: Container(
          margin: const EdgeInsets.only(bottom: 5.0),
          child: const Text(
            "ENVIAR",
            style: TextStyle(
                color: Color(0xff1D3557),
                fontFamily: 'OpenSans',
                fontSize: 10,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.5),
          ),
        ),
      ),
    ];
    return SafeArea(
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        key: _scaffoldKey,
        appBar: customAppBarWidget(
          context,
          _scaffoldKey,
        ),
        drawer: customMenuDrawer(context),
        body: _buildHomeBody(context, _ktabs),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 10.0),
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(300),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white.withOpacity(0.1),
                    spreadRadius: 3,
                    blurRadius: 7,
                    offset: const Offset(2, 0),
                  )
                ],
              ),
              child: FloatingActionButton(
                tooltip: 'Compartir',
                mini: true,
                backgroundColor: const Color(0xff457B9D),
                heroTag: 'homefloat',
                child: SvgPicture.asset(
                  'assets/icons/share.svg',
                  color: Colors.white,
                  height: 25,
                  width: 25,
                ),
                onPressed: () {
                  share(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildHomeBody(BuildContext context, List<Tab> _ktabsL) {
    return DefaultTabController(
      length: _ktabsL.length,
      child: Container(
        padding: const EdgeInsets.only(top: 20.0),
        color: const Color(0xffEEF9F6),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: const Text(
                "Selecciona lo que deseas hacer hoy: ",
                style: TextStyle(
                    color: Color(0xff1D3557),
                    fontFamily: 'OpenSans',
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.5),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Container(
              margin: const EdgeInsets.only(right: 10.0, left: 10.0),
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0),
                      bottomLeft: Radius.circular(20.0),
                      topLeft: Radius.circular(20.0)),
                  color: const Color(0xffEEF9F6),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 2,
                      offset: const Offset(0, 1),
                    )
                  ]),
              child: TabBar(
                tabs: _ktabsL,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  border: Border.all(
                    color: const Color(0xffA8DADC),
                    width: 2,
                  ),
                ),
                controller: _tabController,
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: _kTabPages,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                  top: 14.0, right: 10.0, bottom: 15.0, left: 80.0),
              decoration: BoxDecoration(
                  color: const Color(0xff1D3557),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 7,
                      offset: const Offset(2, 0),
                    )
                  ]),
              height: 60,
              width: double.infinity,
              child: const Text(
                'LA TERMINAL',
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'OpenSans',
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.5),
              ),
            )
          ],
        ),
      ),
    );
  }
}
