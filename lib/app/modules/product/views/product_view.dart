import 'package:flutter/material.dart';
import 'package:flutter_pos/app/data/services/cart_service.dart';
import 'package:flutter_pos/app/modules/product/views/product_list.dart';

import 'package:get/get.dart';

import '../controllers/product_controller.dart';

class ProductView extends GetView<ProductController> {
  final cart = Get.find<CartService>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: [
            ProductList(),
          ],
        ),
      ),
    );
  }
}
