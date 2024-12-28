import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:pontal_03/src/pages/auth/sign_in_screen.dart';
=======
import 'package:pontal_delivery/src/pages/auth/sign_in_screen.dart';
>>>>>>> 8a7e8573245d83a8a9b9a95c18d7d42422affe39


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        scaffoldBackgroundColor: Colors.white.withAlpha(190),
      ),
      debugShowCheckedModeBanner: false,
      home: const SignInscreen(),
    );
  }
}


