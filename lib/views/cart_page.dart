import 'package:beespokeai/controller/product_controller.dart';
import 'package:beespokeai/widgets/cartlist.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

final ProductController controller = Get.put(ProductController());

class Cartscreen extends StatefulWidget {
  const Cartscreen({super.key});

  @override
  State<Cartscreen> createState() => _CartscreenState();
}

class _CartscreenState extends State<Cartscreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: controller.navigatetolistitemscreen,
      child: SafeArea(
        child: Scaffold(
          body: Column(children: [
            Image.asset(
              "assets/images/beespoke.png",
              width: 200,
            ),
            Column(
              children: [
                Cartlistview(),
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
                              onPressed: controller.isCheckOutButtonEnabled(),
                              child: const Text("Check out"))
                        ],
                      );
                    },
                  ),
                )
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
