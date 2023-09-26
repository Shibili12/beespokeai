import 'dart:convert';

import 'package:beespokeai/model/product_models.dart';
import 'package:beespokeai/model/userloginmodel.dart';
import 'package:http/http.dart' as http;

class HttpService {
  // static var client = http.Client();

  static Future<List<ProductsModel>> fetchProducts() async {
    var response =
        await http.get(Uri.parse("https://fakestoreapi.com/products"));

    if (response.statusCode == 200) {
      var data = response.body;
      return productsModelFromJson(data);
    } else {
      // throw Exception();
      var data = response.body;
      return productsModelFromJson(data);
    }
  }

  static Future<dynamic> login(String username, String password) {
    final credentials = Userlogin(username: username, password: password);
    return http
        .post(Uri.parse("https://fakestoreapi.com/auth/login"),
            body: credentials.toJson())
        .then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        return jsonData;
      }
    }).catchError((err) => print(err));
  }

  loadCartFromApi() async {
    var response =
        await http.get(Uri.parse("https://fakestoreapi.com/carts/1"));
    var productsJson = json.decode(response.body);
    return productsJson["products"];
  }

  Future getProductFromApi(productId) async {
    var response = await http.get(
        Uri.parse("https://fakestoreapi.com/products/" + productId.toString()));
    return json.decode(response.body);
  }
}
