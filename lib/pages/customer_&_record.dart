// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:estimate_app_panel/models/customer.dart';
import 'package:flutter/material.dart';
import '../constants.dart';

class CustomersAndRecod extends StatefulWidget {
  const CustomersAndRecod({Key? key}) : super(key: key);

  @override
  State<CustomersAndRecod> createState() => _CustomersAndRecodState();
}

List<Customers> customersList = [];

class _CustomersAndRecodState extends State<CustomersAndRecod> {
  Future getCustomer() async {
    QuerySnapshot snpashot =
        await FirebaseFirestore.instance.collection('customers').get();
    if (snpashot.docs.isNotEmpty) {
      setState(() {
        customersList = snpashot.docs
            .map((e) => Customers.fromMap(e.data() as Map<String, dynamic>))
            .toList();
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
    return SafeArea(
      child: Scaffold(
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
          title: Text(
            'Customers & Records',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 22,
              color: kColorBlue,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              children: [
                ListView.builder(
                    itemCount: customersList.isEmpty ? 0 : customersList.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          horizontalTitleGap: 10,
                          minLeadingWidth: 20,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.black, width: 1),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          leading: customersList[index].pic!.isEmpty
                              ? CircleAvatar(
                                  radius: 30,
                                  backgroundImage: NetworkImage(
                                      'https://cdn-icons-png.flaticon.com/512/3135/3135715.png',
                                      scale: 1),
                                )
                              : CircleAvatar(
                                  radius: 30,
                                  backgroundImage: NetworkImage(
                                      '${customersList[index].pic}',
                                      scale: 1),
                                ),
                          title: Padding(
                            padding: const EdgeInsets.only(left: 18.0),
                            child: Text(
                              customersList[index].fname! +
                                  customersList[index].lname!,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          // trailing:
                        ),
                      );
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
