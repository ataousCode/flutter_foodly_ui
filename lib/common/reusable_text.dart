import 'package:flutter/material.dart';
import 'package:foodly/common/app_style.dart';

class ReusableText extends StatelessWidget {
  const ReusableText({super.key, required this.text, required this.appStyle});

  final String text;
  final TextStyle appStyle;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppStyles.addressTextStyle,
    );
  }
}
