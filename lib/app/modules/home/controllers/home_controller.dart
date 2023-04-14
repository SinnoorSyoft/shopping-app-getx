import 'package:e_commerce/app/data/model/product.dart';
import 'package:e_commerce/app/data/model/service/product_service.dart';
import 'package:get/get.dart';

class HomeController extends GetxController with StateMixin<List<Product>> {
  final ProductService _productService = ProductService();

  getProducts() async {
    try {
      final products = await _productService.getProducts();
      change(products, status: RxStatus.success());
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  @override
  void onInit() {
    getProducts();
    super.onInit();
  }
}
