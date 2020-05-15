import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitnessapp/exercise_hub.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class ExerciseScreen extends StatefulWidget {

  final Exercises exercises;
  final int seconds;

  ExerciseScreen({this.exercises,this.seconds});

  @override
  _ExerciseScreenState createState() => _ExerciseScreenState();
}

class _ExerciseScreenState extends State<ExerciseScreen> {

  bool _isCompleted;
  int _elapsedSeconds = 0;

  Timer timer;


  @override
  void initState() {
    // TODO: implement initState

    Timer.periodic(
      Duration(seconds: 1),
        (t){
            if(t.tick == widget.seconds){
              t.cancel();
              setState(() {
                _isCompleted= true;
              });
            }

            setState(() {
              _elapsedSeconds = t.tick;
            });
        }
    );


    super.initState();
  }


  @override
  void dispose() {
    // TODO: implement dispose
    timer.cancel();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(

        children: <Widget>[
          Center(
            child: CachedNetworkImage(
              imageUrl: widget.exercises.gif,
              placeholder: (context, url) => Image(
                image:  AssetImage("assets/screen3.jpg"),
                fit: BoxFit.cover,
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
              ),
              errorWidget: (context, url, error) => Icon(Icons.error),
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
            ),
          ),

          _isCompleted!=true? Container(
            alignment: Alignment.center,
            child: Text("$_elapsedSeconds/${widget.seconds} S")):Container(),

          SafeArea(
            child: IconButton(
              icon: Icon(Icons.close),
              onPressed: (){
                Navigator.of(context).pop();
              },
            ),
          )

        ],
      ),
    );
  }
}
