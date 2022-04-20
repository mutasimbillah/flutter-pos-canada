import 'package:flutter/material.dart';
import 'package:flutter_pos/app/core/theme/color_manager.dart';
import 'package:flutter_pos/app/core/theme/text_theme.dart';
import 'package:flutter_pos/app/global_widgets/app_bar.dart';
//import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
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
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 0, vertical: 20),
                  child: Text(
                    "Header",
                    style: CustomTextTheme.header,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.showNotification,
        tooltip: 'Add',
        child: const Icon(Icons.add),
      ),
    );
  }
}
