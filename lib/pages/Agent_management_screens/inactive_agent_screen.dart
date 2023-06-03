// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:estimate_app_panel/constants.dart';
import 'package:estimate_app_panel/dashboard/info_card.dart';
import 'package:estimate_app_panel/models/approvals.dart';
import 'package:estimate_app_panel/widgets/buttons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class InActiveAgentScreen extends StatefulWidget {
  const InActiveAgentScreen({Key? key}) : super(key: key);

  @override
  State<InActiveAgentScreen> createState() => _InActiveAgentScreenState();
}

class _InActiveAgentScreenState extends State<InActiveAgentScreen> {
  String name = '';
  String email = '';
  String imgurl = '';
  bool isVisible = false;
  List<Approvals> inactiveList = [];

  getAgents() async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('approvals')
        .where('active', isEqualTo: false)
        .get();
    if (snapshot.docs.isNotEmpty) {
      setState(() {
        inactiveList = snapshot.docs
            .map((e) => Approvals.fromMap(e.data() as Map<String, dynamic>))
            .toList();
        name = '';
        email = '';
        imgurl = '';
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
          'InActive Agent',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 22,
            color: kColorBlue,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 5,
              child: Container(
                child: SafeArea(
                  child: Column(
                    children: [
                      ListView.builder(
                          itemCount:
                              inactiveList.isEmpty ? 0 : inactiveList.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListTile(
                                horizontalTitleGap: 10,
                                minLeadingWidth: 20,
                                shape: RoundedRectangleBorder(
                                  side:
                                      BorderSide(color: Colors.black, width: 1),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                leading: inactiveList[index].photo!.isNotEmpty
                                    ? CircleAvatar(
                                        radius: 30,
                                        backgroundImage: NetworkImage(
                                            '${inactiveList[index].photo}',
                                            scale: 1),
                                      )
                                    : CircleAvatar(
                                        radius: 30,
                                        backgroundImage: NetworkImage(
                                            'https://cdn-icons-png.flaticon.com/512/3135/3135715.png',
                                            scale: 1),
                                      ),
                                title: Padding(
                                  padding: const EdgeInsets.only(left: 18.0),
                                  child: Text(
                                    '${inactiveList[index].userName}',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                                trailing: InkWell(
                                  onTap: () {
                                    getDetail(inactiveList[index]);
                                    isVisible = true;
                                  },
                                  child: Container(
                                    height: 50,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: Colors.black38,
                                        width: 1,
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'DETAIL',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.only(right: 35.0, top: 20),
                child: Container(
                  height: 500,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: kPrimary1,
                          spreadRadius: 1,
                          blurRadius: 5,
                          // ignore: prefer_const_constructors
                          offset: Offset(1, 2))
                    ],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  width: 250,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 30,
                          ),
                          Text(
                            'NAME:',
                            style: TextStyle(
                                color: kPrimary1,
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            width: 140,
                          ),
                          Text(
                            name,
                            style: TextStyle(
                                color: kPrimary1,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 30,
                          ),
                          Text(
                            'EMAIL:',
                            style: TextStyle(
                                color: kPrimary1,
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            width: 130,
                          ),
                          Text(
                            email,
                            style: TextStyle(
                                color: kPrimary1,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 30,
                          ),
                          Text(
                            'Thumbnail:',
                            style: TextStyle(
                                color: kPrimary1,
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            width: 50,
                          ),
                          Visibility(
                            visible: isVisible,
                            child: imgurl.isNotEmpty
                                ? Container(
                                    height: 100,
                                    width: 220,
                                    color: Colors.black,
                                    child: Image.network(imgurl),
                                  )
                                : Container(
                                    height: 100,
                                    width: 220,
                                    color: Colors.black,
                                  ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 110,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      FixedPrimary(
                        buttonText: 'Active',
                        ontap: () async {
                          if (isVisible == true) {
                            await FirebaseFirestore.instance
                                .collection('approvals')
                                .doc(inactiveList[0].id)
                                .update({
                              'active': true,
                            });
                            showDialog(
                                context: context,
                                builder: (contex) {
                                  return AlertDialog(
                                    title: Text('Alert'),
                                    content: Text('Agent Successfully active'),
                                    actions: [CloseButton()],
                                  );
                                });
                          } else {
                            showDialog(
                                context: context,
                                builder: (contex) {
                                  return AlertDialog(
                                    title: Text('Alert'),
                                    content: Text('Select any agent'),
                                    actions: [CloseButton()],
                                  );
                                });
                          }
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future getDetail(Approvals approvals) async {
    setState(() {
      name = approvals.userName!;
      email = approvals.email!;
      imgurl = approvals.photo!;
    });
  }
}
