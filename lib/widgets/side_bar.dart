// ignore_for_file: prefer_final_fields, prefer_const_constructors

import 'package:estimate_app_panel/pages/pay.dart';
import 'package:estimate_app_panel/pages/pay_commision.dart';
import 'package:estimate_app_panel/pages/add_material.dart';
import 'package:estimate_app_panel/pages/add_service.dart';
import 'package:estimate_app_panel/pages/customer_&_record.dart';
import 'package:estimate_app_panel/pages/login.dart';
import 'package:estimate_app_panel/pages/my_dashboard.dart';
import 'package:estimate_app_panel/pages/setting.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../constants.dart';

class SideBar extends StatefulWidget {
  const SideBar({super.key});

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  int _selectedDestination = 0;

  static List<Widget> _widgetOptions = <Widget>[
    MyDashboard(),
    AddService(),
    AddMaterial(),
    PayCommision(),
    Setting(),
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 165,
          child: Drawer(
            elevation: 1,
            backgroundColor: kColorWhite,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Image.asset(
                    'assets/images/esst.png',
                    width: 90,
                    height: 62,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  ListTile(
                    selectedTileColor: Color(0xFFE9F2FE),
                    selectedColor: kPrimary1,
                    horizontalTitleGap: 0.0,
                    title: const Text(
                      'Dashboard',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    leading: Image.asset(
                      'assets/icons/homei.png',
                      scale: 4,
                      color: kUIDark,
                    ),
                    selected: _selectedDestination == 0,
                    onTap: () => selectDestination(0),
                  ),
                  ListTile(
                    selectedTileColor: Color(0xFFE9F2FE),
                    selectedColor: kPrimary1,
                    horizontalTitleGap: 0.0,
                    title: const Text(
                      'Add Service',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    leading: Image.asset(
                      'assets/icons/offr.png',
                      scale: 3,
                      color: kUIDark,
                    ),
                    selected: _selectedDestination == 1,
                    onTap: () => selectDestination(1),
                  ),
                  ListTile(
                    selectedTileColor: Color(0xFFE9F2FE),
                    selectedColor: kPrimary1,
                    horizontalTitleGap: 0.0,
                    title: const Text(
                      'Add Materail',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    leading: Icon(
                      Icons.construction_outlined,
                      color: kUIDark,
                    ),
                    selected: _selectedDestination == 2,
                    onTap: () => selectDestination(2),
                  ),
                  ListTile(
                    selectedTileColor: Color(0xFFE9F2FE),
                    selectedColor: kPrimary1,
                    horizontalTitleGap: 0.0,
                    title: const Text(
                      'Pay Commision',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    leading: Image.asset(
                      'assets/icons/people.png',
                      scale: 3,
                      color: kUIDark,
                    ),
                    selected: _selectedDestination == 3,
                    onTap: () => selectDestination(3),
                  ),
                  ListTile(
                    selectedTileColor: Color(0xFFE9F2FE),
                    selectedColor: kPrimary1,
                    horizontalTitleGap: 0.0,
                    title: const Text(
                      'Setting',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    leading: Icon(
                      Icons.settings,
                      color: kUIDark,
                    ),
                    selected: _selectedDestination == 4,
                    onTap: () => selectDestination(4),
                  ),
                  SizedBox(height: 290),
                  InkWell(
                    onTap: () {
                      FirebaseAuth.instance.signOut();
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginPage(),
                        ),
                      );
                    },
                    child: ListTile(
                      selectedTileColor: Color(0xFFE9F2FE),
                      selectedColor: kPrimary1,
                      horizontalTitleGap: 0.0,
                      title: const Text(
                        'Log out',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      leading: Image.asset(
                        'assets/icons/Logout.png',
                        scale: 4,
                        color: kUIDark,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          child: Scaffold(
            body: _widgetOptions.elementAt(_selectedDestination),
          ),
        ),
      ],
    );
  }

  void selectDestination(int index) {
    setState(() {
      _selectedDestination = index;
    });
  }
}
