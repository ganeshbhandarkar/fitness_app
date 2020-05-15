import 'package:fitnessapp/exercise_hub.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'exercise_start.dart';


class HomePage extends StatefulWidget {

  static const String routeName = '/home';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {



  final String apiURL = "https://raw.githubusercontent.com/codeifitech/fitness-app/master/exercises.json";

  ExerciseHub exerciseHub;

  @override
  void initState() {
    // TODO: implement initState
    getExercises();

    super.initState();
  }

  void getExercises() async {
    var response = await http.get(apiURL);
    var body = response.body;

    var decodedJson = jsonDecode(body);

    exerciseHub = ExerciseHub.fromJson(decodedJson);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Exercises")),
      body: Container(
        child: exerciseHub != null ? ListView(
          children: exerciseHub.exercises.map((e){
            return InkWell(
              onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ExerciseStartScreen(exercises: e)));
              },
              child: Hero(
                tag: e.id,
                child: Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Stack(
                      children: <Widget>[

                        ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: FadeInImage(
                            image: NetworkImage(e.thumbnail),
                            placeholder: AssetImage("assets/screen1.jpg"),
                            width: MediaQuery.of(context).size.width,
                            height: 250,
                            fit: BoxFit.cover,
                          ),
                        ),

                        ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 250,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color(0xFF000000),Color(0x00000000)
                                ],
                                begin: Alignment.bottomCenter,
                                end: Alignment.center,
                              )
                            ),
                          ),
                        ),

                        Container(
                          height: 250,
                          padding: EdgeInsets.all(10),
                          alignment: Alignment.bottomCenter,
                          child: Text(
                            e.title,
                            style: TextStyle(color: Colors.white,fontSize: 20),
                          ),
                        )

                      ],

                    )
                ),
              ),
            );
          }).toList(),
        ) : LinearProgressIndicator(),
      ),
    );
  }
}


/*
FadeInImage(
                    image: NetworkImage(exerciseHub.exercises[index].thumbnail),
                    placeholder: AssetImage("assets/girl3.png"),
                    width: MediaQuery.of(context).size.width,
                    height: 250,
                    fit: BoxFit.cover,
                    )
 */