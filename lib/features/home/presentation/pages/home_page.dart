import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/core/arg_model/recipe_arg_model.dart';
import 'package:recipe_app/core/network/dio_client.dart';
import 'package:recipe_app/core/values/app_colors.dart';
import 'package:recipe_app/core/values/text_styles.dart';
import 'package:recipe_app/features/home/data/datasources/remote_data_sources.dart/get_recipes_remote_data_source_impl.dart';
import 'package:recipe_app/features/home/data/repositories/get_recipes_repository_impl.dart';
import 'package:recipe_app/features/home/presentation/pages/recipe_details_page.dart';
import 'package:recipe_app/features/home/presentation/widgets/custom_text_field.dart';

import '../../data/models/recipes_response_model.dart';
import '../bloc/home_bloc.dart';

class HomePage extends StatelessWidget {
  static const id = "home_page";

  HomePage({super.key});

  List<Hit>? list;

  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(
          getRecipesRepository: GetRecipesRepositoryImpl(
              getRecipesRemoteDataSource:
                  GetRecipesRemoteDataSourceImpl(dio: DioProvider())))
        ..add(GetRecipesEvent(query: searchController.text)),
      child: BlocListener<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state is RecipesListSuccessState) {
            list = state.recipesResponseModel.hits;
          }
        },
        child: Builder(builder: (context) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            body: SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
                            GetRecipesEvent(query: searchController.text),
                          );
                        },
                      ),
                      prefixIcon: const Icon(
                        Icons.search,
                        color: blackColor,
                      ),
                      onChanged: (key) {
                        BlocProvider.of<HomeBloc>(context).add(
                          GetRecipesEvent(query: searchController.text),
                        );
                        searchController.selection = TextSelection.collapsed(
                          offset: searchController.text.length,
                        );
                      },
                    ),
                    const SizedBox(height: 20),
                    BlocBuilder<HomeBloc, HomeState>(
                      builder: (context, state) {
                        if (state is RecipesLoadingState) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (state is RecipesListSuccessState) {
                          return list!.isEmpty
                              ? const Text('Data Not Found')
                              : Expanded(
                                  child: GridView.builder(
                                      gridDelegate:
                                          const SliverGridDelegateWithMaxCrossAxisExtent(
                                              maxCrossAxisExtent: 200,
                                              childAspectRatio: 3 / 3,
                                              crossAxisSpacing: 20,
                                              mainAxisSpacing: 20),
                                      itemCount: list!.length,
                                      itemBuilder: (BuildContext ctx, index) {
                                        return GestureDetector(
                                          onTap: () {
                                            Navigator.pushNamed(
                                                context, RecipeDetailPage.id,
                                                arguments: RecipeArgModel(
                                                    recipes: list![index]));
                                          },
                                          child: SizedBox(
                                            height: 200,
                                            child: Container(
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                  color: greyColor
                                                      .withOpacity(0.15),
                                                  borderRadius:
                                                      BorderRadius.circular(2)),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Column(
                                                  children: [
                                                    Stack(
                                                      children: [
                                                        AspectRatio(
                                                          aspectRatio: 16 / 13,
                                                          child: Image.network(
                                                            list![index]
                                                                .recipe
                                                                .image,
                                                            fit: BoxFit.fill,
                                                            color:
                                                                blackShadowColor,
                                                            colorBlendMode:
                                                                BlendMode
                                                                    .darken,
                                                          ),
                                                        ),
                                                        Positioned(
                                                          top: 10,
                                                          left: 10,
                                                          child: Text(
                                                            list![index]
                                                                .recipe
                                                                .label,
                                                            maxLines: 2,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            style: const TextStyle(
                                                                color:
                                                                    whiteColor),
                                                          ),
                                                        ),
                                                        Positioned(
                                                          bottom: 10,
                                                          left: 10,
                                                          child: Text(
                                                            list![index]
                                                                .recipe
                                                                .source,
                                                            maxLines: 2,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            style: const TextStyle(
                                                                color:
                                                                    whiteColor),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    const SizedBox(height: 10),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          list![index]
                                                              .recipe
                                                              .calories
                                                              .toString()
                                                              .split('.')[0],
                                                          style: textStyleF12W500(
                                                              color:
                                                                  primaryColor),
                                                        ),
                                                        Text(
                                                          "  CAL ",
                                                          style:
                                                              textStyleF12W500(
                                                                  color:
                                                                      textColor),
                                                        ),
                                                        Container(
                                                          height: 15,
                                                          width: 1,
                                                          color: greyColor,
                                                        ),
                                                        Text(
                                                          list![index]
                                                              .recipe
                                                              .ingredients[0]
                                                              .weight
                                                              .toString()
                                                              .split('.')[0],
                                                          style: textStyleF12W500(
                                                              color:
                                                                  primaryColor),
                                                        ),
                                                        Text(
                                                          "  INGR",
                                                          style:
                                                              textStyleF12W500(
                                                                  color:
                                                                      textColor),
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      }),
                                );
                        }
                        return const Text('Data Not Found');
                      },
                    )
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
