import 'package:flutter/material.dart';
import 'package:flutter_pos/app/data/services/cart_service.dart';
import 'package:flutter_pos/app/global_widgets/loading.dart';
import 'package:get/get.dart';

import '../controllers/product_controller.dart';

class ProductList extends GetView<ProductController> {
  final cart = Get.find<CartService>();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Obx(
            () => controller.productLoader
                ? Loading()
                : Card(
                    child: ListTile(
                      leading: FlutterLogo(size: 56.0),
                      title: Obx(() => Text("Clicks: ${cart.count}")),
                      subtitle: Text("Product Short Description"),
                      onTap: () => () {},
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
