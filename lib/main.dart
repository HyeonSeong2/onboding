import 'package:firebase_core/firebase_core.dart';
import 'package:first/eventChannel/event_channel_screen.dart';
import 'package:first/listExam/list_exam_screen.dart';
import 'package:first/methodCenel/method_channel_screen.dart';
import 'package:first/screen/home_screen.dart';
import 'package:first/screen/survey/survy_intro_screen.dart';
import 'package:first/stream/multiple_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.

  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          color: Colors.white,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
          ),
        ),
      ),
      home: ListExamScreen(),
    );
  }
}
