import 'package:bfc_app/screen/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    // SystemChrome.setSystemUIOverlayStyle(
    //     const SystemUiOverlayStyle(
    //         systemNavigationBarColor: Color(0xFFA50034)
    //     )
    // );
    return MaterialApp(
      title: 'BrotherlyFC App',
      debugShowCheckedModeBanner: false,
      theme: _createTheme(),
      routes: {
        '/' : (context) => const HomeScreen(),
    },
    );
  }
}

ThemeData _createTheme() {
  return ThemeData(
      brightness: Brightness.light,
      primaryColor: const Color(0xFF0D47A1),
      colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: const Color(0xFF6B6B6B),
        secondary: Colors.cyan,
      ),
      canvasColor: const Color.fromRGBO(253, 253, 253, 1.0),
  );
}
