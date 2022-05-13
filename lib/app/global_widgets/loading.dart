import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 150.0),
      child: Center(
        child: SizedBox(
          child: CircularProgressIndicator(),
          height: 180.0,
          width: 180.0,
        ),
      ),
    );
  }
}
