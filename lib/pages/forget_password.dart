import 'package:estimate_app_panel/constants.dart';
import 'package:estimate_app_panel/pages/login.dart';
import 'package:estimate_app_panel/widgets/buttons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../widgets/text_field.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  TextEditingController emailC = TextEditingController();
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Row(
          children: [
            Container(
              width: 600,
              height: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage('assets/images/oop.jpg'),
                  fit: BoxFit.fill,
                  colorFilter: ColorFilter.mode(
                      kColorBlack.withOpacity(0.3), BlendMode.darken),
                ),
              ),
            ),
            // const SizedBox(
            //   width: 175,
            // ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 150),
                child: Form(
                  key: formkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Forget Password!',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: kUIDark,
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      const Text(
                        'Email',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: kUIDark,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: 370,
                        height: 52,
                        child: TextFieldWidget(
                          controller: emailC,
                          hintText: 'Enter email address',
                          ebColor: kUILight,
                          validate: true,
                          errorTxt: 'Enter email address',
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const SizedBox(height: 48),
                      FixedPrimary(
                        buttonText: 'RESET',
                        ontap: () {
                          if (formkey.currentState!.validate()) {
                            resetPassword();
                          }
                        },
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

  Future resetPassword() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailC.text.trim());
      showDialog(
          context: context,
          builder: (contex) {
            return AlertDialog(
              title: const Text('Alert'),
              content: const Text(
                  "Check your email Spam folder and reset the password"),
              actions: [
                CloseButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const LoginPage()));
                  },
                )
              ],
            );
          });
    } on FirebaseAuthException catch (e) {
      showDialog(
          context: context,
          builder: (contex) {
            return AlertDialog(
              title: const Text('Alert'),
              content: Text(e.message.toString()),
              actions: const [CloseButton()],
            );
          });
    }
  }
}
