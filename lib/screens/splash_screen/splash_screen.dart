

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:jacksi_task/screens/products_screen/products_screen.dart';

import '../../utils/colors/colors.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () async {
    Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductsScreen()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset("assets/images/logo.jpeg"),
          Text("JACKSI LTD",
            style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.blue
            ),),
          SizedBox(
            width: double.infinity,
          )
        ],
      ),
    );
  }
}
