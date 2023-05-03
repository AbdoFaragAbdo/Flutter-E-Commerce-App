import 'package:flutter/material.dart';

import '../../constant.dart';
import 'Custom_text.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.text, this.onpressed});
  final String? text;
  final Function()? onpressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: primaryColor,
      padding: EdgeInsets.all(18),
      onPressed: onpressed,
      child: CustomText(
        text: text!,
        alignment: Alignment.center,
        color: Colors.white,
      ),
    );
  }
}
