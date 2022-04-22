import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_pos/app/core/theme/color_manager.dart';
import 'package:flutter_pos/app/core/theme/text_theme.dart';
import 'package:flutter_pos/app/core/theme/inputs/custom_input_decoration.dart';
import 'package:flutter_pos/app/global_widgets/app_bar.dart';
import 'package:flutter_pos/app/global_widgets/custom_button.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        backgroundColor: ColorManager.PRIMARY,
        title: "Login",
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  initialValue: '',
                  decoration: CustomInputDecoration.get(
                    icon: Icons.phone,
                    label: "Phone",
                  ),
                  onChanged: (value) {
                    controller.setPhone(value);
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false,
                  initialValue: '',
                  decoration: CustomInputDecoration.get(
                    icon: Icons.password,
                    label: "Password",
                  ),
                  onChanged: (value) {
                    controller.setPassword(value);
                  },
                ),
                CustomButton(
                  title: "Login",
                  onPressed: () {
                    controller.login();
                  },
                  icon: Icons.arrow_forward,
                  color: ColorManager.PRIMARY,
                  titleColor: ColorManager.TEXT,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
