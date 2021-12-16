// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:la_terminal/src/providers/user_info_provider.dart';
import 'package:la_terminal/src/screens/users/notification_page.dart';
import 'package:provider/provider.dart';

AppBar customProfileAppBarWidget(BuildContext context, String title) {
  final userData = Provider.of<UserInfoProvider>(context).getUserData;
  return AppBar(
    automaticallyImplyLeading: false,
    leading: Container(
      margin: const EdgeInsets.only(top: 8.0, right: 8.0, bottom: 8.0, left: 3),
      decoration: BoxDecoration(
          color: const Color(0xff457B9D),
          borderRadius:const BorderRadius.only(
            topRight: Radius.circular(20.0),
            bottomRight: Radius.circular(20.0),
            bottomLeft: Radius.circular(10.0),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.white.withOpacity(0.1),
              spreadRadius: 3,
              blurRadius: 5,
              offset: Offset(2, 0),
            )
          ]),
      child: IconButton(
        icon:const Icon(Icons.arrow_back_rounded),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    ),
    elevation: 0.0,
    backgroundColor:const Color(0xff1D3557),
    title: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style:const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
       Text(
          userData?['name']??'',
          style:const TextStyle(
              color: Color(0xffA8DADC),
              fontWeight: FontWeight.normal,
              fontSize: 12.0),
        ),
      ],
    ),
    actions: [
      Container(
        child: IconButton(
          icon:const Icon(
            Icons.notifications,
            color: Colors.white,
            size: 30.0,
          ),
          onPressed: () =>
              Navigator.of(context).pushNamed(NotificationPage.routeName),
        ),
      ),
    ],
  );
}
