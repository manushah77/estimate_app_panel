// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:estimate_app_panel/dashboard/info_card.dart';
import 'package:flutter/material.dart';
import '../constants.dart';

class MyDashboard extends StatefulWidget {
  const MyDashboard({super.key});

  @override
  State<MyDashboard> createState() => _MyDashboardState();
}

class _MyDashboardState extends State<MyDashboard> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kDashboardBodyColor,
        appBar: AppBar(
          backgroundColor: kColorWhite,
          elevation: 0,
          title: const Text(
            'Dashboard',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 22,
              color: kColorBlue,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 40.5),
              child: Row(
                children: [
                  Text(
                    'Admin',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: kColorBlack),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://thumbs.dreamstime.com/b/businessman-profile-icon-male-portrait-flat-design-vector-illustration-47075259.jpg'),
                  ),
                ],
              ),
            ),
          ],
        ),
        body: Wrap(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 1,
              width: MediaQuery.of(context).size.width / 1.148,
              child: ListView(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 43,
                      ),
                      InfoCard(),
                      SizedBox(height: 30),
                      SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
