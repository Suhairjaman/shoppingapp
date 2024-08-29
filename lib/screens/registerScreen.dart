// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class RegScreen extends StatelessWidget {
  const RegScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[150],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Image.asset(
                "assets/images/back.png",
                scale: 11,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 44, left: 25),
              child: Text(
                'Hello! Register to get started',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Color(0xffb03071E),
                ),
              ),
            ),
            SizedBox(
              height: 44,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 22, right: 22),
              child: TextFormField(
                decoration: InputDecoration(
                  fillColor: Colors.grey[100],
                  filled: true,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  hintText: 'Email or Phonenumber',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 17, left: 22, right: 22),
              child: TextFormField(
                decoration: InputDecoration(
                  fillColor: Colors.grey[100],
                  filled: true,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  hintText: 'Enter password',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 17, left: 22, right: 22),
              child: TextFormField(
                decoration: InputDecoration(
                  fillColor: Colors.grey[100],
                  filled: true,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  hintText: 'Confirm password',
                ),
              ),
            ),
            SizedBox(
              height: 60,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: MaterialButton(
                height: 55,
                minWidth: 333,
                color: Color(0xffb03071E),
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: Color(0xffb03071E)),
                    borderRadius: BorderRadius.circular(8)),
                onPressed: () {},
                child: Text(
                  'Submit',
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
