import 'dart:io';
import 'package:farm/Pages/appbar.dart';
import 'package:flutter/material.dart';
import 'color.dart';
import 'Pages/crop_care.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
 
      theme: ThemeData(scaffoldBackgroundColor: const Color.fromARGB(255, 255, 255, 255)),
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        return Scaffold(
          body: child, //this child is dynamically replaced with corresponding page when we navigate
        );
      },
      home: const MyWidget()
    );
  }
}



 class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}