import 'package:beespokeai/model/product_models.dart';
import 'package:beespokeai/services/http_service.dart';
import 'package:beespokeai/views/cart_page.dart';

import 'package:beespokeai/widgets/cartlist.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  var productList = [].obs;
  bool isItemListScreen = true;
  bool isCartScreen = false;
  Rx<num> itemCount = 0.obs;
  Rx<double> price = 0.0.obs;

  // Widget navigateToCartScreen(BuildContext context) {
  //   isCartScreen = true;
  //   isItemListScreen = false;
  //   calculatePrice();
  //   return  CartScreen(
  //     ,
  //   );
  // }

  countAllItems() {
    itemCount.value = 0;
    for (var element in productList) {
      itemCount.value += element.count;
    }
  }

  calculatePrice() {
    price.value = 0.0;
    for (var element in productList) {
      if (element.count > 0) {
        price.value = (double.parse(element.price.replaceAll("\$", "").trim()) *
                element.count) +
            price.value;
      }
    }
  }

  Future<bool> navigateToListItemScreen() async {
    isCartScreen = false;
    isItemListScreen = true;
    return true;
  }

  void increase(int index) {
    productList[index].count++;
    productList.refresh();
    countAllItems();
    calculatePrice();
  }

  void decrease(int index) {
    if (productList[index].count > 0) {
      productList[index].count--;
      productList.refresh();
      countAllItems();
      calculatePrice();
    }
  }

  void removeItems() {
    for (var item in productList) {
      item.count = 0;
      productList.refresh();
      itemCount.value = 0;
      calculatePrice();
    }
  }

  VoidCallback? isCheckOutButtonEnabled() {
    if (itemCount > 0) return () {};
    return null;
  }
}
