import 'package:untitled3/Home_Page.dart';
import 'package:untitled3/Notifiers/Value_Notifiers.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class PaddedText extends StatelessWidget {
  const PaddedText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: const Text('Hello, World!'),
    );
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}


class _MyAppState extends State<MyApp> {
  int _currentIndex = 1;
  List <Widget> body = [
    PaddedText(),
    lesson_pages(),
    PaddedText(),
  ];


  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: light_mode, builder: (context, light_mode, child) {
      return ValueListenableBuilder<int>(valueListenable: Color_Theme, builder: (context, value, child) {
        return MaterialApp(
          darkTheme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.black,
                brightness: light_mode ? Brightness.light : Brightness.dark
            ),),
          debugShowCheckedModeBanner: false,
          home: SafeArea(
            top: false,
            child: Scaffold(
              body: body[_currentIndex],
              bottomNavigationBar: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                currentIndex: _currentIndex,
                onTap: (int newIndex) {
                  setState(() {
                    _currentIndex = newIndex;
                  });
                },
                items: const [
                  BottomNavigationBarItem(label: "Tuner", icon: Icon(Icons.queue_music)),
                  BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home)),
                  BottomNavigationBarItem(label: "Store", icon: Icon(Icons.storefront)),
                ],
              ),
            ),
          ),
        );
      },);
    },
    );
  }
}