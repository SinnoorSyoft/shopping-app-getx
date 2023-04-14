import 'package:e_commerce/app/data/model/product.dart';

class CartItem {
  Product product;
  int quantity;

  CartItem({
    required this.product,
    this.quantity = 1,
  });
}
