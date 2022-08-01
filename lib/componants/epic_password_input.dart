import 'package:flutter/material.dart';
class InputPasswordField extends StatefulWidget {
  const InputPasswordField({Key? key, this.label, this.hint, required this.controller, this.prefixIcon}) : super(key: key);
  ///type [String] nullable
  final String? label;
  ///type [String] nullable
  final String? hint;
  /// type [EditTextInputController] notNullAble
  final TextEditingController controller;
  final Widget? prefixIcon;
  @override
  State<InputPasswordField> createState() => _InputPasswordFieldState();
}

class _InputPasswordFieldState extends State<InputPasswordField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField();
  }
}
