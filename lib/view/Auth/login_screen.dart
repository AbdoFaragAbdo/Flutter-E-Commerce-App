import 'package:e_commerce_app/constant.dart';
import 'package:e_commerce_app/view/Auth/register_screen.dart';
import 'package:e_commerce_app/view/widget/Custom_text.dart';
import 'package:e_commerce_app/view/widget/custom_button.dart';
import 'package:e_commerce_app/view/widget/custombutton_social.dart';
import 'package:e_commerce_app/view/widget/customtextformfield.dart';
import 'package:e_commerce_app/viewmodel/authviewmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50, right: 20, left: 20),
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: "Welcome,",
                      fontSize: 30,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(RegisterView());
                      },
                      child: CustomText(
                        text: "Sign Up,",
                        fontSize: 18,
                        color: primaryColor,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                CustomText(
                  text: "Sign in to Continue",
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 30,
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
                SizedBox(height: 20),
                CustomText(
                  text: "Forgot Password?",
                  fontSize: 14,
                  alignment: Alignment.topRight,
                ),
                SizedBox(
                  height: 20,
                ),
                CustomButton(
                  text: "SIGN IN",
                  onpressed: () {
                    _formkey.currentState!.save();
                    if (_formkey.currentState!.validate()) {
                      controller.signInWithEmailAndPassword();
                    }
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                CustomText(
                  text: "-OR-",
                  alignment: Alignment.center,
                ),
                SizedBox(
                  height: 40,
                ),
                CustomButtonSocial(
                  text: "Sign In With Facebook",
                  imageName: "assets/images/facebook.png",
                ),
                SizedBox(
                  height: 40,
                ),
                CustomButtonSocial(
                  text: "Sign In With Google",
                  onpressed: () {
                    controller.GoogleSignInMethod();
                  },
                  imageName: "assets/images/google.png",
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
