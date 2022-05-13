import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pos/app/core/theme/color_manager.dart';
import 'package:flutter_pos/app/data/services/api/api_service.dart';
import 'package:flutter_pos/app/data/services/cart_service.dart';
import 'package:flutter_pos/app/global_widgets/app_bar.dart';
import 'package:flutter_pos/app/data/models/user_model.dart';
//import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  ApiService apiService = ApiService();
  final cart = Get.find<CartService>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        backgroundColor: ColorManager.PRIMARY,
        title: "Welcome",
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                //custom itemBuilder and dropDownBuilder
                DropdownSearch<UserModel>(
                  showSelectedItems: true,
                  showSearchBox: true,
                  mode: Mode.BOTTOM_SHEET,
                  compareFn: (i, s) => i?.isEqual(s) ?? false,
                  dropdownSearchDecoration: InputDecoration(
                    labelText: "Select User",
                    contentPadding: EdgeInsets.fromLTRB(12, 12, 0, 0),
                    border: OutlineInputBorder(),
                  ),
                  onFind: (String? filter) => apiService.getCustomers(filter),
                  onChanged: (data) {
                    print(data);
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Card(
                  child: ListTile(
                    leading: FlutterLogo(size: 56.0),
                    title: Obx(() => Text("Clicks: ${cart.count}")),
                    subtitle: Text("CA 11"),
                    onTap: () => () {},
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.addProduct(),
        tooltip: 'Add',
        child: const Icon(Icons.add),
      ),
    );
  }
}
