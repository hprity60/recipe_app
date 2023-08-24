// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:recipe_app/core/values/app_colors.dart';
import 'package:recipe_app/core/values/text_styles.dart';

class CustomTextStyle extends StatelessWidget {
  const CustomTextStyle({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: textStyleF16W600(color: textColor),
        ),
        const SizedBox(height: 5),
        Container(
          height: 2,
          width: 85,
          color: underlineColor.withOpacity(0.60),
        )
      ],
    );
  }
}
