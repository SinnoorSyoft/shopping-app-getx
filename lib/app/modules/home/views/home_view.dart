import 'package:e_commerce/app/data/model/cart_item.dart';
import 'package:e_commerce/app/modules/cart/controllers/cart_controller.dart';
import 'package:e_commerce/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.put(CartController());
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.favorite_outline),
            ),
            IconButton(
              onPressed: () => Get.toNamed(Routes.CART),
              icon: const Icon(Icons.shopping_cart_outlined),
            ),
          ],
        ),
        body: controller.obx(
          (state) => MasonryGridView.builder(
            itemCount: state!.length,
            gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemBuilder: (context, index) {
              return Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(
                      state[index].image!,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      state[index].title!,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$${state[index].price}',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                        buildRatingStar(state[index].rating!.rate!.toInt()),
                      ],
                    ),
                    OutlinedButton.icon(
                      style: OutlinedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 40),
                      ),
                      onPressed: () {
                        cartController.addToCart(CartItem(
                          product: state[index],
                          quantity: 1,
                        ));
                      },
                      label: const Text('Add to cart'),
                      icon: const Icon(Icons.shopping_cart_outlined),
                    ),
                  ],
                ),
              );
            },
          ),
        ));
  }

  buildRatingStar(int count) {
    return Row(
      children: List.generate(5, (index) {
        return Icon(
          Icons.star,
          color: index < count ? Colors.orange : Colors.grey,
          size: 15,
        );
      }),
    );
  }
}
