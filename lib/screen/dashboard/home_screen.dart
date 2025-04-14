import 'package:flutter/material.dart';
import 'package:flutter_new/widgets/custom_text.dart';

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({super.key});

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomText(text: "Home Screen Do Something",fontSize: 60,),
    );
  }
}
