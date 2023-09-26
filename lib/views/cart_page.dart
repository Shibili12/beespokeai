import 'package:beespokeai/controller/cart_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Cartpage extends StatefulWidget {
  const Cartpage({super.key});

  @override
  State<Cartpage> createState() => _CartpageState();
}

class _CartpageState extends State<Cartpage> {
  final CartController cartController = CartController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.deepPurple),
        backgroundColor: Colors.grey[100],
        centerTitle: true,
        title: Text(
          "Cart",
          style: TextStyle(
            color: Colors.deepPurple,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: Colors.grey[100],
      body: Obx(() {
        if (cartController.loading.value) {
          return Center(child: CircularProgressIndicator());
        }
        if (cartController.cartItems.isEmpty) {
          return Center(child: Text("No cart items found!"));
        }
        return Stack(
          children: [
            Container(),
            Positioned.fill(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: cartController.cartItems.length,
                padding: EdgeInsets.all(8),
                itemBuilder: (context, index) => Card(
                  elevation: 0,
                  child: Container(
                    height: 110,
                    padding: const EdgeInsets.all(8.0),
                    width: 100,
                    margin: EdgeInsets.all(4.0),
                    child: Row(
                      children: [
                        Container(
                          width: 100,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: CachedNetworkImageProvider(cartController
                                    .cartItems[index]["product"]["image"])),
                          ),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.all(8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  cartController.cartItems[index]["product"]
                                      ["title"],
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    cartController.cartItems[index]["product"]
                                        ["description"],
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Text(
                                  "\$${cartController.cartItems[index]["product"]["price"]}",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              height: 30,
                              width: 30,
                              color: Colors.grey[200],
                              child: Center(
                                child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.remove),
                                  iconSize: 15,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(8.0),
                              child: Text(cartController.cartItems[index]
                                      ["quantity"]
                                  .toString()),
                            ),
                            Container(
                              height: 30,
                              width: 30,
                              color: Colors.grey[200],
                              child: IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.add),
                                iconSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            _buildBottom(),
          ],
        );
      }),
    );
  }

  Positioned _buildBottom() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        height: 100,
        color: Colors.white,
        padding: const EdgeInsets.only(
          left: 16.0,
          right: 16,
          bottom: 8.0,
          top: 4.0,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Subtotal",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "\$${cartController.subtotal}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                    Text(
                      "Subtotal does not include shipping",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16),
            Expanded(
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("Continue shopping"))),
          ],
        ),
      ),
    );
  }
}
