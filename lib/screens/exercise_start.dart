import 'package:fitnessapp/exercise_hub.dart';
import 'package:fitnessapp/screens/exercise_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';


class ExerciseStartScreen extends StatefulWidget {
  final Exercises exercises;

  ExerciseStartScreen({this.exercises});

  @override
  _ExerciseStartScreenState createState() => _ExerciseStartScreenState();
}

class _ExerciseStartScreenState extends State<ExerciseStartScreen> {


  int seconds = 10;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Hero(
        tag: widget.exercises.id,
        child: Stack(children: <Widget>[
          Image(
            image: NetworkImage(widget.exercises.thumbnail),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.cover,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Color(0xFF000000), Color(0x00E83350)],
                    begin: Alignment.bottomCenter,
                    end: Alignment.center)),
          ),
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Container(
              width: 200,
              height: 200,
              child: SleekCircularSlider(
                appearance: CircularSliderAppearance(),
                onChange: (double value) {
                  seconds = value.toInt();
                },
                initialValue: 30,
                min: 10,
                max: 60,
                innerWidget: (v) {
                  return Container(
                    alignment: Alignment.center,
                    child: Text(
                      "${v.toInt()} S",
                      style: TextStyle(color: Colors.white,fontSize: 20,),
                      overflow: TextOverflow.fade,
                      textAlign: TextAlign.center,
                    ),
                  );
                },
              ),
            ),
          ),

          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Container(
                width: 150,
                height: 150,
                child: RaisedButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ExerciseScreen(exercises: widget.exercises,seconds: seconds,)));
                  },
                  child: Text("Start Exercise",style: TextStyle(fontSize: 20,),textAlign: TextAlign.center,),
                  color: Colors.pinkAccent,
                  textColor: Colors.white,
                  elevation: 10,

                ),
              ),
            ),
          ),


        ]),
      ),
    );
  }
}
