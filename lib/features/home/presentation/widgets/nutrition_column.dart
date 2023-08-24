// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:recipe_app/core/values/app_colors.dart';
import 'package:recipe_app/core/values/text_styles.dart';

class NutritionColumn extends StatelessWidget {
  const NutritionColumn({
    Key? key,
    required this.text1,
    required this.text2,
  }) : super(key: key);
  final String text1;
  final String text2;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: greybgColor,
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 2),
                blurRadius: 4,
                spreadRadius: 0,
                color: blackColor.withOpacity(.25),
              )
            ],
            borderRadius: BorderRadius.circular(7),
          ),
          child: Text(
            text1,
            style: textStyleF14W500(color: textColor),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          text2,
          style: textStyleF14W500(color: textColor),
        ),
      ],
    );
  }
}
