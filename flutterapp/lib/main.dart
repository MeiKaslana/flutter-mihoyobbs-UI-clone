// @dart=2.9
import 'package:flutter/material.dart';
import 'package:flutterapp/pages/SplashPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyBilibili',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        primaryColor: Colors.pink[300],
      ),
      home: SplashPage(),
    );
  }
}
