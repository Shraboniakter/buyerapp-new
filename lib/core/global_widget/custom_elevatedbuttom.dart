import 'package:buyerapp/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomElevatedButtom extends StatelessWidget {
  const CustomElevatedButtom({
    super.key,
    required this.text,
    required this.onTap,
    this.color,
    this.textColor,
  });
  final String text;
  final Color? color;
  final Color? textColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color ?? AppColors.green,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
      onPressed: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14.0),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: textColor ?? AppColors.white,
          ),
        ),
      ),
    );
  }
}
