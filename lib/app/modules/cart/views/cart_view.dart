import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/model/cart_item.dart';
import '../controllers/cart_controller.dart';

class CartView extends GetView<CartController> {
  const CartView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Cart'),
        centerTitle: true,
      ),
      body: ListView.separated(
        itemCount: controller.cartItems.length,
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(height: 10);
        },
        itemBuilder: (BuildContext context, int index) {
          final CartItem cartItem = controller.cartItems[index];
          return ListTile(
            leading: Image.network(cartItem.product.image!),
            title: Text(cartItem.product.title!),
            subtitle: Text('\$${cartItem.product.price}'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () => controller.decreaseQuantity(cartItem),
                  icon: const Icon(Icons.remove),
                ),
                GetBuilder<CartController>(
                  builder: (_) {
                    return Text('${cartItem.quantity}');
                  },
                ),
                IconButton(
                  onPressed: () => controller.increaseQuantity(cartItem),
                  icon: const Icon(Icons.add),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
