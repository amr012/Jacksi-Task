import 'package:flutter/material.dart';
import 'package:jacksi_task/utils/colors/colors.dart';

class CustomTextFormField extends StatelessWidget {
  bool isDarkMode = false;


  CustomTextFormField({required this.label, required this.controller, Key? key,this.validator,this.keyboardType,this.onChange,
    required this.title, this.isEnabled}) : super(key: key);
  String label,title;
  TextEditingController controller;
  String? Function(String?)? validator;
  TextInputType? keyboardType;
  Function(String)? onChange;
  bool? isEnabled;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            title,
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold
            ),
          ),
        ),
        Container(
          color: Colors.white,
          height: 55,
          child: TextFormField(
            onChanged: onChange,
            validator: validator ,
            controller: controller,
            keyboardType: keyboardType,
            enabled: isEnabled,
            textAlign: TextAlign.end,
            style: TextStyle(height: 1.2,color: isDarkMode ? Colors.white : Colors.black),
            decoration: InputDecoration(
              hintText: label,
                hintStyle: TextStyle(
                  color: darkGreyColor.withOpacity(.5)
                ),
                errorStyle: TextStyle(height: .8),
                // errorBorder: OutlineInputBorder(
                //     borderRadius: BorderRadius.circular(15),
                //     borderSide: BorderSide(
                //       color: greyTextColor.withOpacity(.2),
                //     )
                // ),

                border: OutlineInputBorder(
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      color: darkGreyColor.withOpacity(.2),
                    )
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                        color: darkGreyColor.withOpacity(.2)
                    )
                ),
                disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                        color: darkGreyColor.withOpacity(.2)
                    )
                )
            ),
          ),
        ),
      ],
    );
  }
}
