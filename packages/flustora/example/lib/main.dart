import 'package:example/home.dart';
import 'package:flustora/flustora.dart';
import 'package:flutter/material.dart';

void main() async {
  await initialization();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "flustora_package",
      home: Home(),
    );
  }
}
