import '../pages/bottom_nav.dart';
import '../pages/login.dart';
import '../pages/product_detail.dart';
import '../pages/signup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'pages/home.dart';
import '../pages/onboarding.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: Login(),
    );
  }
}

// continue from 2:30:00
