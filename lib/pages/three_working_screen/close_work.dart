// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:estimate_app_panel/constants.dart';
import 'package:estimate_app_panel/models/given_estimate.dart';
import 'package:estimate_app_panel/widgets/estimate_list.dart';
import 'package:flutter/material.dart';

class CloseWork extends StatefulWidget {
  final List<EstimateGiven>? allestimate;
  const CloseWork({Key? key, this.allestimate}) : super(key: key);

  @override
  State<CloseWork> createState() => _CloseWorkState();
}

class _CloseWorkState extends State<CloseWork> {
  List<EstimateGiven> closeWork = [];

  Future getData() async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('estimates')
        .where('status', isEqualTo: 'closed')
        .get();
    if (snapshot.docs.isNotEmpty) {
      setState(() {
        closeWork = snapshot.docs
            .map((e) => EstimateGiven.fromMap(e.data() as Map<String, dynamic>))
            .toList();
      });
    }
  }

  @override
  void initState() {
    getData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDashboardBodyColor,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: kColorBlue,
            )),
        backgroundColor: kColorWhite,
        elevation: 0,
        title: const Text(
          'Close Work',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 22,
            color: kColorBlue,
          ),
        ),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 20,
          ),
          ListView.builder(
              itemCount: closeWork.isEmpty ? 0 : closeWork.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: EstimateList(
                      estimate: closeWork[index],
                    ));
              }),
        ],
      ),
    );
  }
}
