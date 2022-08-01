import 'package:epicstar/core_utils/colors.dart';
import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String title;
  final bool loading;
  final Color? color;
 final VoidCallback onPress;
  const RoundedButton({Key? key, required this.title, required this.loading, required this.onPress, this.color}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onPress,
        child: Container(
          height: 55,
          width: 200,
          decoration: BoxDecoration(
            color: color ?? AppColors.kPrimaryColor,
              borderRadius: BorderRadius.circular(15),
          ),
          child: loading? CircularProgressIndicator(color: AppColors.whiteTextColor) : Center(
            child: Text(title ,
            style: TextStyle(color: AppColors.whiteTextColor),
        ),
          )
    ),);
  }
}

