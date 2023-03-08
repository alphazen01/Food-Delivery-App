import 'dart:convert';
import 'package:food/check/models/product_model.dart';
import 'package:http/http.dart' as http;

class Services {
  static var client = http.Client();

  static Future<List<CheckProductModel>> fetchProduct() async {
    var response = await client.get(
        Uri.parse("https://mvs.bslmeiyu.com/api/v1/products/popular"));

    if (response.statusCode == 200) {
      Map<String, dynamic> _data = json.decode(response.body);
      List<CheckProductModel> result = [];
      List<Map<String, dynamic>> product =
      (_data["products"] as List<dynamic>).cast<Map<String, dynamic>>();

      product.forEach(
        (element) {
          result.add(CheckProductModel.fromJson(element));
        },
      );
      return result;
    } else {
      return [];
    }
  }
}
