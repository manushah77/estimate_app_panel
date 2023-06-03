// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:estimate_app_panel/models/service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import '../widgets/buttons.dart';
import '../widgets/text_field.dart';

class AddService extends StatefulWidget {
  const AddService({Key? key}) : super(key: key);
  @override
  State<AddService> createState() => _AddServiceState();
}

class _AddServiceState extends State<AddService> {
  TextEditingController serviceNameC = TextEditingController();
  TextEditingController serviceDesC = TextEditingController();
  TextEditingController subServiceC = TextEditingController();
  TextEditingController serviceCatC = TextEditingController();

  TextEditingController unitPriceC = TextEditingController();
  TextEditingController discountC = TextEditingController();
  final formkey = GlobalKey<FormState>();

  bool value = false;
  String dropdownValue = 'Dirty'; // final _controller = CountDownController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kColorWhite,
          elevation: 0,
          title: const Text(
            'Add Services',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 22,
              color: kColorBlue,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Form(
              key: formkey,
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 18.0),
                        child: Text(
                          'Service Name',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: kPrimary1,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 18.0),
                        child: SizedBox(
                          width: 370,
                          height: 52,
                          child: TextFieldWidget(
                            controller: serviceNameC,
                            hintText: 'Enter Service',
                            ebColor: kUILight,
                            validate: true,
                            errorTxt: 'Enter Service',
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  //detail

                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 18.0),
                        child: Text(
                          'Service Description',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: kPrimary1,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 18.0),
                        child: Container(
                          width: 370,
                          height: 150,
                          child: TextFormField(
                            controller: serviceDesC,
                            validator: (value) {
                              if (value == '') {
                                return 'Enter Description';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide:
                                    BorderSide(color: kPrimary1, width: 1),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide:
                                    BorderSide(color: Colors.black26, width: 1),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              hintText: 'Enter Description',
                              hintStyle: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: kUILight2,
                              ),
                            ),
                            maxLines: 10,
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: kUILight2),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),

                  //subservice

                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 18.0),
                        child: Text(
                          'Sub Service',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: kPrimary1,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 18.0),
                        child: SizedBox(
                          width: 370,
                          height: 52,
                          child: TextFieldWidget(
                            controller: subServiceC,
                            hintText: 'Enter Sub Service',
                            ebColor: kUILight,
                            validate: true,
                            errorTxt: 'Enter Sub Service',
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  //category drop down

                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 18.0),
                        child: Text(
                          'Service Category',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: kPrimary1,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 18.0),
                        child: SizedBox(
                          width: 370,
                          height: 52,
                          child: TextFieldWidget(
                            controller: serviceCatC,
                            hintText: 'Enter Service Category',
                            ebColor: kUILight,
                            validate: true,
                            errorTxt: 'Enter Service Category',
                          ),
                        ),
                      ),
                    ],
                  ),
                  // Row(
                  //   children: [
                  //     Padding(
                  //       padding: const EdgeInsets.only(left: 18.0),
                  //       child: Container(
                  //           width: 330,
                  //           height: 57,
                  //           decoration: BoxDecoration(
                  //               borderRadius: BorderRadius.circular(5.0),
                  //               border: Border.all(color: kUILight, width: 1)),
                  //           child: DropdownButtonHideUnderline(
                  //             child: Padding(
                  //               padding:
                  //                   const EdgeInsets.only(right: 8.0, left: 9),
                  //               child: DropdownButton<String>(
                  //                 value: dropdownValue,
                  //                 iconSize: 24,
                  //                 elevation: 16,
                  //                 style:
                  //                     TextStyle(color: kUIDark, fontSize: 17),
                  //                 onChanged: (String? newValue) {
                  //                   setState(() {
                  //                     dropdownValue = newValue!;
                  //                   });
                  //                 },
                  //                 items: <String>[
                  //                   'Dirty',
                  //                   'Dusty',
                  //                   'Mid Dusty',
                  //                   'Over Dusty'
                  //                 ].map<DropdownMenuItem<String>>(
                  //                     (String value) {
                  //                   return DropdownMenuItem<String>(
                  //                     value: value,
                  //                     child: Text(
                  //                       value,
                  //                     ),
                  //                   );
                  //                 }).toList(),
                  //               ),
                  //             ),
                  //           )),
                  //     ),
                  //   ],
                  // ),
                  SizedBox(
                    height: 20,
                  ),

                  //unit price

                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 18.0),
                        child: Text(
                          'Unit Price',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: kPrimary1,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 18.0),
                        child: SizedBox(
                          width: 100,
                          height: 52,
                          child: TextFieldWidget(
                            controller: unitPriceC,
                            hintText: '0',
                            ebColor: kUILight,
                            validate: true,
                            errorTxt: 'Enter Unit Price',
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  //discount

                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 18.0),
                        child: Text(
                          'Discount',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: kPrimary1,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 18.0),
                        child: SizedBox(
                          width: 100,
                          height: 52,
                          child: TextFieldWidget(
                            controller: discountC,
                            hintText: '%',
                            ebColor: kUILight,
                            validate: true,
                            errorTxt: 'Enter Discount',
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  FixedPrimary(
                    buttonText: 'Add Service',
                    ontap: () {
                      if (formkey.currentState!.validate()) {
                        saveService();
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
      ),
    );
  }

  Future saveService() async {
    final user = FirebaseAuth.instance.currentUser!.uid;
    try {
      final newService =
          FirebaseFirestore.instance.collection('services').doc();
      Services addService = Services(
          active: true,
          adminid: user,
          category: serviceCatC.text,
          description: serviceDesC.text,
          id: newService.id,
          service: serviceNameC.text,
          subservice: subServiceC.text,
          unitPrice: double.parse(unitPriceC.text),
          serviceDiscount: double.parse(discountC.text));
      await newService.set(addService.toMap());

      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Alert Dialog'),
              content: Text('Service SuccessFully added'),
              actions: [CloseButton()],
            );
          });
      serviceNameC.clear();
      serviceDesC.clear();
      subServiceC.clear();
      serviceCatC.clear();
      unitPriceC.clear();
      discountC.clear();
      // if (!mounted) return;
      // Navigator.pushReplacement(
      //     context, MaterialPageRoute(builder: (context) =>MyDashboard()));
    } catch (e) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Alert Dialog'),
              content: Text('Service does not add'),
              actions: [CloseButton()],
            );
          });
    }
  }
}
