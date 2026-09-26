import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_guitar_tabs/flutter_guitar_tabs.dart';
import 'package:libtab/libtab.dart';
import 'dart:ui';



List<bool> optionA = [false, false, false, false, false];
List<bool> optionB = [false, false, false, false, false];
List<bool> optionC = [false, false, false, false, false];

class Questions extends StatefulWidget {
  const Questions({super.key});

  @override
  State<Questions> createState() => _QuestionsState();


}

class _QuestionsState extends State<Questions> {

  List question1text =[];

  Future<void> readJson() async {
    final String slides = await rootBundle.loadString(
        'assets/Data/Beginner_lesson_data.json');
    final data = await jsonDecode(slides);
    setState(() {
      question1text = data["lesson_questions1"];
    });
  }

  bool ischecked = false;

  @override
  void initState() {
    super.initState();
    readJson();
  }

  void checkValue(bool? newValue){
    setState(() {
      ischecked = newValue ?? false;
    });
  }

  //make a for loop that creates a set number of questions with three optioms
  //A
  //B
  //C
  //once one of the three options is selected throw it into a function to check if it
  //matches the correct answer in the json


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Questions"),
          centerTitle: true,
          leading: IconButton(onPressed: () {
            Navigator.pop(context);
          }, icon: Icon(Icons.keyboard_return)),
        ),
        body: ListView(
          children: [
            for(var i = 0; i < 1 ; i++)
              Container(
                margin: EdgeInsets.all(15),
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withValues(alpha: 0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                width: double.infinity,
                child: Column(
                  children: [
                    Card(
                      child: CheckboxListTile(value: ischecked, onChanged: (bool? newValue){
                        checkValue(newValue);
                      },),
                    ),
                    Card(
                      child: CheckboxListTile(value: ischecked, onChanged: (value) {

                      },),
                    ),
                    Card(
                      child: CheckboxListTile(value: ischecked, onChanged: (value) {

                      },),
                    ),
                  ],
                ),
              ),
            Container(
              margin: EdgeInsets.all(40),
              child: ElevatedButton(onPressed: () {

              }, child: Text("Finish lesson")),
            )
          ],
        )
    );
  }
}

class BeginnerLessons extends StatefulWidget {
  const BeginnerLessons({super.key});

  @override
  State<BeginnerLessons> createState() => _BeginnerLessonsState();
}

class _BeginnerLessonsState extends State<BeginnerLessons> {
  List lesson1text = [];

  Future<void> readJson() async {
    final String slides = await rootBundle.loadString(
        'assets/Data/Beginner_Data.json');
    final data = await jsonDecode(slides);
    setState(() {
      lesson1text = data["Lesson1"];
    });
  }

  @override
  void initState() {
    super.initState();
    readJson();
  }

  var lessonIndex = 0;

  var correctAnswer;


  increase() {
    if (lessonIndex == lesson1text.length - 1) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Questions(),));
    }
    else {
      setState(() {
        lessonIndex++;
      });
      return lessonIndex;
    }
  }

  decrease() {
    if (lessonIndex <= 0) {
      setState(() {
        Navigator.pop(context);
      });
    }
    else {
      setState(() {
        lessonIndex--;
      });
      return lessonIndex;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(lesson1text.isNotEmpty
            ? lesson1text[lessonIndex]["Header1"]
            : "Loading..."),
        centerTitle: true,
        actions: [
          Text("${lessonIndex + 1}/${lesson1text.length}",
            style: TextStyle(
              fontSize: 20,
            ),)
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(30)),
            ),
            margin: EdgeInsets.all(15),
            padding: EdgeInsets.all(15),

            child: Column(

              children: [
                Container(

                  padding: EdgeInsets.all(10),
                  child:
                  Text(lesson1text.isNotEmpty
                      ? lesson1text[lessonIndex]["lesson_header"]
                      : "Loading...",
                    style: TextStyle(
                      decoration: TextDecoration.none,
                      fontSize: 15,
                    ),),
                ),
                Container(
                  child: CustomPaint(
                    child: const Center(
                      child: Text(
                        'Once upon a time...',
                        style: TextStyle(
                          fontSize: 40.0,
                          fontWeight: FontWeight.w900,
                          color: Color(0xFFFFFFFF),
                        ),
                      ),
                    ),
                  )
                ),
                Container(
                  padding: EdgeInsets.all(25),
                  child:
                  Text(lesson1text.isNotEmpty
                      ? lesson1text[lessonIndex]["text_section"]
                      : "Loading...",
                    style: TextStyle(
                      decoration: TextDecoration.none,
                      fontSize: 10,
                    ),),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(onPressed: () {
                      decrease();
                    }, child: Text("Previous"),),
                    ElevatedButton(onPressed: () {
                      increase();
                    }, child: Text("Next"))
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}