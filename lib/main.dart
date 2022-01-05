import 'package:movie_app/presentation/screens/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/presentation/screens/detail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'movie app',

      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(title: "Characters",),
        '/details': (context) => const Detail(url: "",),
      },
    );
  }
}

