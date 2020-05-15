import 'package:fitnessapp/screens/homescreen.dart';
import 'package:fitnessapp/screens/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'routes/Routes.dart';

void main(){
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fitness App',
      home: OnBoardingScreen(),
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Color(0xFF192A56),
        )
      ),
      routes: {
        Routes.homepage: (context) => HomePage(),
      },
    );
  }
}
