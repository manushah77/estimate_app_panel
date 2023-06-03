// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:estimate_app_panel/models/given_estimate.dart';
import 'package:estimate_app_panel/widgets/estimate_list.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class UpcomingWork extends StatefulWidget {
  final List<EstimateGiven>? allestimate;
  const UpcomingWork({Key? key, this.allestimate}) : super(key: key);

  @override
  State<UpcomingWork> createState() => _UpcomingWorkState();
}

class _UpcomingWorkState extends State<UpcomingWork> {
  List<EstimateGiven> upcomingWork = [];

  Future getData() async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('estimates')
        .where('status', isEqualTo: 'upcoming')
        .get();
    if (snapshot.docs.isNotEmpty) {
      setState(() {
        upcomingWork = snapshot.docs
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
          'UpComing Work',
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
            upcomingWork.isNotEmpty
                ? ListView.builder(
                    itemCount: upcomingWork.isEmpty ? 0 : upcomingWork.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: EstimateList(
                          estimate: upcomingWork[index],
                        ),
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
