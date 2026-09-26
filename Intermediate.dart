import 'package:flutter/material.dart';

int gyat = 2;

class Intermediate extends StatelessWidget{
  const Intermediate({super.key});

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
                Container(
                  margin: EdgeInsets.only(left: 30),
                  child: ElevatedButton(onPressed: () {

                  },  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ), child: Text("Lessons",
                    style: TextStyle(
                      color: Colors.white,
                    ),)),
                ),
                Container(
                  margin: EdgeInsets.only(left: 30),
                  child: ElevatedButton(onPressed: () {

                  },  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ), child: Text("Riffs",
                    style: TextStyle(
                      color: Colors.white,
                    ),)),
                ),
                Container(
                  margin: EdgeInsets.only(left: 30),
                  child: ElevatedButton(onPressed: () {

                  },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                      ), child: Text("Techniques",
                        style: TextStyle(
                          color: Colors.white,
                        ),)),
                ),
              ],
            ),
          ),
        ),
      ],
    );

  }
}