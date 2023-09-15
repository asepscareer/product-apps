import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:product_apps/const/constanta.dart';
import 'package:product_apps/models/product.dart';

class GetListProducts {
  Future<ProductData?> getData() async {
    try {
      final url = Uri.parse(ApiConstants.listProducts);
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        final result = ProductData.fromJson(jsonData);

        // for (Product product in result.products) {
        //   print("Title: ${product.title}, Price: \$${product.price}");
        // }

        return result;
      } else {
        print("Failed to fetch data. Status code: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print("Error: $e");
      return null;
    }
  }
}
