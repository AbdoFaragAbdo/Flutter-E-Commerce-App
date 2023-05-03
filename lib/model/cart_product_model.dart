import 'package:flutter/material.dart';

class CartProductModel {
  String? productid, name, image, price;
  int? quantity;

  CartProductModel(
      {this.name, this.image, this.quantity, this.price, this.productid});
  CartProductModel.fromjson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    name = map['name'];
    image = map['image'];
    quantity = map['quantity'];
    price = map['price'];
    productid = map['productid'];
  }
  tojson() {
    return {
      'name': name,
      'image': image,
      'quantity': quantity,
      'price': price,
      'productid': productid
    };
  }
}
