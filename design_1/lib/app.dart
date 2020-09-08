import 'package:design_1/pages/main_page.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xfffcf7f1),
        fontFamily: "NanumMyeongjo",
      ),
      home: MainPage(),
    );
  }
}
