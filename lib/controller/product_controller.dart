import 'package:beespokeai/services/http_service.dart';
import 'package:beespokeai/views/cart_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  var isLoading = true.obs;
  var productList = [].obs;
  bool isitemListscreen = true;
  bool isCartscreen = false;
  Rx<num> itemcount = 0.obs;
  Rx<double> price = 0.0.obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      var products = await HttpService.fetchProducts();
      if (products != null) {
        productList.value = products;
      }
    } finally {
      isLoading(false);
    }
  }
}
