import 'package:e_commerce_app/helper/extension.dart';
import 'package:flutter/animation.dart';

class ProductModel {
  String? productid, name, image, description, size, price;
  Color? color;
  ProductModel(
      {this.name,
      this.image,
      this.description,
      this.color,
      this.size,
      this.price,
      this.productid});
  ProductModel.fromjson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    name = map['name'];
    image = map['image'];
    description = map['description'];
    color = HexColor.fromHex(map['color']);
    size = map['size'];
    price = map['price'];
    productid = map['productid'];
  }
  tojson() {
    return {
      'name': name,
      'image': image,
      'description': description,
      'color': color,
      'size': size,
      'price': price,
      'productid': productid
    };
  }
}
