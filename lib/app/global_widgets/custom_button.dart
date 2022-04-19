import 'package:flutter/material.dart';
import 'package:flutter_pos/app/core/theme/color_manager.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Color titleColor;
  final Function() onPressed;
  final Color color;
  final IconData icon;

  const CustomButton({
    Key? key,
    this.title = "",
    this.titleColor = ColorManager.TEXT,
    required this.onPressed,
    this.color = Colors.white,
    this.icon = Icons.arrow_forward,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 0,
        vertical: 15,
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(8),
          primary: color,
          // shape: RoundedRectangleBorder(
          //   //borderRadius: BorderRadius.circular(8),
          // ),
          elevation: 2,
        ),
        onPressed: onPressed,
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Center(
                child: Text(title),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 4,
                vertical: 4,
              ),
              child: Icon(
                icon,
                color: Colors.white,
                size: 28.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
