import 'package:e_commerce_app/helper/binding.dart';
import 'package:e_commerce_app/helper/local_storage_data.dart';
import 'package:e_commerce_app/view/Auth/login_screen.dart';
import 'package:e_commerce_app/view/control_view.dart';
import 'package:e_commerce_app/viewmodel/cart_viewmodel.dart';
import 'package:e_commerce_app/viewmodel/control_view_model.dart';
import 'package:e_commerce_app/viewmodel/home_view_model.dart';
import 'package:e_commerce_app/viewmodel/profile_view_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put(HomeViewModel());
  Get.lazyPut(() => profileViewModel());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(fontFamily: 'SourceSans'),
      initialBinding: Binding(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: ControllView(),
      ),
    );
  }
}
