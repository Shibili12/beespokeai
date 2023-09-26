import 'package:beespokeai/services/http_service.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  HttpService cartService = HttpService();
  var cartItems = [];
  var loading = false.obs;
  var subtotal = 0.0.obs;

  CartController() {
    loadCartFromApi();
  }
  loadCartFromApi() async {
    loading(true);
    var productsList = await cartService.loadCartFromApi();

    for (var i = 0; i < productsList.length; i++) {
      var product =
          await cartService.getProductFromApi(productsList[i]["productId"]);
      subtotal(subtotal.value + product["price"] * productsList[i]["quantity"]);
      cartItems
          .add({"product": product, "quantity": productsList[i]["quantity"]});
    }
    loading(false);
  }
}
