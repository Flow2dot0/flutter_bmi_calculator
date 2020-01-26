import 'package:flutter/material.dart';
import 'package:mimic_bmi_calculator/screens/home_screen.dart';
import 'package:mimic_bmi_calculator/screens/result_screen.dart';
import 'constants.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: kBottomContainerColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(15.0),
            ),
          ),
        ),
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Color(0xFF333333),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        ResultScreen.routename: (context) => ResultScreen(),
      },
    );
  }
}
