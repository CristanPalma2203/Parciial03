// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:parcial03/pages/home-page.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            appBarTheme: AppBarTheme(color: Color(0xCD056C63)),
            bottomSheetTheme: BottomSheetThemeData(
                backgroundColor: Colors.black.withOpacity(0))),
        routes: {
          "/": (context) => HomePage(),
        });
  }
}
