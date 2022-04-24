import 'package:flutter/material.dart';
import 'package:myrutin/provider/project_task_provider.dart';
import 'package:myrutin/screen/landing_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => ProjectTaskProvider(),
        child: MaterialApp(
          theme: ThemeData(fontFamily: 'PlusJakartaSans-SemiBold'),
          title: 'myRutin',
          home: LandingPage(),
        ),
      );
}
