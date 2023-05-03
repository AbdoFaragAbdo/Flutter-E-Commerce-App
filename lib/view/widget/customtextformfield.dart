import 'dart:ffi';

import 'package:flutter/material.dart';

import 'Custom_text.dart';

class CustomTextFormField extends StatelessWidget {
  final String? text;
  final String? hint;
  final Function(String?)? onsave;
  final String? Function(String?)? validator;

  CustomTextFormField({this.text, this.hint, this.onsave, this.validator});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CustomText(
            text: text!,
            fontSize: 14,
            color: Colors.grey.shade900,
          ),
          SizedBox(
            height: 30,
          ),
          TextFormField(
            onSaved: onsave,
            validator: validator,
            decoration: InputDecoration(
                hintText: hint,
                hintStyle: TextStyle(color: Colors.black),
                fillColor: Colors.white),
          )
        ],
      ),
    );
  }
}
