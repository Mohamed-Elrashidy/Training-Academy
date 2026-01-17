import 'package:flutter/material.dart';
import 'package:training_acedamy/core/widgets/custom_text_field_with_title.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            spacing: 50,
            children: [CustomTextFieldWithTitle(), CustomTextFieldWithTitle()],
          ),
        ],
      ),
    );
  }
}
