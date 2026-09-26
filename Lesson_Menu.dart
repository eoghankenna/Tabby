import 'package:untitled3/Notifiers/Value_Notifiers.dart';
import 'package:untitled3/Lesson_Section/Beginner.dart';
import 'package:untitled3/Lesson_Section/Intermediate.dart';
import 'package:untitled3/Lesson_Section/Professional.dart';
import 'package:flutter/material.dart';

class Lesson_Hub extends StatelessWidget {
  const Lesson_Hub({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: IconButton(onPressed: () {
            Navigator.pop(context);
          }, icon: Icon(Icons.keyboard_return)),
          title: Text("Lessons",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
          bottom: TabBar(tabs: [
            Tab(child: Text("Beginner"),),
            Tab(child: Text("Intermediate"),),
            Tab(child: Text("Professional"),)
          ],),
          actions: [
            IconButton(onPressed: () {
              light_mode.value = !light_mode.value;
            }, icon: ValueListenableBuilder(
              valueListenable: light_mode,
              builder: (context, light_mode, child) {
                return Icon(
                  light_mode? Icons.light_mode : Icons.dark_mode,
                );
              },))
          ],),
        body: TabBarView(children: [
          Beginner(),
          Intermediate(),
          Profesional(),
        ]),
      ),
    );
  }
}


