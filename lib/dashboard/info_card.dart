// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:estimate_app_panel/models/approvals.dart';
import 'package:estimate_app_panel/models/customer.dart';
import 'package:estimate_app_panel/models/given_estimate.dart';
import 'package:estimate_app_panel/pages/Agent_management_screens/agent_management.dart';
import 'package:estimate_app_panel/pages/customer_&_record.dart';
import 'package:estimate_app_panel/pages/three_working_screen/close_work.dart';
import 'package:estimate_app_panel/pages/three_working_screen/open_to_work.dart';
import 'package:estimate_app_panel/pages/three_working_screen/upcomin_work.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class InfoCard extends StatefulWidget {
  const InfoCard({super.key});

  @override
  State<InfoCard> createState() => _InfoCardState();
}

class _InfoCardState extends State<InfoCard> {
  List<Approvals> approvals = [];
  List<EstimateGiven> allestimate = [];
  List<Customers> allcustomer = [];
  int allagent = 0;
  int activeagent = 0;
  int inactiveagent = 0;
  int openWork = 0;
  int upComingWork = 0;
  int closeWork = 0;
  int paidCommision = 0;
  int unpaidCommision = 0;
  int allcustomers = 0;
  getAgents() async {
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('approvals').get();
    if (snapshot.docs.isNotEmpty) {
      setState(() {
        approvals = snapshot.docs
            .map((e) => Approvals.fromMap(e.data() as Map<String, dynamic>))
            .toList();
        List<Approvals> active =
            approvals.where((element) => element.active == true).toList();
        List<Approvals> inactive =
            approvals.where((element) => element.active == false).toList();
        allagent = approvals.length;
        activeagent = active.length;
        inactiveagent = inactive.length;
      });
    }
    QuerySnapshot snapshotestimate =
        await FirebaseFirestore.instance.collection('estimates').get();
    if (snapshotestimate.docs.isNotEmpty) {
      setState(() {
        allestimate = snapshotestimate.docs
            .map((e) => EstimateGiven.fromMap(e.data() as Map<String, dynamic>))
            .toList();
        List<EstimateGiven> upcoming = allestimate
            .where((element) => element.status == 'upcoming')
            .toList();
        List<EstimateGiven> open = allestimate
            .where((element) => element.status == 'pending')
            .toList();
        List<EstimateGiven> close =
            allestimate.where((element) => element.status == 'closed').toList();
        List<EstimateGiven> paid = allestimate
            .where((element) => element.paidstatus == 'paid')
            .toList();
        List<EstimateGiven> unpaid = allestimate
            .where((element) => element.paidstatus == 'unpaid')
            .where((element) => element.status == 'closed')
            .toList();
        upComingWork = upcoming.length;
        openWork = open.length;
        closeWork = close.length;
        paidCommision = paid.length;
        unpaidCommision = unpaid.length;
      });
    }
    QuerySnapshot snapshotcustomer =
        await FirebaseFirestore.instance.collection('customers').get();
    if (snapshotcustomer.docs.isNotEmpty) {
      setState(() {
        allcustomer = snapshotcustomer.docs
            .map((e) => Customers.fromMap(e.data() as Map<String, dynamic>))
            .toList();
        allcustomers = allcustomer.length;
      });
    }
  }

  @override
  void initState() {
    getAgents();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Wrap(
            spacing: 25.0,
            runSpacing: 25.0,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AgentManegement(),
                    ),
                  );
                },
                child: Container(
                  width: 323,
                  height: 154,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    color: kColorWhite,
                    boxShadow: [
                      BoxShadow(
                        color: kBoxShadowColor,
                        offset: Offset(19, 19),
                        blurRadius: 47,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 34),
                    child: Column(
                      children: [
                        SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Total Agents',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: kUIDark,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Divider(
                          color: kPrimary1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  allagent.toString(),
                                  style: TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.w600,
                                    color: kPrimary1,
                                  ),
                                ),
                                Text(
                                  'Total Agents',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: kUILight2,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(width: 20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  activeagent.toString(),
                                  style: TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.w600,
                                    color: kPrimary1,
                                  ),
                                ),
                                Text(
                                  'Active',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: kUILight2,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(width: 20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  inactiveagent.toString(),
                                  style: TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.w600,
                                    color: kPrimary1,
                                  ),
                                ),
                                Text(
                                  'InActive',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: kUILight2,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              //SizedBox(width: 25),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OpenWork(),
                    ),
                  );
                },
                child: Container(
                  width: 323,
                  height: 154,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    color: kColorWhite,
                    boxShadow: [
                      BoxShadow(
                        color: kBoxShadowColor,
                        offset: Offset(19, 19),
                        blurRadius: 47,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 34),
                    child: Column(
                      children: [
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Total Open to work',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: kUIDark,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 5),
                        Divider(
                          color: kPrimary1,
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  openWork.toString(),
                                  // '200',
                                  style: TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.w600,
                                    color: kPrimary1,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UpcomingWork(),
                    ),
                  );
                },
                child: Container(
                  width: 323,
                  height: 154,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    color: kColorWhite,
                    boxShadow: [
                      BoxShadow(
                        color: kBoxShadowColor,
                        offset: Offset(19, 19),
                        blurRadius: 47,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 34),
                    child: Column(
                      children: [
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total Upcoming work',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: kUIDark,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 5),
                        Divider(
                          color: kPrimary1,
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  upComingWork.toString(),
                                  style: TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.w600,
                                    color: kPrimary1,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
          child: Wrap(
            spacing: 25.0,
            runSpacing: 25.0,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CloseWork(),
                    ),
                  );
                },
                child: Container(
                  width: 323,
                  height: 154,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    color: kColorWhite,
                    boxShadow: [
                      BoxShadow(
                        color: kBoxShadowColor,
                        offset: Offset(19, 19),
                        blurRadius: 47,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 34),
                    child: Column(
                      children: [
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Close Work',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: kUIDark,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 5),
                        Divider(
                          color: kPrimary1,
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  closeWork.toString(),
                                  style: TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.w600,
                                    color: kPrimary1,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                width: 323,
                height: 154,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  color: kColorWhite,
                  boxShadow: [
                    BoxShadow(
                      color: kBoxShadowColor,
                      offset: Offset(19, 19),
                      blurRadius: 47,
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 34),
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Commision',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: kUIDark,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      Divider(
                        color: kPrimary1,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                paidCommision.toString(),
                                style: TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.w600,
                                  color: kPrimary1,
                                ),
                              ),
                              Text(
                                'Paid',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: kUILight2,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: 25),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                unpaidCommision.toString(),
                                style: TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.w600,
                                  color: kPrimary1,
                                ),
                              ),
                              Text(
                                'UnPaid',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: kUILight2,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CustomersAndRecod()));
                },
                child: Container(
                  width: 323,
                  height: 154,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    color: kColorWhite,
                    boxShadow: [
                      BoxShadow(
                        color: kBoxShadowColor,
                        offset: Offset(19, 19),
                        blurRadius: 47,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 34),
                    child: Column(
                      children: [
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Total Customer',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: kUIDark,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 5),
                        Divider(
                          color: kPrimary1,
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  allcustomers.toString(),
                                  style: TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.w600,
                                    color: kPrimary1,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(width: 25),
            ],
          ),
        ),
      ],
    );
  }
}
