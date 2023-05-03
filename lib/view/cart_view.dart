import 'dart:ffi';

import 'package:e_commerce_app/constant.dart';
import 'package:e_commerce_app/model/cart_product_model.dart';
import 'package:e_commerce_app/view/widget/Custom_text.dart';
import 'package:e_commerce_app/view/widget/custom_button.dart';
import 'package:e_commerce_app/viewmodel/cart_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CartView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartViewModel>(
        init: CartViewModel(),
        builder: (controller) => Scaffold(
              body: controller.cartProductModel.length == 0
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          "assets/images/emty cart.svg",
                          height: 200,
                          width: 200,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const CustomText(
                          text: "Cart Empty",
                          fontSize: 32,
                          alignment: Alignment.bottomCenter,
                        )
                      ],
                    )
                  : Column(
                      children: [
                        Expanded(
                          child: GetBuilder<CartViewModel>(
                            init: CartViewModel(),
                            builder: (controller) => Container(
                              child: ListView.separated(
                                itemCount: controller.cartProductModel.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                    height: 140,
                                    child: Row(
                                      children: [
                                        Container(
                                            width: 140,
                                            child: Image.network(
                                              controller
                                                  .cartProductModel[index].image
                                                  .toString(),
                                              fit: BoxFit.fill,
                                            )),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 30),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              CustomText(
                                                text: controller
                                                    .cartProductModel[index]
                                                    .name
                                                    .toString(),
                                                fontSize: 21,
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              CustomText(
                                                text:
                                                    '\$ ${controller.cartProductModel[index].price.toString()}',
                                                color: primaryColor,
                                              ),
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              Container(
                                                width: 140,
                                                height: 40,
                                                color: Colors.grey.shade200,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () {
                                                        controller
                                                            .increaseQuantity(
                                                                index);
                                                      },
                                                      child: const Icon(
                                                        Icons.add,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      width: 20,
                                                    ),
                                                    CustomText(
                                                      text: controller
                                                          .cartProductModel[
                                                              index]
                                                          .quantity
                                                          .toString(),
                                                      fontSize: 20,
                                                      alignment:
                                                          Alignment.center,
                                                      color: Colors.black,
                                                    ),
                                                    const SizedBox(
                                                      width: 20,
                                                    ),
                                                    Container(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              bottom: 15),
                                                      child: GestureDetector(
                                                        onTap: () {
                                                          controller
                                                              .decreaseQuantity(
                                                                  index);
                                                        },
                                                        child: const Icon(
                                                          Icons.minimize,
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                },
                                separatorBuilder:
                                    (BuildContext context, int index) {
                                  return const SizedBox(
                                    height: 15,
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30, right: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  const CustomText(
                                    text: 'TOTAL',
                                    fontSize: 22,
                                    color: Colors.grey,
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  GetBuilder<CartViewModel>(
                                    init: CartViewModel(),
                                    builder: (controller) => CustomText(
                                      text: '\$ ${controller.totalPrice}',
                                      fontSize: 18,
                                      color: primaryColor,
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                padding: const EdgeInsets.all(10),
                                width: 180,
                                height: 80,
                                child: CustomButton(
                                  text: 'CHECKOUT',
                                  onpressed: () {},
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
            ));
  }
}
