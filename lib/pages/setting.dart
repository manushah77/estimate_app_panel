// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:estimate_app_panel/constants.dart';
import 'package:estimate_app_panel/models/setting.dart';
import 'package:estimate_app_panel/widgets/buttons.dart';
import 'package:estimate_app_panel/widgets/text_field.dart';
import 'package:flutter/material.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  TextEditingController commisionC = TextEditingController();
  TextEditingController taxC = TextEditingController();
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kColorWhite,
        elevation: 0,
        title: const Text(
          'Settings',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 22,
            color: kColorBlue,
          ),
        ),
        // actions: [
        //   Padding(
        //     padding: const EdgeInsets.only(right: 40.5),
        //     child: Row(
        //       children: [
        //         SizedBox(width: 5),
        //         IconButton(
        //           onPressed: () {},
        //           icon: CircleAvatar(
        //             backgroundColor: kPrimary1,
        //             radius: 20,
        //             child: Icon(
        //               Icons.delete_outline,
        //               color: Colors.white,
        //               size: 17,
        //             ),
        //           ),
        //         ),
        //       ],
        //     ),
        //   ),
        // ],
      ),
      body: Form(
        key: formkey,
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 18.0),
                  child: Text(
                    'Commision',
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
                      controller: commisionC,
                      hintText: 'Enter Commision',
                      suffixIcon: Icon(Icons.percent),
                      ebColor: kUILight,
                      validate: true,
                      errorTxt: 'Add Commision',
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 18.0),
                  child: Text(
                    'Tax',
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
                      controller: taxC,
                      hintText: 'Enter Tax',
                      suffixIcon: Icon(Icons.percent),
                      ebColor: kUILight,
                      validate: true,
                      errorTxt: 'Add Tax',
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 18.0),
                  child: FixedPrimary(
                    buttonText: 'Save',
                    ontap: () {
                      if (formkey.currentState!.validate()) {
                        saveSetting();
                      }
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future saveSetting() async {
    try {
      final newSetting = FirebaseFirestore.instance
          .collection('setting')
          .doc('J5LavSyvBocsRwQyzizN');
      AddSetting addSetting = AddSetting(
          id: newSetting.id,
          commision: double.parse(commisionC.text),
          tax: double.parse(taxC.text));
      await newSetting.update(addSetting.toMap());
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Alert'),
              content: Text('Data Successfully added'),
              actions: const [CloseButton()],
            );
          });
      commisionC.clear();
      taxC.clear();
    } catch (e) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Alert'),
              content: Text('Data Successfully added'),
              actions: const [CloseButton()],
            );
          });
    }
  }
}
