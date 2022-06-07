import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_practice_ui/my_colors.dart';
import 'package:flutter_practice_ui/views/first_screen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: SolidColors.statusBarColor,
    systemNavigationBarColor: SolidColors.navigationColor,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarIconBrightness: Brightness.dark,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        iconTheme: const IconThemeData(
          size: 30
        ),
          textTheme: const TextTheme(
        headline1: TextStyle(
            fontSize: 40, color: Colors.white, fontWeight: FontWeight.bold),
        subtitle1:
            TextStyle(fontSize: 15, color: Color.fromARGB(255, 211, 211, 211)),
        subtitle2: TextStyle(
            fontSize: 15, color: Colors.black, fontWeight: FontWeight.w500),
        headline2: TextStyle(
            fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
        headline3: TextStyle(
            fontSize: 15, color: Colors.black, fontWeight: FontWeight.bold),
        headline4: TextStyle(
            fontSize: 30, color: Colors.black, fontWeight: FontWeight.bold),
        headline5: TextStyle(
            fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
        headline6: TextStyle(
            fontSize: 20,color: Color.fromARGB(255, 126, 126, 126)
        )
      )),
      debugShowCheckedModeBanner: false,
      home: const FirstScreen(),
    );
  }
}
