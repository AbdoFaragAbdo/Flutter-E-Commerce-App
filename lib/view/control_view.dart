import 'package:e_commerce_app/view/Auth/login_screen.dart';
import 'package:e_commerce_app/view/cart_view.dart';
import 'package:e_commerce_app/view/home_view.dart';
import 'package:e_commerce_app/view/profile_view.dart';
import 'package:e_commerce_app/viewmodel/authviewmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../viewmodel/control_view_model.dart';

class ControllView extends GetWidget<AuthViewModel> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return (Get.find<AuthViewModel>().user == null)
          ? LoginScreen()
          : GetBuilder<ControlViewModel>(
              init: ControlViewModel(),
              builder: (controller) => Scaffold(
                  body: controller.CurrentScreen,
                  bottomNavigationBar: bottomNavigationBar()),
            );
    });
  }

  Widget bottomNavigationBar() {
    return GetBuilder<ControlViewModel>(
      init: ControlViewModel(),
      builder: (controller) => BottomNavigationBar(
        onTap: (Index) {
          controller.changeSelectedValue(Index);
          print('index : $Index');
        },
        currentIndex: controller.navigatorValue,
        elevation: 0,
        selectedItemColor: Colors.black,
        backgroundColor: Colors.grey.shade50,
        items: [
          BottomNavigationBarItem(
              activeIcon: Padding(
                padding: const EdgeInsets.only(top: 25.0),
                child: Text("Explore"),
              ),
              label: "",
              icon: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Image.asset(
                  "assets/images/Icon_Explore.png",
                  fit: BoxFit.contain,
                  width: 20,
                ),
              )),
          BottomNavigationBarItem(
              activeIcon: Padding(
                padding: const EdgeInsets.only(top: 25.0),
                child: Text("Cart"),
              ),
              label: "",
              icon: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Image.asset(
                  "assets/images/Icon_Cart.png",
                  fit: BoxFit.contain,
                  width: 20,
                ),
              )),
          BottomNavigationBarItem(
              activeIcon: Padding(
                padding: const EdgeInsets.only(top: 25.0),
                child: Text("Account"),
              ),
              label: "",
              icon: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Image.asset(
                  "assets/images/Icon_User.png",
                  fit: BoxFit.contain,
                  width: 20,
                ),
              )),
        ],
      ),
    );
  }
}
