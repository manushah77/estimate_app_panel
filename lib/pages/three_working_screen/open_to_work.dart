// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:estimate_app_panel/constants.dart';
import 'package:estimate_app_panel/models/given_estimate.dart';
import 'package:estimate_app_panel/widgets/estimate_list.dart';
import 'package:flutter/material.dart';

class OpenWork extends StatefulWidget {
  List<EstimateGiven>? allestimate;
  OpenWork({Key? key, this.allestimate}) : super(key: key);

  @override
  State<OpenWork> createState() => _OpenWorkState();
}

class _OpenWorkState extends State<OpenWork> {
  List<EstimateGiven> openWork = [];

  Future getData() async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('estimates')
        .where('status', isEqualTo: 'pending')
        .get();
    if (snapshot.docs.isNotEmpty) {
      setState(() {
        openWork = snapshot.docs
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
        backgroundColor: kColorWhite,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: kColorBlue,
            )),
        elevation: 0,
        title: const Text(
          'Open To Work',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 22,
            color: kColorBlue,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            openWork.isNotEmpty
                ? ListView.builder(
                    itemCount: openWork.isEmpty ? 0 : openWork.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: EstimateList(estimate: openWork[index]),
                      );
                    })
                : Center(
                    child: CircularProgressIndicator(),
                  )
          ],
        ),
      ),
    );
  }
}
