import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:estimate_app_panel/models/customer.dart';
import 'package:estimate_app_panel/models/given_estimate.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PayList extends StatefulWidget {
  //final Function ontap;
  //final EstimateGiven estimate;
  const PayList({
    Key? key,
    // required this.estimate,
    //required this.ontap
  }) : super(key: key);

  @override
  State<PayList> createState() => _PayListState();
}

class _PayListState extends State<PayList> {
  Customers? customer;
  //gettimg customer details
  Future getCustomer() async {
    QuerySnapshot snpashot = await FirebaseFirestore.instance
        .collection('customers')
        //.where('id', isEqualTo: widget.estimate.customerId)
        .get();
    if (snpashot.docs.isNotEmpty) {
      setState(() {
        customer = Customers.fromMap(
            snpashot.docs.first.data() as Map<String, dynamic>);
      });
    }
  }

  @override
  void initState() {
    // getCustomer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(1.0, 0.0, 1.0, 0.0),
        child: customer != null
            ? const ListTile(
                // leading: customer!.pic!.isNotEmpty
                //     ? CircleAvatar(
                //         radius: 20.0,
                //         backgroundImage: NetworkImage(customer!.pic!),
                //       )
                //   :
                leading: CircleAvatar(
                  radius: 20.0,
                  backgroundImage: AssetImage('assets/images/avatar.png'),
                ),
                title: Text(
                  // customer!.fname! + customer!.lname!,
                  'Ali',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                  ),
                ),
                // subtitle: Text('\$${widget.estimate.payable}'),
                //trailing: Text(DateFormat('MMM dd yyyy')
                //    .format(widget.estimate.date!.toDate())),
              )
            : Container());
  }
}
