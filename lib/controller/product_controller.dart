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

  Widget navigatetocartscreen(BuildContext context) {
    isCartscreen = true;
    isitemListscreen = false;
    calculateprice();
    return const Cartscreen();
  }

  countallitems() {
    itemcount.value = 0;
    for (var elements in productList) {
      itemcount.value += elements.count;
    }
  }

  calculateprice() {
    price.value = 0.0;
    for (var elements in productList) {
      if (elements.count > 0) {
        price.value =
            (double.parse(elements.price.replaceAll("\$", "").trim()) *
                    elements.count) +
                price.value;
      }
    }
  }

  Future<bool> navigatetolistitemscreen() async {
    isCartscreen = false;
    isitemListscreen = true;
    return true;
  }

  void increase(int index) {
    productList[index].count++;
    productList.refresh();
    countallitems();
    calculateprice();
  }

  void decrease(int index) {
    if (productList[index].count > 0) {
      productList[index].count--;
      productList.refresh();
      countallitems();
      calculateprice();
    }
  }

  void removeitems() {
    for (var item in productList) {
      item.count = 0;
      productList.refresh();
      itemcount.value = 0;
      calculateprice();
    }
  }

  VoidCallback? isCheckOutButtonEnabled() {
    if (itemcount > 0) return () {};
    return null;
  }
}
