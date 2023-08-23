import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/core/arg_model/recipe_arg_model.dart';
import 'package:recipe_app/core/values/app_colors.dart';
import 'package:recipe_app/features/home/data/models/recipes_response_model.dart';
import 'package:recipe_app/features/home/presentation/pages/recipe_details_page.dart';
import 'package:recipe_app/features/home/presentation/widgets/custom_text_field.dart';

import '../bloc/home_bloc.dart';

class SearchListPage extends StatefulWidget {
  const SearchListPage(
      {super.key,
      required this.recipeList,
      required this.searchList,
      this.filter = false});

  final List<Hit> recipeList;
  final List<Hit> searchList;
  final bool filter;

  @override
  State<SearchListPage> createState() => _SearchListPageState();
}

class _SearchListPageState extends State<SearchListPage> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final List<Hit> list =
        widget.filter ? widget.searchList : widget.recipeList;

    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: [
          CustomTextField(
            controller: searchController,
            hintText: "Search",
            suffixIcon: GestureDetector(
              child: const Icon(
                Icons.clear,
                color: greyColor,
              ),
              onTap: () {
                searchController.clear();
                BlocProvider.of<HomeBloc>(context).add(
                  SearchRecipesLoadedEvent(
                    recipeData: widget.recipeList,
                    searchData: widget.recipeList,
                    searchKey: "",
                  ),
                );
              },
            ),
            prefixIcon: const Icon(
              Icons.search,
              color: blackColor,
            ),
            onChanged: (key) {
              print("KEY>> $key");
              print("LIST_LENGTH>> ${list.length}");
              Timer(const Duration(milliseconds: 300), () {
                if (key.isEmpty) {
                  BlocProvider.of<HomeBloc>(context).add(
                    SearchRecipesLoadedEvent(
                      recipeData: widget.recipeList,
                      searchData: widget.recipeList,
                      searchKey: key,
                    ),
                  );
                } else {
                  BlocProvider.of<HomeBloc>(context).add(
                    SearchRecipesLoadedEvent(
                      recipeData: widget.recipeList,
                      searchData: list,
                      searchKey: key,
                    ),
                  );
                  searchController.selection = TextSelection.collapsed(
                    offset: searchController.text.length,
                  );
                }
              });
            },
          ),
          // TextField(
          //   controller: searchController,
          //   decoration: InputDecoration(
          //     hintText: "Search",
          //     suffixIcon: GestureDetector(
          //       child: const Icon(
          //         Icons.clear,
          //         color: Colors.grey,
          //       ),
          //       onTap: () {
          //         searchController.clear();
          //         BlocProvider.of<HomeBloc>(context).add(
          //           SearchRecipesLoadedEvent(
          //             recipeData: widget.recipeList,
          //             searchData: widget.recipeList,
          //             searchKey: "",
          //           ),
          //         );
          //       },
          //     ),
          //   ),
          //   onChanged: (key) {
          //     print("KEY>> $key");
          //     print("LIST_LENGTH>> ${list.length}");
          //     Timer(const Duration(milliseconds: 300), () {
          //       if (key.isEmpty) {
          //         BlocProvider.of<HomeBloc>(context).add(
          //           SearchRecipesLoadedEvent(
          //             recipeData: widget.recipeList,
          //             searchData: widget.recipeList,
          //             searchKey: key,
          //           ),
          //         );
          //       } else {
          //         BlocProvider.of<HomeBloc>(context).add(
          //           SearchRecipesLoadedEvent(
          //             recipeData: widget.recipeList,
          //             searchData: list,
          //             searchKey: key,
          //           ),
          //         );
          //         searchController.selection = TextSelection.collapsed(
          //           offset: searchController.text.length,
          //         );
          //       }
          //     });
          //   },
          // ),
          const SizedBox(height: 20),
          list.isNotEmpty
              ? Expanded(
                  child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 200,
                              childAspectRatio: 3 / 3,
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 20),
                      itemCount: list.length,
                      itemBuilder: (BuildContext ctx, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, RecipeDetailPage.id,
                                arguments:
                                    RecipeArgModel(recipes: list[index]));
                          },
                          child: SizedBox(
                            height: 200,
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: greyColor.withOpacity(0.15),
                                  borderRadius: BorderRadius.circular(2)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Stack(
                                      children: [
                                        AspectRatio(
                                          aspectRatio: 16 / 13,
                                          child: Image.network(
                                            list[index].recipe.image,
                                            fit: BoxFit.fill,
                                            color: blackShadowColor,
                                            colorBlendMode: BlendMode.darken,
                                          ),
                                        ),
                                        Positioned(
                                          top: 10,
                                          left: 10,
                                          child: Text(
                                            list[index].recipe.label,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                                color: whiteColor),
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 10,
                                          left: 10,
                                          child: Text(
                                            list[index].recipe.source,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                                color: whiteColor),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          list[index]
                                              .recipe
                                              .calories
                                              .toString()
                                              .split('.')[0],
                                          style: const TextStyle(
                                            color: primaryColor,
                                          ),
                                        ),
                                        const Text("  CAL "),
                                        const SizedBox(width: 5),
                                        Container(
                                          height: 15,
                                          width: 1,
                                          color: greyColor,
                                        ),
                                        const SizedBox(width: 10),
                                        Text(
                                          list[index]
                                              .recipe
                                              .ingredients[0]
                                              .weight
                                              .toString()
                                              .split('.')[0],
                                          style: const TextStyle(
                                              color: primaryColor),
                                        ),
                                        const Text("  INGR"),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                )
              : const Text('Data Not Found'),
        ],
      ),
    )));
  }
}
