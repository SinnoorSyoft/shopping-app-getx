import 'package:e_commerce/app/data/model/product.dart';
import 'package:get/get.dart';

class ProductService extends GetConnect {
  final url = 'https://fakestoreapi.com/products';

  Future<List<Product>> getProducts() async {
    final response = await get(url);
    if (response.status.hasError) {
      return Future.error(response.statusText.toString());
    } else {
      return productFromJson(response.bodyString.toString());
    }
  }
}
