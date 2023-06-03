import 'package:estimate_app_panel/constants.dart';
import 'package:estimate_app_panel/pages/authentication.dart';
import 'package:estimate_app_panel/primary_swatch.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:url_strategy/url_strategy.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyDyC-bQJCgTFBrbd-a9fasSIjP1PXLPCtE",
      appId: "1:544251418487:web:d5900bbdf3cbaa1b58f372",
      messagingSenderId: "544251418487",
      projectId: "gutter-app-7a6a5",
    ),
  );
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );
  setPathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        unselectedWidgetColor: kFormStockColor,
        scaffoldBackgroundColor: kColorWhite,
        primarySwatch: buildMaterialColor(const Color(0xFF3B71FE)),
        fontFamily: GoogleFonts.poppins().fontFamily,
      ),
      home: const Authentication(),
    );
  }
}
