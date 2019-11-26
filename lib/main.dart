import 'package:aigen_tech_test/splash/splash.ui.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Aigen Tech',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SplashUi());
  }
}
