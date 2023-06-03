// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:estimate_app_panel/constants.dart';
import 'package:estimate_app_panel/models/approvals.dart';
import 'package:estimate_app_panel/models/customer.dart';
import 'package:estimate_app_panel/models/given_estimate.dart';
import 'package:estimate_app_panel/widgets/buttons.dart';
import 'package:estimate_app_panel/widgets/paylist.dart';
import 'package:flutter/material.dart';

class PayCommision extends StatefulWidget {
  const PayCommision({super.key});

  @override
  State<PayCommision> createState() => _PayCommisionState();
}

TextEditingController commiC = TextEditingController();

class _PayCommisionState extends State<PayCommision> {
  String agentname = '';
  String customerName = '';
  String commision = '';
  String subTotal = '';
  String discount = '';
  String payAble = '';
  String tax = '';
  List<EstimateGiven> allestimate = [];
  Customers? customers;
  EstimateGiven? estimate;
  Approvals? approvals;
  Future getEstimate() async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('estimates')
        .where('status', isEqualTo: 'closed')
        .where('paidstatus', isEqualTo: 'unpaid')
        .get();
    if (snapshot.docs.isNotEmpty) {
      setState(() {
        allestimate = snapshot.docs
            .map((e) => EstimateGiven.fromMap(e.data() as Map<String, dynamic>))
            .toList();
        agentname = '';
        customerName = '';
        commision = '';
        subTotal = '';
        discount = '';
        payAble = '';
        tax = '';
      });
    }
    // QuerySnapshot customersnapshot = await FirebaseFirestore.instance
    //     .collection('customers')
    //     .where('id', isEqualTo: estimate!.customerId)
    //     .get();
    // if (customersnapshot.docs.isNotEmpty) {
    //   setState(() {
    //     customers = Customers.fromMap(
    //         customersnapshot.docs.first.data() as Map<String, dynamic>);
    //   });
    // }
  }

  @override
  void initState() {
    // getEstimate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kColorWhite,
        elevation: 0,
        title: const Text(
          'Pay Commision/All Estimate',
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
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: customers != null
                    ? ListView.builder(
                        // itemCount: allestimate.isEmpty ? 0 : allestimate.length,
                        itemCount: 20,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return PayList();
                          //return PayCommisionList();
                          // return ListTile(
                          //   shape: RoundedRectangleBorder(
                          //     side: const BorderSide(
                          //         color: Colors.grey, width: 1),
                          //     borderRadius: BorderRadius.circular(12),
                          //   ),
                          //   leading: customers!.pic!.isNotEmpty
                          //       ? CircleAvatar(
                          //           backgroundImage:
                          //               NetworkImage(customers!.pic!))
                          //       : CircleAvatar(
                          //           backgroundImage: NetworkImage(
                          //               'https://cdn-icons-png.flaticon.com/512/3135/3135715.png'),
                          //         ),
                          //   title: Text(customers!.fname! + customers!.lname!),
                          //   trailing: InkWell(
                          //     onTap: () {
                          //       getCommissionData(allestimate[index]);
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
                          // );
                        })
                    : Center(child: CircularProgressIndicator())),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.only(right: 25.0, bottom: 10, top: 10),
              child: Container(
                // height: 800,
                decoration: BoxDecoration(
                  color: Colors.white,
                  // ignore: prefer_const_literals_to_create_immutables
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
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      // ignore: prefer_const_literals_to_create_immutables
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
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 18.0),
                          child: SizedBox(
                            width: 300,
                            height: 37,
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
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      // ignore: prefer_const_literals_to_create_immutables
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
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 18.0),
                          child: SizedBox(
                            width: 300,
                            height: 37,
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
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      // ignore: prefer_const_literals_to_create_immutables
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
                      height: 8,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 18),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color: kUILight,
                              width: 1,
                            )),
                        height: 37,
                        width: 300,
                        child: TextFormField(
                          controller: commiC,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            // border: OutlineInputBorder(),

                            hintText: commision,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      // ignore: prefer_const_literals_to_create_immutables
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
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 18.0),
                          child: SizedBox(
                            width: 300,
                            height: 37,
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
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      // ignore: prefer_const_literals_to_create_immutables
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
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 18.0),
                          child: SizedBox(
                            width: 300,
                            height: 37,
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
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      // ignore: prefer_const_literals_to_create_immutables
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
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 18.0),
                          child: SizedBox(
                            width: 300,
                            height: 37,
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
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      // ignore: prefer_const_literals_to_create_immutables
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
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 18.0),
                          child: SizedBox(
                            width: 300,
                            height: 37,
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
                            ontap: () {
                              // payCommision();
                              // getEstimate();

                              // else {
                              //   showDialog(
                              //       context: context,
                              //       builder: (contex) {
                              //         return AlertDialog(
                              //           title: Text('Alert'),
                              //           content: Text(
                              //               'Select any estimate to pay comision'),
                              //           actions: const [CloseButton()],
                              //         );
                              //       });
                              // }
                            },
                          ),
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
    );
  }

  Future getCommissionData(EstimateGiven estimate) async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('approvals')
        .where('opid', isEqualTo: estimate.opid)
        .get();
    if (snapshot.docs.isNotEmpty) {
      setState(() {
        approvals = Approvals.fromMap(
            snapshot.docs.first.data() as Map<String, dynamic>);
      });
    }
    setState(() {
      agentname = approvals!.userName!;
      customerName = customers!.fname! + customers!.lname!;
      commision = '${estimate.agentcommision}';
      subTotal = '${estimate.subtotal}';
      discount = '${estimate.discount}';
      payAble = '${estimate.payable}';
      tax = '${estimate.tax}';
    });
  }

  Future payCommision() async {
    await FirebaseFirestore.instance
        .collection('estimates')
        .doc(allestimate[0].id)
        .update({'paidstatus': 'paid', 'agentcommision': commiC.text});
    showDialog(
        context: context,
        builder: (contex) {
          return AlertDialog(
            title: Text('Alert'),
            content: Text('Commision successfully paid'),
            actions: const [CloseButton()],
          );
        });
  }
}
