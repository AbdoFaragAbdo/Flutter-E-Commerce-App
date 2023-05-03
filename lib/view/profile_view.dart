import 'package:e_commerce_app/view/Auth/login_screen.dart';
import 'package:e_commerce_app/view/home_view.dart';
import 'package:e_commerce_app/view/widget/Custom_text.dart';
import 'package:e_commerce_app/viewmodel/profile_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<profileViewModel>(
      init: profileViewModel(),
      builder: (controller) => controller.loading.value
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Scaffold(
              body: SafeArea(
              child: Container(
                  padding: EdgeInsets.only(top: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                height: 120,
                                width: 120,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50)),
                                  image: DecorationImage(
                                      // ignore: unnecessary_null_comparison
                                      image: controller.userModel == null
                                          ? AssetImage(
                                                  'assets/images/avatar.png')
                                              as ImageProvider
                                          : controller.userModel!.pic ==
                                                  'default'
                                              ? AssetImage(
                                                      'assets/images/avatar.png')
                                                  as ImageProvider
                                              : NetworkImage(
                                                  controller.userModel!.pic!),
                                      fit: BoxFit.fill),
                                ),
                              ),
                              Column(
                                children: [
                                  CustomText(
                                    text: controller.userModel!.name!,
                                    color: Colors.black,
                                    fontSize: 32,
                                  ),
                                  CustomText(
                                    text: controller.userModel!.email!,
                                    color: Colors.black,
                                    fontSize: 24,
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 100,
                        ),
                        Container(
                          child: MaterialButton(
                            onPressed: () {},
                            child: ListTile(
                              title: CustomText(
                                text: "Edit Profile",
                              ),
                              leading: Image.asset(
                                  "assets/images/menu_icon/icons8-pencil-30.png"),
                              trailing: Icon(Icons.navigate_next),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          child: MaterialButton(
                            onPressed: () {},
                            child: ListTile(
                              title: CustomText(
                                text: "Shipping Adress",
                              ),
                              leading: Image.asset(
                                  "assets/images/menu_icon/icons8-shipping-location-30.png"),
                              trailing: Icon(Icons.navigate_next),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          child: MaterialButton(
                            onPressed: () {},
                            child: ListTile(
                              title: CustomText(
                                text: "Order History",
                              ),
                              leading: Image.asset(
                                  "assets/images/menu_icon/icons8-time-machine-30.png"),
                              trailing: Icon(Icons.navigate_next),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          child: MaterialButton(
                            onPressed: () {},
                            child: ListTile(
                              title: CustomText(
                                text: "Cards",
                              ),
                              leading: Image.asset(
                                  "assets/images/menu_icon/icons8-bank-cards-30.png"),
                              trailing: Icon(Icons.navigate_next),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          child: MaterialButton(
                            onPressed: () {},
                            child: ListTile(
                              title: CustomText(
                                text: "Notifications",
                              ),
                              leading: Image.asset(
                                  "assets/images/menu_icon/icons8-notification-30.png"),
                              trailing: Icon(Icons.navigate_next),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          child: MaterialButton(
                            onPressed: () {
                              controller.signOut();
                              Get.offAll(LoginScreen());
                            },
                            child: ListTile(
                              title: CustomText(
                                text: "Log Out",
                              ),
                              leading: Image.asset(
                                  "assets/images/menu_icon/icons8-log-out-30.png"),
                              trailing: Icon(Icons.navigate_next),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  )),
            )),
    );
  }
}
