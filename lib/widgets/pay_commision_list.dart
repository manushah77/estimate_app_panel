// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:estimate_app_panel/constants.dart';
import 'package:estimate_app_panel/models/approvals.dart';
import 'package:estimate_app_panel/models/customer.dart';
import 'package:estimate_app_panel/models/given_estimate.dart';
import 'package:flutter/material.dart';

class PayCommisionList extends StatefulWidget {
  const PayCommisionList({Key? key}) : super(key: key);

  @override
  State<PayCommisionList> createState() => _PayCommisionListState();
}

class _PayCommisionListState extends State<PayCommisionList> {
  Customers? customer;
  EstimateGiven? estimate;
  Approvals? approvals;
  Future getData() async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('estimates')
        .where('paidstatus', isEqualTo: 'unpaid')
        .where('status', isEqualTo: 'closed')
        .get();
    if (snapshot.docs.isNotEmpty) {
      setState(() {
        estimate = EstimateGiven.fromMap(
            snapshot.docs.first.data() as Map<String, dynamic>);
      });
    }
    QuerySnapshot agentsnapshot = await FirebaseFirestore.instance
        .collection('approvals')
        //.where('opid', isEqualTo: estimate!.opid)
        .where('status', isEqualTo: true)
        .get();
    if (agentsnapshot.docs.isNotEmpty) {
      setState(() {
        approvals = Approvals.fromMap(
            agentsnapshot.docs.first.data() as Map<String, dynamic>);
      });
    }
  }

  Future getCommissionData() async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('customers')
        // .where('id', isEqualTo: estimate!.customerId)
        .get();
    if (snapshot.docs.isNotEmpty) {
      setState(() {
        // customersList = snapshot.docs
        //     .map((e) => Customers.fromMap(e.data() as Map<String, dynamic>))
        //     .toList();
        customer = Customers.fromMap(
            snapshot.docs.first.data() as Map<String, dynamic>);
      });
    }
  }

  @override
  void initState() {
    // getData();
    getCommissionData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(1.0, 0.0, 1.0, 0.0),
        child: ListTile(
          shape: RoundedRectangleBorder(
            side: const BorderSide(color: Colors.grey, width: 1),
            borderRadius: BorderRadius.circular(12),
          ),
          // leading: approvals!.photo!.isNotEmpty
          //     ? CircleAvatar(
          //         radius: 30.0,
          //         backgroundImage: NetworkImage(approvals!.photo!),
          //       )
          //     : const CircleAvatar(
          //         radius: 30.0,
          //         backgroundImage: NetworkImage(
          //             'https://cdn-icons-png.flaticon.com/512/3135/3135715.png'),
          //       ),
          leading: customer!.pic!.isNotEmpty
              ? CircleAvatar(
                  radius: 30.0,
                  backgroundImage: NetworkImage(customer!.pic!),
                )
              : const CircleAvatar(
                  radius: 30.0,
                  backgroundImage: NetworkImage(
                      'https://cdn-icons-png.flaticon.com/512/3135/3135715.png'),
                ),
          title: Text(
            customer!.fname!,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: Colors.blue,
            ),
          ),
          // subtitle: Text('\$${estimate!.payable}'),
          // trailing: InkWell(
          //   onTap: () {},
          //   child: Container(
          //     height: 50,
          //     width: 100,
          //     decoration: BoxDecoration(
          //       color: Colors.transparent,
          //       borderRadius: BorderRadius.circular(10),
          //       border: Border.all(
          //         color: kPrimary1,
          //         width: 1,
          //       ),
          //     ),
          //     child: Center(
          //       child: Text(
          //         'Pay Commision',
          //         style: TextStyle(
          //           color: kPrimary1,
          //           fontSize: 12,
          //           fontWeight: FontWeight.w600,
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
        ));
  }
}
