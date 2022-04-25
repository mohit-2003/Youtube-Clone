import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youtube_clone/Widget/bottom_nav.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: new MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Youtube',
        theme: new ThemeData(
            brightness: Brightness.dark,
            bottomNavigationBarTheme: new BottomNavigationBarThemeData(
                selectedItemColor: Colors.white)),
        home: new BottomNavBar(),
      ),
    );
  }
}
