import 'package:addis_ecommerce/pages/bottom_nav.dart';
import 'package:addis_ecommerce/pages/login.dart';
import 'package:addis_ecommerce/pages/product_detail.dart';
import 'package:addis_ecommerce/pages/signup.dart';

import 'pages/home.dart';
import '../pages/onboarding.dart';
import 'package:flutter/material.dart';

void main() {
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
      home: Onboarding(),
    );
  }
}

// continue from 1:54:34
