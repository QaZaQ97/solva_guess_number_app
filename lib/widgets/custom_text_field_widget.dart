import 'package:flutter/material.dart';

class CustomTextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  const CustomTextFieldWidget(this.controller, {super.key});

  @override
  Widget build(BuildContext context) {
    FocusNode focusNode = FocusNode();
    return SizedBox(
      width: 40,
      child: TextField(
        controller: controller,
        maxLength: 2,
        focusNode: focusNode,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        onTapOutside: (event) => focusNode.unfocus(),
        decoration: const InputDecoration(
          counterText: '',
          contentPadding: EdgeInsets.zero,
          filled: true,
          fillColor: Colors.deepPurple,
        ),
      ),
    );
  }
}
