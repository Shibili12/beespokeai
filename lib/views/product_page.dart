import 'package:beespokeai/controller/product_controller.dart';
import 'package:beespokeai/widgets/product_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Producthome extends StatelessWidget {
  Producthome({super.key});
  final ProductController productController = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Image.asset(
                "assets/images/beespoke.png",
                width: 200,
              ),
            ),
            Expanded(
              child: Obx(
                () {
                  if (productController.isLoading.value) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    return MasonryGridView.builder(
                      gridDelegate:
                          SliverSimpleGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2),
                      itemCount: productController.productList.length,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      itemBuilder: (context, index) {
                        return ProductTile(
                            productController.productList[index]);
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
