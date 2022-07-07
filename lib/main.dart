import 'package:flutter/material.dart';
import 'package:yo_mamma/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Yo Mamma",
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
