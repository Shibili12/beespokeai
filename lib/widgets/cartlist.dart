import 'package:beespokeai/controller/cart_controller.dart';
import 'package:beespokeai/controller/product_controller.dart';
import 'package:beespokeai/model/product_models.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final CartController controller = Get.put(CartController());

class Cartlistview extends StatelessWidget {
  String name;
  String price;
  Cartlistview({
    required this.name,
    required this.price,
  });

  Widget countButton(int index, void Function(int index) counter,
      {IconData icon = Icons.add}) {
    return RawMaterialButton(
      onPressed: () {
        counter(index);
      },
      elevation: 2.0,
      fillColor: Colors.white,
      child: Icon(
        icon,
        size: 15,
      ),
      shape: const CircleBorder(),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget listviewbody(ProductsModel product, int index) {
      return Card(
        child: Row(
          children: [
            const SizedBox(width: 20),
            CachedNetworkImage(
              imageUrl: product.image!,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 20),
            Column(
              children: [
                Text(name),
                Text(price),
              ],
            ),
            Row(
              children: [
                countButton(index, controller.increase),
                Obx(() => Text(controller.productList[index].count.toString())),
                countButton(index, controller.decrease, icon: Icons.remove)
              ],
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(15),
      itemCount: controller.productList.length,
      itemBuilder: (context, index) {
        ProductsModel item = controller.productList[index];
        if (controller.isItemListScreen) {
          return listviewbody(item, index);
        } else if (controller.isCartScreen) {
          return listviewbody(item, index);
        } else {
          return Container();
        }
      },
    );
  }
}
