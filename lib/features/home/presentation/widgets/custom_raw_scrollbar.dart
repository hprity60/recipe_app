// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:recipe_app/features/home/data/models/recipes_response_model.dart';

import '../../../../core/values/app_colors.dart';
import '../../../../core/values/text_styles.dart';

class CustomRawScrollbar extends StatefulWidget {
  const CustomRawScrollbar({
    Key? key,
    required this.recipes,
  }) : super(key: key);

  final Hit recipes;

  @override
  State<CustomRawScrollbar> createState() => _CustomRawScrollbarState();
}

class _CustomRawScrollbarState extends State<CustomRawScrollbar> {
  final ScrollController _firstController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return Row(
        children: <Widget>[
          SizedBox(
              width: constraints.maxWidth,
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(0),
                        bottomLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25),
                        topRight: Radius.circular(25))),
                child: RawScrollbar(
                  thumbColor: blackColor,
                  thickness: 2,
                  thumbVisibility: true,
                  controller: _firstController,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 30),
                        child: Row(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Fat",
                                  style: textStyleF15W700(),
                                ),
                                const Icon(Icons.keyboard_arrow_down),
                              ],
                            ),
                            Spacer(),
                            Row(
                              children: [
                                Text(
                                  "1g",
                                  style: textStyleF15W700(),
                                ),
                                SizedBox(width: 40),
                                Text(
                                  "1%",
                                  style: textStyleF15W700(),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 30),
                            height: 1,
                            width: 80,
                            color: blackColor,
                          ),
                        ],
                      ),
                      Expanded(
                        child: ListView.builder(
                            controller: _firstController,
                            itemCount: 10,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 50, right: 20),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            widget
                                                    .recipes
                                                    .recipe
                                                    .totalNutrients[index]
                                                    ?.label ??
                                                "",
                                            style: textStyleF14W500(
                                                color: textColor),
                                          ),
                                          SizedBox(width: 10),
                                          Text(
                                            '${widget.recipes.recipe.totalNutrients[index]?.quantity.toString().split('.')[0]}${widget.recipes.recipe.totalNutrients[index]?.unit}',
                                            style: textStyleF14W500(
                                                color: textColor),
                                          ),
                                          Text(
                                            '${widget.recipes.recipe.totalDaily[index]?.quantity.toString().split('.')[0]}${widget.recipes.recipe.totalDaily[index]?.unit}',
                                            style: textStyleF14W500(
                                                color: textColor),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              );
                            }),
                      ),
                    ],
                  ),
                ),
              )),
        ],
      );
    });
  }
}
