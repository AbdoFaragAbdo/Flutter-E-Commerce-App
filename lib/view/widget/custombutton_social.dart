import 'package:flutter/material.dart';

import 'Custom_text.dart';

class CustomButtonSocial extends StatelessWidget {
  const CustomButtonSocial(
      {super.key, this.text, this.imageName, this.onpressed});
  final String? text;
  final String? imageName;
  final Function()? onpressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: Colors.grey.shade100),
      child: MaterialButton(
        onPressed: onpressed,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            Image.asset(imageName!),
            SizedBox(
              width: 90,
            ),
            CustomText(
              text: text!,
            )
          ],
        ),
      ),
    );
  }
}
