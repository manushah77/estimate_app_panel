import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:estimate_app_panel/models/customer.dart';
import 'package:estimate_app_panel/models/given_estimate.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EstimateList extends StatefulWidget {
  final EstimateGiven? estimate;
  EstimateList({Key? key, this.estimate}) : super(key: key);

  @override
  State<EstimateList> createState() => _EstimateListState();
}

class _EstimateListState extends State<EstimateList> {
  Customers? customer;

  //gettimg customer details
  Future getCustomer() async {
    QuerySnapshot snpashot = await FirebaseFirestore.instance
        .collection('customers')
        .where('id', isEqualTo: widget.estimate!.customerId)
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
    getCustomer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(1.0, 0.0, 1.0, 0.0),
        child: customer != null
            ? ListTile(
                shape: RoundedRectangleBorder(
                  side: const BorderSide(color: Colors.grey, width: 1),
                  borderRadius: BorderRadius.circular(12),
                ),
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
                  customer!.fname! + customer!.lname!,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Colors.blue,
                  ),
                ),
                subtitle: Text('\$${widget.estimate!.payable}'),
                trailing: Text(DateFormat('MMM dd yyyy')
                    .format(widget.estimate!.date!.toDate())),
              )
            : Container());
  }
}
