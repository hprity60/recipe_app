// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import '../../data/models/recipes_response_model.dart';
import '../../domain/repositories/get_recipes_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetRecipesRepository getRecipesRepository;
  late RecipesResponseModel recipesData;
  HomeBloc({required this.getRecipesRepository}) : super(HomeInitial()) {
    on<GetRecipesEvent>((event, emit) async {
      emit(RecipesLoadingState());

      try {
        recipesData =
            await getRecipesRepository.searchRecipe(query: event.query);
        emit(RecipesListSuccessState(recipesResponseModel: recipesData));
      } on DioException {
        rethrow;
      } catch (e) {
        emit(RecipesFailureState(errorMessage: e.toString()));
        rethrow;
      }
    });

    on<SearchRecipesLoadedEvent>((event, emit) {
      List<Hit> searchData = [];
      for (var i = 0; i < event.recipeData.length; i++) {
        if (event.recipeData[i].recipe.label
            .toLowerCase()
            .contains(event.searchKey.toLowerCase())) {
          searchData.add(event.recipeData[i]);
        }
      }
      emit(SearchRecipeLoadedState(
        recipeData: event.recipeData,
        searchData: searchData,
      ));
    });
  }
}
