// ignore_for_file: unused_local_variable, unused_import


import 'package:fakestore_application/screens/homeScreen.dart';
import 'package:fakestore_application/screens/loginScreen.dart';
import 'package:fakestore_application/screens/registerScreen.dart';
import 'package:fakestore_application/screens/splashScreen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async{
   WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  var token = preferences.getString("token");
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});

 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      
      home: SplashScreen(),
    );
  }
}
