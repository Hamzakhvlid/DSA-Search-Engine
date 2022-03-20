
import 'thirdpage.dart';
import 'firstpage.dart';
import 'secondpage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DSA Search Engine',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Center(
        child: FirstPage(),
      ),
    );
  }
}

