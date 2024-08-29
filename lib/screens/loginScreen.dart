// ignore_for_file: prefer_const_constructors, unused_local_variable, avoid_print, unused_import

import 'dart:convert';


import 'package:fakestore_application/screens/homeScreen.dart';
import 'package:fakestore_application/screens/producthomeScreen.dart';
import 'package:fakestore_application/screens/registerScreen.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Logscreen extends StatelessWidget {
  Logscreen({super.key});
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  final url = 'https://fakestoreapi.com/auth/login';
  userlogin(username,password,context)async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final response = await http.post(Uri.parse(url),
    body: {
      "username":username,
      "password":password
   
    });
    if(response.statusCode==200){
       Navigator.push(
          context, MaterialPageRoute(builder: (context) => ProductScreen()));
    }else{
      print(jsonDecode(response.body));
    }
    var json =jsonDecode(response.body);
    preferences.setString("token",json['token']);
    print(response.statusCode);
    print(preferences.getString("token"));
    print(response.body);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white,),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              "assets/images/shop.jpg",
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Text(
                'Login  ',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 22, right: 22, bottom: 7),
              child: TextFormField(
                controller: email,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  hintText: 'Username',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 22, right: 22, top: 7),
              child: TextFormField(
                controller: password,
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: Icon(Icons.remove_red_eye),
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  hintText: 'Password',
                ),
              ),
            ),
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.only(right: 18),
                    child: Text(
                      'Forgott password',
                      style: TextStyle(color: Colors.blue, fontSize: 15),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 70),
              child: MaterialButton(
                height: 55,
                minWidth: 340,
                color: Color(0xffb03071E),
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: Color(0xffb03071E)),
                    borderRadius: BorderRadius.circular(8)),
                onPressed: () {
                  if(email.text.isNotEmpty && password.text.isNotEmpty){
                    userlogin(email.text.toString(), password.text.toString(), context);
                  }else{
                    showDialog(context: context, builder: (context){
                      return AlertDialog(
                        title: Text('Message'),
                        content: Text('Field nt be empty'),
                      );

                    });
                  }
                },
                child: Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
