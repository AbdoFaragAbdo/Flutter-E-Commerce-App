import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../view/cart_view.dart';
import '../view/home_view.dart';
import '../view/profile_view.dart';

class ControlViewModel extends GetxController {
  int _navigatorValue = 0;
  get navigatorValue => _navigatorValue;
  Widget _CurrentScreen = HomeView();
  get CurrentScreen => _CurrentScreen;

  void changeSelectedValue(selectedValue) {
    _navigatorValue = selectedValue;
    switch (selectedValue) {
      case 0:
        {
          _CurrentScreen = HomeView();
          break;
        }
      case 1:
        {
          _CurrentScreen = CartView();
          break;
        }
      case 2:
        {
          _CurrentScreen = ProfileView();
          break;
        }
    }
    update();
  }
}
