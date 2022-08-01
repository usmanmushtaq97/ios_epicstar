import 'package:epicstar/core_utils/colors.dart';
import 'package:flutter/material.dart';
class EpicTextButton extends StatelessWidget {
  const EpicTextButton({Key? key, required this.onPress, required this.title}) : super(key: key);
  /// type [String] notnull
 final String title;
  /// type[callBak] notnull
  final VoidCallback onPress;
  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: onPress, child: Text(title, style: const TextStyle(color: AppColors.blackTextColor),));
  }
}
