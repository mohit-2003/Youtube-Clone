import 'package:flutter/material.dart';

class SubsriptionsScreen extends StatefulWidget {
  SubsriptionsScreen({Key? key}) : super(key: key);

  @override
  State<SubsriptionsScreen> createState() => _SubsriptionsScreen();
}

class _SubsriptionsScreen extends State<SubsriptionsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Subscriptions")),
    );
  }
}
