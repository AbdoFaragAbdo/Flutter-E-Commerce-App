import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/core/service/home_service.dart';
import 'package:e_commerce_app/model/category_model.dart';
import 'package:e_commerce_app/model/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeViewModel extends GetxController {
  ValueNotifier<bool> get loading => _loading;
  ValueNotifier<bool> _loading = ValueNotifier(false);
  List<CategoryModel> get categoryModel => _categoryModel;
  List<CategoryModel> _categoryModel = [];
  List<ProductModel> get productModel => _productModel;
  List<ProductModel> _productModel = [];

  HomeViewModel() {
    getCategory();
    getBestSellingProduct();
  }

  getCategory() async {
    _loading.value = true;

    HomeService().getCategory().then((value) {
      for (int i = 0; i < value.length; i++) {
        _categoryModel.add(
            CategoryModel.fromjson(value[i].data() as Map<String, dynamic>));
        print(_categoryModel.length);
        _loading.value = false;
      }
      update();
    });
  }

  getBestSellingProduct() {
    _loading.value = true;
    HomeService().getBestSelling().then((value) {
      for (int i = 0; i < value.length; i++) {
        _productModel.add(
            ProductModel.fromjson(value[i].data() as Map<String, dynamic>));
        print(_productModel.length);
        _loading.value = false;
      }
      print(_productModel.length);
      update();
    });
  }
}
