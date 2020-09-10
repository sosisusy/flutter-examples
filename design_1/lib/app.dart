import 'package:design_1/pages/main_page.dart';
import 'package:design_1/utils/scroll/default_behavior.dart';
import 'package:design_1/variable.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: defaultScaffoldBackgroundColor,
      ),
      home: ScrollConfiguration(
        behavior: DefaultBehavior(),
        child: MainPage(),
      ),
    );
  }
}
