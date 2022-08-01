import 'package:epicstar/core_utils/colors.dart';
import 'package:flutter/material.dart';
class EmailInputField extends StatelessWidget {
  const EmailInputField({Key? key, this.label, required this.controller, this.hint, this.prefixIcon}) : super(key: key);
  ///type [String] nullable
  final String? label;
  ///type [String] nullable
  final String? hint;
  /// type [EditTextInputController] notNullAble
  final TextEditingController controller;
  final Widget? prefixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        label: Text(label.toString(), style: TextStyle( color: AppColors.kPrimaryColor),),
        hintText: hint,
      ),
    );
  }
}
