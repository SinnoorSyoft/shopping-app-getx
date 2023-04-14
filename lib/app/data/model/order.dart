import 'cart_item.dart';

class Order {
  String orderId;
  double amount;
  List<CartItem> products;
  DateTime dateTime;

  Order({
    required this.orderId,
    required this.amount,
    required this.products,
    required this.dateTime,
  });
}
