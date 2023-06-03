// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:estimate_app_panel/models/approvals.dart';
import 'package:estimate_app_panel/models/customer.dart';
import 'package:estimate_app_panel/models/given_estimate.dart';
import 'package:estimate_app_panel/widgets/pay_commision_list.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import '../widgets/buttons.dart';

class PayCommision11 extends StatefulWidget {
  const PayCommision11({super.key});

  @override
  State<PayCommision11> createState() => _PayCommision11State();
}

class _PayCommision11State extends State<PayCommision11> {
  List<EstimateGiven> unpaidcommision = [];

  //Customers? customer;
  //EstimateGiven? estimate;
  // Approvals? approvals;

  String agentname = '';
  String customerName = '';
  String commision = '';
  String subTotal = '';
  String discount = '';
  String payAble = '';
  String tax = '';
  Future getData() async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('estimates')
        .where('paidstatus', isEqualTo: 'unpaid')
        .where('status', isEqualTo: 'closed')
        .get();
    if (snapshot.docs.isNotEmpty) {
      setState(() {
        // estimate = EstimateGiven.fromMap(
        //     snapshot.docs.first.data() as Map<String, dynamic>);
        unpaidcommision = snapshot.docs
            .map((e) => EstimateGiven.fromMap(e.data() as Map<String, dynamic>))
            .toList();

        // agentname = '';
        // customerName = '';
        // commision = '';
        // subTotal = '';
        // discount = '';
        // payAble = '';
        // tax = '';
      });
    }
    // QuerySnapshot agentsnapshot = await FirebaseFirestore.instance
    //     .collection('approvals')
    //     .where('status', isEqualTo: true)
    //     //.where('opid', isEqualTo: estimate!.customerId)
    //     .get();
    // if (agentsnapshot.docs.isNotEmpty) {
    //   setState(() {
    //     approvals = Approvals.fromMap(
    //         agentsnapshot.docs.first.data() as Map<String, dynamic>);
    //   });
    // }
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kColorWhite,
          elevation: 0,
          title: const Text(
            'Pay Commision',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 22,
              color: kColorBlue,
            ),
          ),
        ),
        body: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 5,
              child: Column(
                children: [
                  SizedBox(
                    height: 800,
                    child: ListView.builder(
                        // itemCount: unpaidcommision.isEmpty
                        //     ? 0

                        //     : unpaidcommision.length,
                        itemCount: 10,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              margin: EdgeInsets.all(5.0),
                              color: Colors.red,
                            ),
                            //PayCommisionList(),
                            // ListTile(
                            //   horizontalTitleGap: 10,
                            //   minLeadingWidth: 20,
                            //   shape: RoundedRectangleBorder(
                            //     side:
                            //         BorderSide(color: Colors.black, width: 1),
                            //     borderRadius: BorderRadius.circular(12),
                            //   ),
                            //   leading: customer!.pic!.isEmpty
                            //       ? CircleAvatar(
                            //           radius: 30,
                            //           backgroundImage: NetworkImage(
                            //               'https://cdn-icons-png.flaticon.com/512/3135/3135715.png'),
                            //         )
                            //       : CircleAvatar(
                            //           radius: 30,
                            //           backgroundImage:
                            //               NetworkImage('${customer!.pic}')),
                            //   title: Padding(
                            //     padding: const EdgeInsets.only(left: 18.0),
                            //     child: Text(
                            //       customer!.fname!,
                            //       style: TextStyle(
                            //         color: Colors.black,
                            //         fontSize: 16,
                            //         fontWeight: FontWeight.w400,
                            //       ),
                            //     ),
                            //   ),
                            //   trailing: InkWell(
                            //     onTap: () {
                            //       // getCommissionData(unpaidcommision[index]);
                            //     },
                            //     child: Container(
                            //       height: 50,
                            //       width: 100,
                            //       decoration: BoxDecoration(
                            //         color: Colors.transparent,
                            //         borderRadius: BorderRadius.circular(10),
                            //         border: Border.all(
                            //           color: Colors.black38,
                            //           width: 1,
                            //         ),
                            //       ),
                            //       child: Center(
                            //         child: Text(
                            //           'Pay Commision',
                            //           style: TextStyle(
                            //             color: kPrimary1,
                            //             fontSize: 12,
                            //             fontWeight: FontWeight.w600,
                            //           ),
                            //         ),
                            //       ),
                            //     ),
                            //   ),
                            // ),
                          );
                        }),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.only(right: 35.0, top: 20),
                child: Container(
                  height: 800,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: kPrimary1,
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: Offset(1, 2))
                    ],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  width: 250,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 30,
                          ),
                          Text(
                            'Agent Name:',
                            style: TextStyle(
                                color: kPrimary1,
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 18.0),
                            child: SizedBox(
                              width: 300,
                              height: 40,
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                      color: kUILight,
                                      width: 1,
                                    )),
                                child: Center(
                                  child: Text(
                                    agentname,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                            ),
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
                            'Customer Name:',
                            style: TextStyle(
                                color: kPrimary1,
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 18.0),
                            child: SizedBox(
                              width: 300,
                              height: 40,
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                      color: kUILight,
                                      width: 1,
                                    )),
                                child: Center(
                                  child: Text(
                                    customerName,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                            ),
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
                            'Commision:',
                            style: TextStyle(
                                color: kPrimary1,
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 18.0),
                            child: SizedBox(
                              width: 300,
                              height: 40,
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                      color: kUILight,
                                      width: 1,
                                    )),
                                child: Center(
                                  child: Text(
                                    commision,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                            ),
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
                            'Sub Total:',
                            style: TextStyle(
                                color: kPrimary1,
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 18.0),
                            child: SizedBox(
                              width: 300,
                              height: 40,
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                      color: kUILight,
                                      width: 1,
                                    )),
                                child: Center(
                                  child: Text(
                                    subTotal,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                            ),
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
                            'Discount:',
                            style: TextStyle(
                                color: kPrimary1,
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 18.0),
                            child: SizedBox(
                              width: 300,
                              height: 40,
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                      color: kUILight,
                                      width: 1,
                                    )),
                                child: Center(
                                  child: Text(
                                    discount,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 30,
                          ),
                          Text(
                            'Pay Able:',
                            style: TextStyle(
                                color: kPrimary1,
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 18.0),
                            child: SizedBox(
                              width: 300,
                              height: 40,
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                      color: kUILight,
                                      width: 1,
                                    )),
                                child: Center(
                                  child: Text(
                                    payAble,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                            ),
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
                            'Tax:',
                            style: TextStyle(
                                color: kPrimary1,
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 18.0),
                            child: SizedBox(
                              width: 300,
                              height: 40,
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                      color: kUILight,
                                      width: 1,
                                    )),
                                child: Center(
                                  child: Text(
                                    tax,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 18.0),
                            child: FixedPrimary(
                              buttonText: 'Pay Commision',
                              ontap: () {},
                            ),
                          ),
                        ],
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

  // Future getCommissionData(EstimateGiven estimate) async {
  //   QuerySnapshot snapshot = await FirebaseFirestore.instance
  //       .collection('customers')
  //       .where('id', isEqualTo: estimate.customerId)
  //       .get();
  //   if (snapshot.docs.isNotEmpty) {
  //     setState(() {
  //       // customersList = snapshot.docs
  //       //     .map((e) => Customers.fromMap(e.data() as Map<String, dynamic>))
  //       //     .toList();
  //       customer = Customers.fromMap(
  //           snapshot.docs.first.data() as Map<String, dynamic>);
  //     });
  //   }
  //   setState(() {
  //     agentname = approvals!.userName!;
  //     customerName = customer!.fname! + customer!.lname!;
  //     commision = '${estimate.agentcommision}';
  //     subTotal = '${estimate.subtotal}';
  //     discount = '${estimate.discount}';
  //     payAble = '${estimate.payable}';
  //     tax = '${estimate.tax}';
  //   });
  // }
}
