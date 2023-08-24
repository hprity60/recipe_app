import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recipe_app/core/values/app_colors.dart';
import 'package:recipe_app/features/home/data/models/recipes_response_model.dart';
import 'package:recipe_app/features/home/presentation/widgets/custom_text_style.dart';
import 'package:recipe_app/features/home/presentation/widgets/nutrition_column.dart';

import '../../../../core/values/text_styles.dart';
import '../widgets/custom_text_field.dart';

class RecipeDetailPage extends StatelessWidget {
  static const id = "recipe_detail_page";
  RecipeDetailPage({super.key, required this.recipes});

  final Hit recipes;

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    alignment: Alignment.topRight,
                    width: double.infinity,
                    child: SvgPicture.asset('assets/icons/corner_shape.svg'),
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: SvgPicture.asset(
                              "assets/icons/menu_icon.svg",
                              color: whiteColor,
                            ),
                          ),
                          const SizedBox(width: 15),
                          Expanded(
                            child: CustomTextField(
                              controller: searchController,
                              hintText: "Search",
                              suffixIcon: GestureDetector(
                                child: const Icon(
                                  Icons.clear,
                                  color: greyColor,
                                ),
                                onTap: () {},
                              ),
                              prefixIcon: const Icon(
                                Icons.search,
                                color: blackColor,
                              ),
                              onChanged: (key) {},
                            ),
                          ),
                          const SizedBox(width: 15),
                          SvgPicture.asset(
                            "assets/icons/menu_icon.svg",
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 75,
                    left: 80,
                    right: 80,
                    child: Row(
                      children: [
                        Text(
                          'REFINE SEARCH BY ',
                          style: textStyleF10W300(color: secondaryColor),
                        ),
                        Text(
                          'Calories, Diet, Ingredients',
                          style: textStyleF10W700(color: secondaryColor),
                        ),
                        const Icon(
                          Icons.keyboard_arrow_down,
                          color: secondaryColor,
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    top: 110,
                    left: 20,
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Wok-Fried Duck & \nOyster Sauce',
                              style: textStyleF15W700(),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              'See full recipe on: \nBBC Good Food',
                              style: textStyleF10W500(),
                            ),
                            const SizedBox(height: 15),
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(5),
                                  height: 24,
                                  width: 24,
                                  decoration: BoxDecoration(
                                      color: primaryColor,
                                      borderRadius: BorderRadius.circular(8)),
                                  child: SvgPicture.asset(
                                    "assets/icons/add_icon.svg",
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Container(
                                  padding: const EdgeInsets.all(2),
                                  height: 24,
                                  width: 24,
                                  decoration: BoxDecoration(
                                      color: primaryColor,
                                      borderRadius: BorderRadius.circular(8)),
                                  child: SvgPicture.asset(
                                    "assets/icons/share_icon.svg",
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        const SizedBox(width: 90),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          clipBehavior: Clip.antiAlias,
                          child: Image.network(
                            recipes.recipe.image,
                            height: 150,
                            width: 150,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Health Labels:",
                      style: textStyleF11W600(color: thinColor),
                    ),
                    Row(
                      children: [
                        Chip(
                            label: Text(
                          'Mediterranean',
                          style: textStyleF10W500(),
                        )),
                        const SizedBox(width: 10),
                        Chip(
                            label: Text(
                          'Peanut-Free',
                          style: textStyleF10W500(),
                        )),
                        const SizedBox(width: 10),
                        Chip(
                            label: Text(
                          'Tree-Nut-Free',
                          style: textStyleF10W500(),
                        )),
                      ],
                    ),
                    Text(
                      "Cuisine Type:",
                      style: textStyleF11W600(color: thinColor),
                    ),
                    Chip(
                        label: Text(
                      'Italian',
                      style: textStyleF10W500(),
                    )),
                    const CustomTextStyle(text: "Ingredients"),
                    const SizedBox(height: 10),
                    Container(
                      height: 97,
                      width: 90,
                      decoration: BoxDecoration(
                        color: primaryColor.withOpacity(.4),
                      ),
                      child: Container(
                        height: 50,
                        width: 90,
                        decoration: const BoxDecoration(
                          color: blackColor,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const CustomTextStyle(text: "Preparation"),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Instructions on ',
                          style: textStyleF10W300(color: secondaryColor),
                        ),
                        Text(
                          'BBC Food',
                          style: textStyleF10W700(color: secondaryColor),
                        ),
                        const Icon(
                          Icons.keyboard_arrow_down,
                          color: secondaryColor,
                        )
                      ],
                    ),
                    const SizedBox(height: 10),
                    const CustomTextStyle(text: "Nutrition"),
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(0),
                              bottomLeft: Radius.circular(25),
                              bottomRight: Radius.circular(25),
                              topRight: Radius.circular(25))),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const NutritionColumn(
                              text1: "146", text2: "CAL / SERV"),
                          const SizedBox(width: 10),
                          Container(
                            height: 45,
                            width: 1,
                            color: textColor,
                          ),
                          const SizedBox(width: 10),
                          const NutritionColumn(
                              text1: "7%", text2: "DAILY VALUE"),
                          const SizedBox(width: 10),
                          Container(
                            height: 45,
                            width: 1,
                            color: textColor,
                          ),
                          const SizedBox(width: 10),
                          const NutritionColumn(text1: "8", text2: "SERVINGS"),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    const CustomTextStyle(text: "Tags"),
                    const SizedBox(height: 10),
                    Wrap(
                      children: [
                        Text(
                          "Low-Carb,",
                          style: textStyleF14W500D(
                            color: secondaryColor,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          "Dairy-Free,",
                          style: textStyleF14W500D(
                            color: secondaryColor,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          "Egg-Free,",
                          style: textStyleF14W500D(
                            color: secondaryColor,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          "Peanut-Free,",
                          style: textStyleF14W500D(
                            color: secondaryColor,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          "Tree-Nut-Free,",
                          style: textStyleF14W500D(
                            color: secondaryColor,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          "Soy-Free,",
                          style: textStyleF14W500D(
                            color: secondaryColor,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          "Fish-Free",
                          style: textStyleF14W500D(
                            color: secondaryColor,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(0),
                              bottomLeft: Radius.circular(25),
                              bottomRight: Radius.circular(25),
                              topRight: Radius.circular(25))),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                              Text(
                                'Cholesterol',
                                style: textStyleF14W500(color: textColor),
                              ),
                              Text(
                                'Trans',
                                style: textStyleF14W500(color: textColor),
                              ),
                              Text(
                                'Monounsaturated',
                                style: textStyleF14W500(color: textColor),
                              ),
                              Text(
                                'Polyunsaturated',
                                style: textStyleF14W500(color: textColor),
                              ),
                            ],
                          ),
                          const SizedBox(width: 30),
                          Column(
                            children: [
                              Text(
                                '7g',
                                style: textStyleF14W500(color: textColor),
                              ),
                              Container(
                                height: 1,
                                width: 40,
                                color: blackColor,
                              ),
                              Text(
                                '1g',
                                style: textStyleF14W500(color: textColor),
                              ),
                              Text(
                                '0g',
                                style: textStyleF14W500(color: textColor),
                              ),
                              Text(
                                '4g',
                                style: textStyleF14W500(color: textColor),
                              ),
                              Text(
                                '1g',
                                style: textStyleF14W500(color: textColor),
                              ),
                            ],
                          ),
                          const SizedBox(width: 30),
                          Column(
                            children: [
                              Text(
                                '11%',
                                style: textStyleF14W500(color: textColor),
                              ),
                              Container(
                                height: 1,
                                width: 40,
                                color: blackColor,
                              ),
                              Text(
                                '7%',
                                style: textStyleF14W500(color: textColor),
                              ),
                              Text(
                                '0%',
                                style: textStyleF14W500(color: textColor),
                              ),
                              Text(
                                '0%',
                                style: textStyleF14W500(color: textColor),
                              ),
                              Text(
                                '0%',
                                style: textStyleF14W500(color: textColor),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
