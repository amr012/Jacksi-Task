import 'package:flutter/material.dart';

import '../utils/colors/colors.dart';

class CustomRoundedButton extends StatelessWidget {
  const CustomRoundedButton({required this.title,required this.onPressed, Key? key}) : super(key: key);
  final String title;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(onPressed: onPressed,
      color: mainColor,
      height: 48,
      minWidth: double.infinity,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25)
      ),
      child: Text(title,style: TextStyle(color: Colors.white,

          ),),);
  }
}