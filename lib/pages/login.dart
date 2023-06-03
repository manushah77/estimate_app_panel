// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:estimate_app_panel/pages/forget_password.dart';
import 'package:estimate_app_panel/widgets/side_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../constants.dart';
import '../widgets/buttons.dart';
import '../widgets/text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailC =
      TextEditingController(text: 'admin@estimate.com');
  TextEditingController passwordC = TextEditingController();
  final formkey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  @override
  void initState() {
    super.initState();
  }

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
                  image: const AssetImage('assets/images/est.jpg'),
                  fit: BoxFit.fill,
                  colorFilter: ColorFilter.mode(
                      kColorBlack.withOpacity(0.5), BlendMode.darken),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 100),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    SizedBox(height: 130),
                    Text(
                      'Sign In to',
                      style: TextStyle(
                        fontSize: 55,
                        fontWeight: FontWeight.w700,
                        color: kColorWhite,
                      ),
                    ),
                    SizedBox(height: 160),
                    Text(
                      'Ut tellus quis in imperdiet pharetra.',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: kColorWhite,
                      ),
                    ),
                  ],
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
                        'Hi, Welcome Back!',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: kUIDark,
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 90,
                          ),
                          // SignInButton(
                          //   Buttons.Google,
                          //   text: "Sign in with Google",
                          //   onPressed: () {

                          //   },
                          // ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        children: [
                          Container(
                            width: 132,
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                    width: 1, color: kFormStockColor),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 9.5,
                          ),
                          Text(
                            'Sign in Email',
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                              color: kUILight2,
                            ),
                          ),
                          SizedBox(
                            width: 9.5,
                          ),
                          Container(
                            width: 132,
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                    width: 1, color: kFormStockColor),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        'Email',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: kUIDark,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: 370,
                        height: 52,
                        child: TextFieldWidget(
                          controller: emailC,
                          hintText: emailC.text,
                          ebColor: kUILight,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Password',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: kUIDark,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: 370,
                        height: 52,
                        child: TextFieldWidget(
                          controller: passwordC,
                          hintText: 'Enter password',
                          ebColor: kUILight,
                          // suffixIcon: Icon(
                          //   CupertinoIcons.eye_slash,
                          //   size: 17,
                          //   color: kUILight2,
                          // ),
                          obscure: true,
                          validate: true,
                          errorTxt: 'Please enter password',
                        ),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 270,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ForgetPassword(),
                                ),
                              );
                            },
                            child: Text(
                              'Forgot password?',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: kPrimary1,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 48),
                      FixedPrimary(
                        buttonText: 'Log in',
                        ontap: () {
                          if (formkey.currentState!.validate()) {
                            adminLogin();
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

  //email and password login
  adminLogin() async {
    try {
      // UserCredential userCredential = await FirebaseAuth.instance
      //     .createUserWithEmailAndPassword(
      //         email: emailC.text, password: passwordC.text);

      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: emailC.text, password: passwordC.text);

      // final newadmin = FirebaseFirestore.instance
      //     .collection('admins')
      //     .doc('irjBjAnc40Tfi2m7ChCC79zTxhX2');

      // newadmin.set({

      //   'email': 'admin@estimate.com',
      //   'id': newadmin.id,
      // });
      if (!mounted) return;
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => SideBar()));
    } on FirebaseAuthException catch (e) {
      {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Alert'),
                content: Text(e.code.toString()),
                actions: [CloseButton()],
              );
            });
        passwordC.clear();
      }
    }
  }
}
