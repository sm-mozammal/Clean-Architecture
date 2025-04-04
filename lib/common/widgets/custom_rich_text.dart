import 'package:clean_architecture_riverpod/core/constants/app_colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class CustomRichText extends StatelessWidget {
  final String normalText;
  final String highlightedText;
  final VoidCallback onTap;

  const CustomRichText({
    super.key,
    required this.normalText,
    required this.highlightedText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: "$normalText ", // "Don't have an account?"
        style: TextStyle(
          fontSize: 16,
          color: AppColors.c636363,
        ),
        children: [
          TextSpan(
            text: highlightedText, // "Sign up"
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.allPrimaryColor // Change to match your theme
                ),
            recognizer: TapGestureRecognizer()..onTap = onTap,
          ),
        ],
      ),
    );
  }
}
