import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

const kPrimary1 = Color(0xFF3B71FE);
const kPrimary2 = Color(0xFFFD4241);
const kColorWhite = Color(0xFFFFFFFF);
const kColorBlack = Color(0xFF000000);
const kColorBlack2 = Color(0xFF1A1F1E);
const kUILight = Color(0xFFCECECE);
const kUILight2 = Color(0xFF8F8F8F);
const kUILight3 = Color(0xFFFCFCFC);
const kUILight4 = Color(0xFFF3F8FF);
const kUILight5 = Color(0xFFC7C7C7);
const kUILight6 = Color(0xFF777E90);
const kUILight7 = Color(0xFFEDEDED);
const kUILight8 = Color(0xFFF9F9F9);
const kUIDark = Color(0xFF302727);
const kFormStockColor = Color(0xFFEEEEEE);
const kColorOrange = Color(0xFFFF9140);
const kColorAqua = Color(0xFF38E1D1);
const kColorYellow = Color(0xFFFFBC40);
const kColorGreen = Color(0xFF2AC956);
const kColorBlue = Color(0xFF152C5B);
const kDashboardBodyColor = Color(0xFFF7F9FD);
const kTabBarLine = Color(0xFFF3F3F3);
const kBoxShadowColor = Color.fromRGBO(161, 176, 207, 0.0361753);

const kGradientBlue = LinearGradient(
  colors: [
    Color(0xFF3B71FE),
    Color(0xFF88A9FF),
  ],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);

const kGradientShadow = LinearGradient(
  colors: [
    Color.fromRGBO(0, 0, 0, 0),
    Color.fromRGBO(0, 0, 0, 0.65),
  ],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);
// final Future<FirebaseApp> initialization = Firebase.initializeApp();
// FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
// FirebaseAuth auth = FirebaseAuth.instance;
