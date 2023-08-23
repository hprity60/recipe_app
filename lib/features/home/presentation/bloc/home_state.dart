part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class RecipesListSuccessState extends HomeState {
  final RecipesResponseModel recipesResponseModel;

  const RecipesListSuccessState({required this.recipesResponseModel});

  @override
  List<Object> get props => [recipesResponseModel];
}

class RecipesLoadingState extends HomeState {
  @override
  List<Object> get props => [];
}

class RecipesFailureState extends HomeState {
  final String errorMessage;

  const RecipesFailureState({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}

class SearchRecipeLoadedState extends HomeState {
  final List<Hit> recipeData;
  final List<Hit> searchData;

  const SearchRecipeLoadedState({
    required this.searchData,
    required this.recipeData,
  });

  @override
  List<Object> get props => [searchData, recipeData];
}
