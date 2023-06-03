// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:estimate_app_panel/models/material.dart';
import 'package:estimate_app_panel/widgets/text_field.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import '../widgets/buttons.dart';

class AddMaterial extends StatefulWidget {
  const AddMaterial({Key? key}) : super(key: key);
  @override
  State<AddMaterial> createState() => _AddMaterialState();
}

class _AddMaterialState extends State<AddMaterial> {
  TextEditingController materialNameC = TextEditingController();
  TextEditingController materialDesC = TextEditingController();
  TextEditingController materialCatC = TextEditingController();
  TextEditingController unitPriceC = TextEditingController();
  TextEditingController discountC = TextEditingController();
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kColorWhite,
          elevation: 0,
          title: const Text(
            'Add Material',
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
                          'Material Name',
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
                            controller: materialNameC,
                            hintText: 'Enter Material',
                            ebColor: kUILight,
                            validate: true,
                            errorTxt: 'Enter Material',
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
                        child: Text(
                          'Material Description',
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
                            controller: materialDesC,
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
                    height: 10,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 18.0),
                        child: Text(
                          'Material Category',
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
                            controller: materialCatC,
                            hintText: 'Enter Material Category',
                            ebColor: kUILight,
                            validate: true,
                            errorTxt: 'Enter Material Category',
                          ),
                        ),
                      ),
                    ],
                  ),
                  //category drop down

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
                  //price
                  SizedBox(
                    height: 10,
                  ),
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

                  SizedBox(
                    height: 20,
                  ),
                  FixedPrimary(
                    buttonText: 'Add Material',
                    ontap: () {
                      if (formkey.currentState!.validate()) {
                        saveMaterial();
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

  Future saveMaterial() async {
    try {
      final newMaterial =
          FirebaseFirestore.instance.collection('materials').doc();
      Materials addMaterial = Materials(
          active: true,
          category: materialCatC.text,
          description: materialDesC.text,
          id: newMaterial.id,
          material: materialNameC.text,
          unitPrice: double.parse(unitPriceC.text),
          materialDiscount: double.parse(discountC.text));
      await newMaterial.set(addMaterial.toMap());

      // newMaterial.set({
      //   'active': true,
      //   'category': 'Disty',
      //   'description': materialDesC.text,
      //   'id': newMaterial.id,
      //   'material': materialNameC.text,
      //   'unitPrice': unitPriceC.text,
      //   'servicediscount': discountC.text,
      // });
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Alert Dialog'),
              content: Text('Material SuccessFully added'),
              actions: [CloseButton()],
            );
          });
      materialNameC.clear();
      materialDesC.clear();
      materialCatC.clear();
      unitPriceC.clear();
      discountC.clear();
      // Navigator.pushReplacement(
      //     context, MaterialPageRoute(builder: (context) => MyDashboard()));
    } catch (e) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Alert Dialog'),
              content: Text('Material does not add'),
              actions: [CloseButton()],
            );
          });
    }
  }
}
