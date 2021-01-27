import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants.dart';
//import 'package:flutter_application_1/screens/home/home_screen.dart';
import 'package:flutter_application_1/screens/selection_menu/selection_menu.dart';
import 'tasks.dart';

void main() {
  // needs to be initialized before using workmanager package
  WidgetsFlutterBinding.ensureInitialized();

  initializeTasks();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SelectionMenu(),
    );
  }
}
