import 'package:e_commerce_app/view/Auth/login_screen.dart';
import 'package:e_commerce_app/viewmodel/authviewmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant.dart';
import '../widget/Custom_text.dart';
import '../widget/custom_button.dart';
import '../widget/custombutton_social.dart';
import '../widget/customtextformfield.dart';

class RegisterView extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: GestureDetector(
          onTap: (() {
            Get.off(LoginScreen());
          }),
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50, right: 20, left: 20),
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                CustomText(
                  text: "Sign Up,",
                  fontSize: 30,
                ),
                SizedBox(
                  height: 40,
                ),
                CustomTextFormField(
                  text: "Name",
                  hint: "pesa",
                  validator: (Value) {
                    if (Value == null) {
                      print("error");
                    }
                  },
                  onsave: (Value) {
                    controller.name = Value;
                  },
                ),
                SizedBox(
                  height: 40,
                ),
                CustomTextFormField(
                  text: "Email",
                  hint: "iamabdo@gmail.com",
                  validator: (Value) {
                    if (Value == null) {
                      print("error");
                    }
                  },
                  onsave: (Value) {
                    controller.email = Value;
                  },
                ),
                SizedBox(
                  height: 40,
                ),
                CustomTextFormField(
                  text: "Password",
                  hint: "*********",
                  onsave: (Value) {
                    controller.password = Value;
                  },
                  validator: (Value) {
                    if (Value == null) {
                      print("error");
                    }
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                CustomButton(
                  text: "SIGN UP",
                  onpressed: () {
                    _formkey.currentState!.save();
                    if (_formkey.currentState!.validate()) {
                      controller.createAccountWithEmailAndPassword();
                    }
                  },
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
