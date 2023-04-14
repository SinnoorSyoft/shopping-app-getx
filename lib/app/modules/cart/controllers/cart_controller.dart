import 'package:e_commerce/app/data/model/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  RxList<CartItem> cartItems = <CartItem>[].obs;

  void addToCart(CartItem cart) {
    cartItems.firstWhereOrNull((item) => item.product.id == cart.product.id) == null
        ? cartItems.add(cart)
        : ScaffoldMessenger.of(Get.context!).showSnackBar(
            const SnackBar(
              content: Text('Item already in cart'),
            ),
          );
  }

  void removeFromCart(CartItem cartItem) {
    cartItems.remove(cartItem);
  }

  double get total => cartItems.fold(0, (sum, item) => sum + item.product.price! * item.quantity);

  int get count => cartItems.length;

  increaseQuantity(CartItem cartItem) {
    cartItem.quantity++;
    update();
  }

  decreaseQuantity(CartItem cartItem) {
    if (cartItem.quantity > 1) {
      cartItem.quantity--;
      update();
    }
  }
}
