import 'package:flutter/material.dart';
import 'package:jacksi_task/custom_widgets/custom_round_button.dart';

import '../utils/colors/colors.dart';

customDialog(
    {BuildContext? context,
      String? message,
      String? buttonTitle,
      Function()? onTap}){
  showDialog(context: context!, builder: (context){
    return Dialog(
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30)
      ),
      backgroundColor:  Colors.white,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
        ),
        height: 250,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Jacksi LTD",
                style: TextStyle(fontSize: 21,fontWeight: FontWeight.bold,color: mainColor ),
              ),
              Center(
                child: Text(
                  message!,
                  style: TextStyle(fontSize: 16 ,color: Colors.black),
                ),
              ),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 25),
                child: CustomRoundedButton(title: buttonTitle!, onPressed : onTap!),
              )
            ],
          ),
        ),
      ),
    );
  });
}