import 'package:flutter/material.dart';
import 'package:sqlite_assi/UI_Screen/tabbar_nav.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo List SQLite',
      debugShowCheckedModeBanner: false,
      home: TabBarNav(),
    );
  }
}
