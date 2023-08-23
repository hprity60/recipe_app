import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/core/network/dio_client.dart';
import 'package:recipe_app/features/home/data/datasources/remote_data_sources.dart/get_recipes_remote_data_source_impl.dart';
import 'package:recipe_app/features/home/data/repositories/get_recipes_repository_impl.dart';
import 'package:recipe_app/features/home/presentation/pages/search_list_page.dart';

import '../../data/models/recipes_response_model.dart';
import '../bloc/home_bloc.dart';

class HomePage extends StatelessWidget {
  static const id = "home_page";

  HomePage({super.key});

  late List<Hit> list;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(
          getRecipesRepository: GetRecipesRepositoryImpl(
              getRecipesRemoteDataSource:
                  GetRecipesRemoteDataSourceImpl(dio: DioProvider())))
        ..add(GetRecipesEvent(query: 'chicken')),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: BlocConsumer<HomeBloc, HomeState>(
          listener: (context, state) {
            // if (state is RecipesListSuccessState) {
            //   list = state.recipesResponseModel.hits;
            // } else if (state is SearchRecipeLoadedState) {
            //   list = state.recipeData;
            // }
          },
          builder: (context, state) {
            print("Current state >> $state");

            if (state is RecipesLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is RecipesListSuccessState) {
              // return const Text('Search Anything you want to see');
              return SearchListPage(
                recipeList: state.recipesResponseModel.hits,
                searchList: const [],
              );
            } else if (state is SearchRecipeLoadedState) {
              return SearchListPage(
                recipeList: state.recipeData,
                searchList: state.searchData,
                filter: true,
              );
            }
            return Center(
              child: Container(),
            );
          },
        ),
      ),
    );
  }
}
