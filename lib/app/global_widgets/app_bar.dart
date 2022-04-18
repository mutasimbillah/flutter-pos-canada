import 'package:flutter/material.dart';
import 'package:flutter_pos/app/core/theme/color_manager.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color backgroundColor;

  const CustomAppBar({
    Key? key,
    this.title = "Page Title",
    this.backgroundColor = ColorManager.PRIMARY,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(60.0);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      centerTitle: true,
      title: Text(title),
      elevation: 1,
    );
  }
}
