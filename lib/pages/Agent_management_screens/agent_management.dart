// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:estimate_app_panel/constants.dart';
import 'package:estimate_app_panel/models/approvals.dart';
import 'package:estimate_app_panel/pages/Agent_management_screens/active_agent_screen.dart';
import 'package:estimate_app_panel/pages/Agent_management_screens/all_agent_screen.dart';
import 'package:estimate_app_panel/pages/Agent_management_screens/inactive_agent_screen.dart';
import 'package:flutter/material.dart';

class AgentManegement extends StatefulWidget {
  const AgentManegement({Key? key}) : super(key: key);

  @override
  State<AgentManegement> createState() => _AgentManegementState();
}

List<Approvals> approvals = [];
int allagent = 0;
int activeagent = 0;
int inactiveagent = 0;

class _AgentManegementState extends State<AgentManegement> {
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
  }

  @override
  void initState() {
    getAgents();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDashboardBodyColor,
      appBar: AppBar(
        backgroundColor: kColorWhite,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: kColorBlue,
            )),
        title: const Text(
          'Agent Management',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 22,
            color: kColorBlue,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40),
        child: Column(
          children: [
            Wrap(
              children: [
                SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AllAgentScreen(),
                      ),
                    );
                  },
                  child: Container(
                    width: 323,
                    height: 154,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      color: kColorWhite,
                      // ignore: prefer_const_literals_to_create_immutables
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
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              Text(
                                'All Agents',
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
                                // ignore: prefer_const_literals_to_create_immutables
                                children: [
                                  Text(
                                    allagent.toString(),
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
                SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ActiveAgentScreen(),
                      ),
                    );
                  },
                  child: Container(
                    width: 323,
                    height: 154,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      color: kColorWhite,
                      // ignore: prefer_const_literals_to_create_immutables
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
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              Text(
                                'Active Agents',
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
                                // ignore: prefer_const_literals_to_create_immutables
                                children: [
                                  Text(
                                    activeagent.toString(),
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
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => InActiveAgentScreen(),
                      ),
                    );
                  },
                  child: Container(
                    width: 323,
                    height: 154,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      color: kColorWhite,
                      // ignore: prefer_const_literals_to_create_immutables
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
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              Text(
                                'InActive Agents',
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
                                // ignore: prefer_const_literals_to_create_immutables
                                children: [
                                  Text(
                                    inactiveagent.toString(),
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
          ],
        ),
      ),
    );
  }
}
