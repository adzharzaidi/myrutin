import 'package:flutter/material.dart';
// import 'package:myrutin/screen/details.dart';
import 'package:myrutin/screen/landing_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'PlusJakartaSans-SemiBold'),
      title: 'myRutin',
      home: LandingPage(),
    );
  }
}
