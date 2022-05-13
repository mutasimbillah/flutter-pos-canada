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
            () => controller.isLoading
                ? Loading()
                : ListView.builder(
                    padding: EdgeInsets.only(bottom: Get.height * 0.02),
                    physics: ClampingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: controller.products.length,
                    itemBuilder: (context, index) {
                      return Container(
                        child: Card(
                          child: ListTile(
                            leading: FlutterLogo(size: 56.0),
                            title: Text("${controller.products[index].name}"),
                            subtitle: Text(
                                "Price : ${controller.products[index].price}"),
                            onTap: () => () {},
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
