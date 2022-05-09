import 'package:flutter/material.dart';
import 'package:myrutin/provider/event_provider.dart';
import 'package:myrutin/provider/project_provider.dart';
import 'package:myrutin/provider/project_task_provider.dart';
import 'package:myrutin/provider/today_task_provider.dart';
import 'package:myrutin/screen/widgets/homepage/landing_page.dart';
import 'package:provider/provider.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => ProjectTaskProvider()),
          ChangeNotifierProvider(create: (context) => TodayTaskProvider()),
          ChangeNotifierProvider(create: (context) => ProjectProvider()),
          ChangeNotifierProvider(create: (context) => EventProvider()),
        ],
        child: MaterialApp(
          theme: ThemeData(fontFamily: 'PlusJakartaSans-SemiBold'),
          title: 'myRutin',
          home: LandingPage(),
        ),
      );
}
