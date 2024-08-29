// ignore_for_file: prefer_const_constructors

import 'package:fakestore_application/screens/loginScreen.dart';
import 'package:fakestore_application/screens/registerScreen.dart';
import 'package:flutter/material.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          children: [
            Image.asset(
              "assets/images/shop.jpg",
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Text(
                'Welcome  ',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 80,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 22),
              child: MaterialButton(
                  height: 55,
                  minWidth: 333,
                  color: Color(0xffb03071E),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  onPressed: () {
                     Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Logscreen()));
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  )),
            ),
            MaterialButton(
                height: 55,
                minWidth: 333,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: Color(0xffb03071E)),
                    borderRadius: BorderRadius.circular(8)),
                onPressed: () {

                   Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegScreen()));
                },
                child: Text(
                  'Register',
                  style: TextStyle(
                    fontSize: 15,
                    color: Color(0xffb03071E),
                  ),
                )),
            SizedBox(height: 25),
            InkWell(
              onTap: () {},
              child: Text(
                'Continue as guest',
                style: TextStyle(color: Color(0xffbEF233C), fontSize: 15),
              ),
            )
          ],
        )),
      ),
    );
  }
}
