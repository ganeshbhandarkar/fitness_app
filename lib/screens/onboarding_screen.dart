import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:fitnessapp/routes/Routes.dart';

class OnBoardingScreen extends StatefulWidget {



  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {



//  var pages = [
//    PageViewModel(
//      title: "Exercise",
//      body: "Stay Fit",
//      image: Center(child:Image.asset("assets/girl1.png", height: 300.0,)),
//    ),
//    PageViewModel(
//      title: "Weights",
//      body: "Stay Healthy",
//      image: Center(child:Image.asset("assets/girl2.png", height: 300.0,)),
//    ),
//    PageViewModel(
//      title: "Yoga and Running",
//      body: "Stay Calm",
//      image: Center(child:Image.asset("assets/girl3.png", height: 300.0,)),
//    ),
//  ];

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0,color: Colors.white);
    const pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700,color: Colors.white),
      bodyTextStyle: bodyStyle,
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Color(0xFF192A56),
      imagePadding: EdgeInsets.zero,
    );


    return Scaffold(
      body: IntroductionScreen(
        globalBackgroundColor: Color(0xFF192A56),
        pages: [

          PageViewModel(
            title: "Exercise",
            body: "Stay Fit",
            image: Center(child:Image.asset("assets/girl1.png", height: 300.0,)),
            decoration: pageDecoration,
          ),
          PageViewModel(
            title: "Weights",
            body: "Stay Healthy",
            image: Center(child:Image.asset("assets/girl2.png", height: 300.0,)),
            decoration: pageDecoration,
          ),
          PageViewModel(
            title: "Yoga and Running",
            body: "Stay Calm",
            image: Center(child:Image.asset("assets/girl3.png", height: 300.0,)),
            decoration: pageDecoration,
          ),
        ],
        onDone: () {
          // When done button is press
          Navigator.pushReplacementNamed(context, Routes.homepage);
        },
        onSkip: () {
          // You can also override onSkip callback
        },
        showSkipButton: false,
        skip: const Icon(Icons.skip_next),
        next: Icon(Icons.arrow_right,color: Colors.orangeAccent,),
        done: const Text("Done", style: TextStyle(fontWeight: FontWeight.w600,color: Colors.orangeAccent)),
        dotsDecorator: DotsDecorator(
            size: const Size.square(10.0),
            activeSize: const Size(20.0, 10.0),
            activeColor: Colors.deepOrange,
            color: Colors.black26,
            spacing: const EdgeInsets.symmetric(horizontal: 3.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0)
            )
        ),
      ),
    );
  }
}

