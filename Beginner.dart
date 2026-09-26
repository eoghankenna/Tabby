import 'package:flutter/material.dart';
import 'lesson_placeholder.dart';
import 'package:untitled3/Notifiers/Value_Notifiers.dart';


class Beginner extends StatelessWidget{
  const Beginner({super.key});

  @override
  Widget build(BuildContext context){
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(20),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [

              ],
            ),
          ),
        ),
        Container(
            child: Expanded(
              child: ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index) {
                  return ValueListenableBuilder(valueListenable: Lesson_Number, builder: (context, value, child) {
                    return ElevatedButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => BeginnerLessons(),));
                        },
                        style: ElevatedButton.styleFrom(

                        ),
                        child: Text("Start")
                    );
                  },);
                },
              ),
            )
        )
      ],
    );

  }
}