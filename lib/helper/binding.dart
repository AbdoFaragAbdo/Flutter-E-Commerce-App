import 'package:e_commerce_app/helper/local_storage_data.dart';
import 'package:e_commerce_app/viewmodel/authviewmodel.dart';
import 'package:e_commerce_app/viewmodel/cart_viewmodel.dart';
import 'package:e_commerce_app/viewmodel/control_view_model.dart';
import 'package:e_commerce_app/viewmodel/home_view_model.dart';
import 'package:e_commerce_app/viewmodel/profile_view_model.dart';
import 'package:get/get.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthViewModel());
    Get.lazyPut(() => ControlViewModel());
    Get.lazyPut(() => CartViewModel());
    Get.lazyPut(() => LocalStorageData());
    Get.lazyPut(() => profileViewModel());
  }
}
