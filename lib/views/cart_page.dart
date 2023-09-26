import 'package:beespokeai/controller/cart_controller.dart';
import 'package:beespokeai/widgets/cartlist.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final CartController controller = Get.put(CartController());

class CartScreen extends StatelessWidget {
  String name;
  String price;
  CartScreen({
    required this.name,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: controller.navigateToListItemScreen,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.deepPurple),
          title: const Text(
            "Cart",
            style: TextStyle(color: Colors.deepPurple),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: IconButton(
                onPressed: controller.removeItems,
                icon: const Icon(Icons.delete_forever),
              ),
            )
          ],
        ),
        body: Column(
          children: [
            Expanded(
                child: Cartlistview(
              name: name,
              price: price,
            )),
            SizedBox(
              height: 70,
              child: Column(
                children: [
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: Obx(
                      () {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Total",
                                ),
                                Text(
                                  controller.price.value.toString(),
                                )
                              ],
                            ),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.deepPurple),
                                onPressed: controller.isCheckOutButtonEnabled(),
                                child: const Text("Check out"))
                          ],
                        );
                      },
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
