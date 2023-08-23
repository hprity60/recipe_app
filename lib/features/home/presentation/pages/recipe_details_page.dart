import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recipe_app/core/values/app_colors.dart';
import 'package:recipe_app/features/home/data/models/recipes_response_model.dart';

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
      body: SafeArea(
          child: Column(
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
                          onChanged: (key) {
                            // print("KEY>> $key");
                            // print("LIST_LENGTH>> ${list.length}");
                            // Timer(const Duration(milliseconds: 300), () {
                            //   if (key.isEmpty) {
                            //     BlocProvider.of<HomeBloc>(context).add(
                            //       SearchRecipesLoadedEvent(
                            //         recipeData: widget.recipeList,
                            //         searchData: widget.recipeList,
                            //         searchKey: key,
                            //       ),
                            //     );
                            //   } else {
                            //     BlocProvider.of<HomeBloc>(context).add(
                            //       SearchRecipesLoadedEvent(
                            //         recipeData: widget.recipeList,
                            //         searchData: list,
                            //         searchKey: key,
                            //       ),
                            //     );
                            //     searchController.selection = TextSelection.collapsed(
                            //       offset: searchController.text.length,
                            //     );
                          },
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
                  ))
            ],
          ),
        ],
      )),
    );
  }
}
