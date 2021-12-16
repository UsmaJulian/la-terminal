import 'package:flutter/material.dart';
import 'package:la_terminal/src/providers/user_info_provider.dart';
import 'package:la_terminal/src/widgets/users/custom_profile_appBar_widget.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  static const routeName = 'profilePage';

  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    // ignore: unused_local_variable
    TabController _tabController = TabController(vsync: this, length: 3);
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _kTabPages = <Widget>[
      _buildProfileInfo(context),
      _buildViajesInfo(),
      _buildEnviosInfo()
    ];
    final userData = Provider.of<UserInfoProvider>(context).getUserData;
    final _ktabs = <Tab>[
      const Tab(
        text: "Tu Perfil",
      ),
      const Tab(
        text: "Tus Viajes",
      ),
      const Tab(
        text: "Tus Envíos",
      ),
    ];
    return Scaffold(
        appBar: customProfileAppBarWidget(context, "Perfil"),
        body: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  SizedBox(width: 30.0),
                  SizedBox(
                    width: 150.0,
                    height: 150.0,
                    child: CircleAvatar(
                      backgroundImage: AssetImage(
                          "assets/bgImage/5eb95cad17f3c600044a2912.png"),
                    ),
                  ),
                  Icon(
                    Icons.check_circle_rounded,
                    size: 40.0,
                  ),
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.7,
                height: MediaQuery.of(context).size.height * 0.1,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(30.0)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      userData?['name'] ?? '',
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.star,
                          size: 15.0,
                          color: Colors.white,
                        ),
                        Icon(
                          Icons.star,
                          size: 15.0,
                          color: Colors.white,
                        ),
                        Icon(
                          Icons.star,
                          size: 15.0,
                          color: Colors.white,
                        ),
                        Icon(
                          Icons.star,
                          size: 15.0,
                          color: Colors.white,
                        ),
                        Icon(
                          Icons.star,
                          size: 15.0,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Text('Id Usuario: ${userData?['uid'] ?? ''}'),
              _buildProfileBody(context, _ktabs, _kTabPages)
            ],
          ),
        ));
  }

  _buildProfileBody(
      BuildContext context, List<Tab> ktabs, List<Widget> _kTabPages) {
    return DefaultTabController(
      length: ktabs.length,
      child: SizedBox(
        width: double.infinity,
        height: 300.0,
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.95,
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(20.0)),
              child: TabBar(
                labelColor: Colors.black,
                tabs: ktabs,
                indicatorColor: Colors.black,
                indicatorPadding: const EdgeInsets.symmetric(horizontal: 15.0),
                controller: _tabController,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: _kTabPages,
              ),
            ),
          ],
        ),
      ),
    );
  }

  static _buildProfileInfo(BuildContext context) {
    final userData = Provider.of<UserInfoProvider>(context).getUserData;
    return Container(
      padding: const EdgeInsets.all(15.0),
      child: Text(
        userData?['descripcion'] ?? '',
        textAlign: TextAlign.justify,
      ),
    );
  }

  static _buildViajesInfo() {
    return Container(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Icon(Icons.location_on),
              Text('Manizales, Caldas'),
              Text("Fecha de viaje")
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Icon(Icons.location_on),
              Text('Bogotá, Cundinamarca'),
              Text("Fecha de viaje")
            ],
          ),
        ],
      ),
    );
  }

  static _buildEnviosInfo() {
    return Container(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Icon(Icons.location_on),
              Text('Manizales, Caldas'),
              Text("Fecha de viaje")
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Icon(Icons.location_on),
              Text('Bogotá, Cundinamarca'),
              Text("Fecha de viaje")
            ],
          ),
        ],
      ),
    );
  }
}
